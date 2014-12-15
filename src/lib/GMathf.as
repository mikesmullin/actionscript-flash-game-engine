package lib
{
	public class GMathf
	{
		public static function repeat(t:Number, length:Number):Number
		{
			return t % length;
		}
		
		public static function oscillate(amplitude:Number, period:Number, x0:Number, time:Number):Number
		{
			return amplitude * Math.sin(time * 2 * Math.PI / period) + x0;
		}
	}
}