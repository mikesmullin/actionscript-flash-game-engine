package components
{
	import lib.Vector3;
	
	public class Transform
	{
		// world
		public var position:Vector3;
		public var rotation:Vector3;
		public var lossyScale:Vector3;
		
		// local
		public var localPosition:Vector3;
		public var localRotation:Vector3;
		public var localScale:Vector3;
		
		public var object:Behavior;
		
		public function Transform(object:Behavior)
		{
			this.object = object;
			
			this.position = new Vector3(0.0, 0.0, 0.0);
			this.rotation = new Vector3(0.0, 0.0, 0.0);
			this.lossyScale = new Vector3(1.0, 1.0, 1.0);
			
			this.localPosition = new Vector3(0.0, 0.0, 0.0);
			this.localRotation = new Vector3(0.0, 0.0, 0.0);
			this.localScale = new Vector3(1.0, 1.0, 1.0);
		}
		
		public function translate():void
		{
			// TODO: implement
		}
		
		public function rotate():void
		{
			// TODO: implement
		}
	}
}