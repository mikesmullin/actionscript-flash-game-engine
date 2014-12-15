package
{
	import flash.display.Sprite;
	
	import Engine;
	
	import tests.Cube;
	
	[SWF(width="900", height="550", backgroundColor="#000", frameRate="60")]
	public class Main extends Sprite
	{
		public function Main()
		{
			var engine:Engine = new Engine(this);
			engine.bind(new Cube());
			var c2:Cube = new Cube();
			c2.transform.position.x = 200;
			engine.bind(c2);
			engine.run();
		}
	}
}