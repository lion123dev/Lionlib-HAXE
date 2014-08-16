package core.data;
import flixel.FlxG;
/**
 * ...
 * @author lion123
 */
class KeyGroup
{
	
	public var name:String;
	private var keys:Array<Int>;
	
	public function new(_name:String, _keys:Array<Int>=null) 
	{
		name = _name;
		if (_keys == null)
		{
			keys = new Array<Int>();
		}else{
			keys = _keys;
		}
	}
	
	public function addKey(key:Int):Void
	{
		keys.push(key);
	}
	
	public function Pressed():Bool
	{
		for (i in keys)
		{
			if (FlxG.keys.pressed.check(i))
			{
				return true;
			}
		}
		return false;
	}
	
	public function JustPressed():Bool
	{
		for (i in keys)
		{
			if (FlxG.keys.justPressed.check(i))
			{
				return true;
			}
		}
		return false;
	}
	
	public function JustReleased():Bool
	{
		for (i in keys)
		{
			if (FlxG.keys.justReleased.check(i))
			{
				return true;
			}
		}
		return false;
	}
}