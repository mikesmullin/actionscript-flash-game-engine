package components
{
	import flash.display.Sprite;
	import lib.Vector3;

	public class MeshRenderer
	{
		public var enabled:Boolean;
		public var object:Behavior;
		public var materials:Vector.<Object> = new Vector.<Object>();
		
		public static const QUADS:int = 0;
		public var arrayType:int;
		public var vertices:Vector.<Vector3>;
		public var vcount:Vector.<int>;
		public var indices:Vector.<int>;
		
		public function MeshRenderer(object:Behavior):void
		{
			this.enabled = true;
			this.object = object;
		}
		
		public function draw(engine:Engine):void {
			var stage:Sprite = this.object.engine.stage;
			stage.graphics.lineStyle(2, 0xeeeeee);
			stage.graphics.beginFill(0xff0000);
			stage.graphics.drawRect(10, 10, 100, 100);
			stage.graphics.endFill();
			stage.x = 20;
			stage.y = 20;
		}
	}
}