package lib
{
	public class Vector3
	{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		public function Vector3(x:Number=0.0, y:Number=0.0, z:Number=0.0):void
		{
			this.x = x;
			this.y = y;
			this.z = z;
		}
		
		public function rotateX(angle:Number):Vector3
		{
			var nx:Number = (this.x * Math.cos(angle)) - (this.y * Math.sin(angle));
			var ny:Number = (this.x * Math.sin(angle)) + (this.y * Math.cos(angle));
			this.x = nx;
			this.y = ny;
			return this; // chainable
		}
		
		public function scale(b:Vector3):Vector3
		{
			this.x *= b.x;
			this.y *= b.y;
			this.z *= b.z;
			return this;
		}
		
		public function add(b:Vector3):Vector3
		{
			this.x += b.x;
			this.y += b.y;
			this.z += b.z;
			return this;
		}
		
		public function clone():Vector3
		{
			return new Vector3(this.x, this.y, this.z);
		}
	}
}