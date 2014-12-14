package
{
	import flash.display.Sprite;
	
	[SWF(width="900", height="550", backgroundColor="#000", frameRate="24")]
	public class Main extends Sprite
	{
		public function Main()
		{
			trace("Hello world!");
			
			graphics.lineStyle(2, 0xeeeeee);
			graphics.beginFill(0xff0000);
			graphics.drawRect(10, 10, 100, 100);
			graphics.endFill();
			x = 20;
			y = 20;
		}
	}
}