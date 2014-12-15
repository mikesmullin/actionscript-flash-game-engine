package
{
	import flash.display.Sprite;
	import Engine;
	import scripts.Game;
	
	[SWF(width="900", height="550", backgroundColor="#000", frameRate="24")]
	public class Main extends Sprite
	{
		public function Main()
		{
			var engine:Engine = new Engine(this);
			engine.bind(new Game());
			engine.run();
		}
	}
}