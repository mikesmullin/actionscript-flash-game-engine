package
{
	import flash.display.Sprite;
	
	import components.Behavior;
	import components.Script;
	
	import lib.Input;
	import lib.Time;

	public class Engine //implements IComponent
	{
		public var objects:Vector.<Behavior>;
		public var stage:Sprite;
		public var started:int;
		public var time:int;
		public var running:Boolean;
		public var fps:int = 24;
		public var actualFPS:int;
		public var deltaTime:Number;
		
		public function Engine(stage:Sprite):void
		{
			this.stage = stage;
			this.objects = new Vector.<Behavior>();
			this.running = false;
		}
		
		public function log(msg:String):void
		{
			trace(msg);
		}
		
		public function info(msg:String, lines:int, color:String, size:int):void
		{
			//trace(msg);
		}
		
		public function bind(obj:Behavior):void
		{
			obj.engine = this;
			objects.push(obj);
		}
		
		public function getObject(name:String):Behavior
		{
			for (var obj:Behavior in this.objects) {
				if (obj.name == name) {
					return obj;
				}
			}
			return null;
		}
		
		public function start(engine:Engine, cb:Function):void
		{
			this.started = Time.now();
			this.time = 0;
			Input.start(this, cb);
		}
		
		public function run():void
		{
			this.running = true;
			this.log('Starting at '+(new Date()));
			
			var _this:Engine = this;
			this.trigger('start', function():void
			{
				var updateInterval:Number = 1000/_this.fps;
				var maxUpdateLatency:Number = updateInterval * 1;
				var drawInterval:Number = 1000/_this.fps;
				var skippedFrames:int = 1;
				var maxSkipFrames:int = 5;
				var nextUpdate:int = Time.now();
				var framesRendered:int = 0;
				_this.actualFPS = 0;
				Time.interval(1000, function():void
				{
					_this.actualFPS = framesRendered;
					framesRendered = 0;
				});
				_this.deltaTime = 0;
				var lastFrameStarted:Number = 0;
				
				//var ticks:int = 0;
				var tick:Function = function():void
				{
//					if (ticks++ > 7) {
//						return;
//					}
					var next:Function = function():void
					{
						if (_this.running) {
							tick();
						}
					}
					var now:int = Time.now();
					if (lastFrameStarted) {
						_this.deltaTime = (now - lastFrameStarted) / 1000;
					}
					lastFrameStarted = now;
					
					if (nextUpdate - maxUpdateLatency > now) {
						nextUpdate = now;
					}
					
					if (now >= nextUpdate) {
						nextUpdate += updateInterval;
						_this.triggerSync('update');
						_this.triggerSync('finalUpdate');
						
						if (Time.now() > nextUpdate &&
							skippedFrames < maxSkipFrames)
						{
							skippedFrames++;
						}
						else
						{
							_this.triggerSync('draw');
							_this.triggerSync('drawGUI');
							framesRendered++;
							skippedFrames = 0;
						}
					}
					else
					{
						var sleepTime:Number = nextUpdate - now;
						if (sleepTime > 0) {
							return Time.delay(sleepTime, next);
						}
					}
					next();
				};
				
				tick();
			});
		}
		
		public function update(engine:Engine):void
		{
		}
		
		public function finalUpdate(engine:Engine):void
		{
			Input.finalUpdate(engine);
		}
		
		public function draw(engine:Engine):void
		{
			this.time = (Time.now() - this.started) / 1000;
			this.stage.graphics.clear();
		}
		
		public function drawGUI(engine:Engine):void
		{
			this.info(this.actualFPS.toString(), 1, 'lime', 45);
		}
		
		public function stop(engine:Engine):void
		{
			this.running = false;
			this.triggerSync('shutdown');
		}
		
		public function shutdown(engine:Engine):void
		{
		}
		
		public function triggerSync(event:String, ... args):void
		{
			args.unshift(this);
			this[event].apply(this, args);
			for each (var obj:Behavior in this.objects) {
				if (!obj.enabled) {
					continue;
				}
				if (event in obj) {
					obj[event].apply(obj, args);
				}
				for each (var component:String in ['renderer', 'collider']) {
					if (component in obj && obj[component].enabled && event in obj[component]) {
						obj[component][event].apply(obj[component], args);
					}
				}
				for each (var script:Script in obj.scripts) {
					if (script.enabled && event in script) {
						script[event].apply(script, args);
					}
				}
			}
		}
		
		public function triggerObjectSync(event:String, obj:Behavior, ... args):void
		{
			args.unshift(this);
			obj[event].apply(obj, args);
		}
		
		public function trigger(event:String, cb:Function):void
		{
			this[event].call(this, this, cb);
		}
	}
}