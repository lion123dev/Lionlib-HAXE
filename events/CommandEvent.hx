package core.events;

import openfl.events.Event;

/**
 * ...
 * @author lion123
 */
class CommandEvent extends Event
{

	public static var PROGRESS:String = "CommandProgress";
	
	public var Amount:Float;
	public function new(type:String,amount:Float) 
	{
		super(type);
		Amount = amount;
	}
	
}