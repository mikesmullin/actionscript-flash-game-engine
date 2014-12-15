package components
{
	import lib.Vector3;

	public class MeshRenderer
	{
		public var object:Behavior;
		public var materials:Vector.<Object> = new Vector.<Object>();
		
		public static const QUADS:int = 0;
		public var arrayType:int;
		public var vertices:Vector.<Vector3>;
		public var vcount:Vector.<int>;
		public var indices:Vector.<int>;
		
		public function MeshRenderer(object:Behavior)
		{
			this.object = object;
			
//			graphics.clear();
			
//			graphics.lineStyle(2, 0xeeeeee);
//			graphics.beginFill(0xff0000);
//			graphics.drawRect(10, 10, 100, 100);
//			graphics.endFill();
//			x = 20;
//			y = 20;
		}
	}
}