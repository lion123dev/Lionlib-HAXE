package core.cmd;
import core.events.CommandEvent;
import openfl.events.Event;
/**
 * ...
 * @author lion123
 */
class CommandQueue extends Command
{
	
	private var commands:Array<Command> = [];
	private var index:Int = 0;
	
	public function new() 
	{
		
	}
	
	public function Add(command:Command):Void
	{
		if (executed || executing)
		{
			return;
		}
		commands.push(command);
	}
	
	public function Clear():Void
	{
		if (executed || executing)
		{
			return;
		}
		commands = [];
	}
	
	public function Remove(command:Command):Void
	{
		if (executed || executing)
		{
			return;
		}
		commands.remove(command);
	}
	
	private function step(e:Event=null):Void
	{
		if (index > 0)
		{
			index++;
			this.dispatchEvent(new CommandEvent(CommandEvent.PROGRESS, 1 / commands.length));
			commands[index - 1].removeEventListener(Event.COMPLETE, step);
		}
		if (index == commands.length)
		{
			Complete();
			return;
		}
		var current:Command = commands[index];
		current.addEventListener(Event.COMPLETE, step);
		current.Execute();
	}
	
	override function execInternal():Void 
	{
		if (commands.length == 0)
		{
			Complete();
		}else {
			step();
		}
		super.execInternal();
	}
	
}