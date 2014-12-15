package components
{
	import Engine;
	
	public class Behavior implements IComponent
	{
		public var enabled:Boolean;
		public var engine:Engine;
		public var name:String;
		
		// attachments
		public var renderer:MeshRenderer = null;
		public var transform:Transform;
		public var scripts:Object;
		
		public function Behavior():void
		{
			this.enabled = true; // enabled behaviors are updated, disabled are not
			this.transform = null;
			this.scripts = new Vector.<Behavior>();
		}
		
		public function bindScript(cls:Script):void
		{
			this.scripts[cls.name] = new cls(this);
		}
		
		
		public function start(engine:Engine, cb:Function):void
		{
		}
		
		public function update(engine:Engine):void
		{
		}
		
		public function finalUpdate(engine:Engine):void
		{
		}
		
		public function draw(engine:Engine):void
		{
		}
		
		public function drawGUI(engine:Engine):void
		{
		}
		
		public function shutdown(engine:Engine):void
		{
		}
	}
}