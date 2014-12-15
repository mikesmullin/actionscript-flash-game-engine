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
		
		public function draw(engine:Engine):void
		{
			var stage:Sprite = engine.stage;
			stage.graphics.lineStyle.apply(stage.graphics, this.materials[0].lineStyle);
			stage.graphics.beginFill.apply(stage.graphics, this.materials[0].fillStyle);
			
			var wv:Vector.<Vector3> = new Vector.<Vector3>();
			for each (var vec3:Vector3 in this.vertices) {
				wv.push(vec3.clone()
					.rotateX(this.object.transform.rotation.x)
					.scale(this.object.transform.localScale)
					.add(this.object.transform.position)
				);
			}
			
			var offset:int = 0;
			for each (var step:int in this.vcount) {
				var x0:int, x:int, y0:int, y:int;
				x0 = x = wv[this.indices[offset]].x;
				y0 = y = wv[this.indices[offset]].y;
				stage.graphics.moveTo(x, y);
				for (var i:int = offset+2; i <= offset+((step-1)*2); i+=2) {
					x = wv[this.indices[i]].x;
					y = wv[this.indices[i]].y;
					stage.graphics.lineTo(x, y);
				}
				offset = i;
				stage.graphics.moveTo(x, y);
				stage.graphics.lineTo(x0, y0);
				stage.graphics.endFill();
			}
		}
	}
}