package core.cmd;
import openfl.events.Event;
import openfl.events.EventDispatcher;

/**
 * ...
 * @author lion123
 */
class Command extends EventDispatcher
{
	public static var cache:List<Command> = [];
	
	private var executed:Bool = false;
	private var executing:Bool = false;
	
	public function new() 
	{
		/* may include some parameters in extended commands */
	}
	
	private function execInternal():Void
	{
		/* TO-BE-OVERRIDEN */
	}
	
	public function Execute():Void
	{
		if (executed || executing)
		{
			return;
		}
		cache.add(this);
		executing = true;
		execInternal();
	}
	
	private function Complete():Void
	{
		if (!cache.remove(this))
		{
			//TODO:log error - no command? What?
		}
		this.dispatchEvent(new Event(Event.COMPLETE));
		executed = true;
		executing = false;
	}
}