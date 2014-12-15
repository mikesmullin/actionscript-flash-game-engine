package scripts
{
	import components.Behavior;
	import components.MeshRenderer;
	import components.Transform;
	import lib.Vector3;
	import lib.GMathf;
	
	public class Game extends Behavior
	{
		public var facing:Number;
		public var flashlightConeAngle:Number;
		public var flashlightRange:int;
		
		public function Game()
		{
			super();
			this.name = 'Game';
			this.transform = new Transform(this);
			this.renderer = new MeshRenderer(this);
			this.renderer.materials = new <Object>[{
				lineWidth: 2,
				strokeStyle: 'rgba(255, 0, 0, .8)',
				fillStyle: 'rgba(25, 0, 0, .5)'
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
			
			this.transform.position = new Vector3(300, 300, 0);
			this.transform.localScale = new Vector3(20, 20, 0);
			this.transform.rotation = new Vector3(0, 0, 0);
			//this.renderer.width = 20;
			//this.renderer.height = 20;
			
			this.facing = 130;
			this.flashlightConeAngle = 60;
			this.flashlightRange = 100;
		}
		
		public function setFacing(angle:Number):void
		{
			this.facing = GMathf.repeat(angle, 360);
		}
		
		override public function update(engine:Engine):void
		{
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