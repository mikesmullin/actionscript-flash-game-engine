package tests
{
	import components.Behavior;
	import components.MeshRenderer;
	import components.Transform;
	import lib.Vector3;
	import lib.GMathf;
	
	public class Cube extends Behavior
	{
		public function Cube()
		{
			super();
			this.name = 'Cube';
			this.transform = new Transform(this);
			this.renderer = new MeshRenderer(this);
			this.renderer.materials = new <Object>[{
				lineStyle: [2, 0xff0000, .8],
				fillStyle: [0x660000, .5]
			}];
			this.renderer.arrayType = MeshRenderer.QUADS;
			this.renderer.vertices = new <Vector3>[
				new Vector3(0, 0, 0),
				new Vector3(1, 0, 0),
				new Vector3(1, 1, 0),
				new Vector3(0, 1, 0)
			];
			this.renderer.vcount = new <int>[4];
			this.renderer.indices = new <int>[0, 0, 1, 0, 2, 0, 3, 0];
			
			this.transform.position = new Vector3(100, 100, 0);
			this.transform.localScale = new Vector3(100, 100, 0);
		}
		
		override public function update(engine:Engine):void
		{
			this.transform.position.x = GMathf.oscillate(4, 3, this.transform.position.x, engine.time);
			this.transform.position.y = GMathf.oscillate(2, 5, this.transform.position.y, engine.time);
			this.transform.localScale.x = GMathf.oscillate(2, 5, this.transform.localScale.x, engine.time);
			this.transform.localScale.y = GMathf.oscillate(2, 5, this.transform.localScale.y, engine.time);
			this.transform.rotation.x = GMathf.oscillate(2, 3, 0, engine.time);
		}
		
		override public function finalUpdate(engine:Engine):void
		{
		}
		
		override public function draw(engine:Engine):void
		{
		}
		
		override public function drawGUI(engine:Engine):void
		{
		}
		
		override public function shutdown(engine:Engine):void
		{
		}		
	}
}