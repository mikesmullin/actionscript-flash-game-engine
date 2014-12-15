package lib
{
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	public class Time
	{
		public static function now():int
		{
			return (new Date()).time;
		}
		
		public static function interval(s:Number, f:Function):void
		{
			setInterval(f, s);
		}
		
		public static function delay(s:Number, f:Function):void
		{
			setTimeout(f, s);
		}
	}
}