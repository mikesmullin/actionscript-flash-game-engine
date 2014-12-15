package lib
{
	public class Visibility
	{
		private var segments:Vector.<Segment>;
		private var endpoints:Vector.<Endpoint>;
		private var center:Point;
		private var open:Vector.<Segment>;
		private var output:Vector.<Point>;
		
		public function Visibility():void
		{
			this.segments = new Vector.<Segment>();
			this.endpoints = new Vector.<Endpoint>();
			this.center = new Point(0.0, 0.0);
			this.open = new Vector.<Segment>();
			this.output = new Vector.<Point>();
		}
		
		public function resetSegments():void
		{
			this.segments = new Vector.<Segment>();
			this.endpoints = new Vector.<Endpoint>();
		}
		
		public function addSegments(segments:Vector.<Segment>):void
		{
			for (var seg:Segment in segments) {
				this.addSegment(seg.p1.x, seg.p1.y, seg.p2.x, seg.p2.y);
			}
		}
		
		public function addSegment(x1:Number, y1:Number, x2:Number, y2:Number):void
		{
			
		}
	}
}

class Point
{
	public var x:Number, y:Number;
	public function Point(x:Number=0.0, y:Number=0.0):void
	{
		this.x = x;
		this.y = y;
	}
}

class Segment
{
	public var p1:Point, p2:Point, d:Number;
	public function Segment(p1:Point, p2:Point, d:Number=null):void
	{
		this.p1 = p1;
		this.p2 = p2;
		this.d = d;
	}
}

class Endpoint
{
	public var begin:Boolean;
	public var segment:Segment;
	public var angle:Number;
	public var visualize:Boolean;
	public function Endpoint(begin:Boolean = false, segment:Segment = null, angle:Number = 0.0, visualize:Boolean = false)
	{
		this.begin = begin;
		this.segment = segment;
		this.angle = angle;
		this.visualize = visualize;
	}
}