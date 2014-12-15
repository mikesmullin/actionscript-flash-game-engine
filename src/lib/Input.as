package lib
{
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	public class Input
	{
		public static function start(engine:Engine, cb:Function):void
		{
			cb();
		}
		
		public static function finalUpdate(engine:Engine):void
		{
			
		}
	}
}