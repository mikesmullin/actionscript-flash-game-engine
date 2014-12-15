package components
{
	import Engine;
	
	public interface IComponent
	{
		function start(engine:Engine, cb:Function):void;
		function update(engine:Engine):void;
		function finalUpdate(engine:Engine):void;
		function draw(engine:Engine):void;
		function drawGUI(engine:Engine):void;
		function shutdown(engine:Engine):void;
	}
}