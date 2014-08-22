package core.init;
import flixel.FlxG;
import core.data.KeyGroup;
/**
 * ...
 * @author lion123
 */
class KeyAlias
{

	public function new() {	}
	private static var keyGroups:Array<KeyGroup> = [];
	
	public static function AddAlias(group:String, key:Int):Void
	{
		var keyGroup:KeyGroup = GetGroup(group);
		if (keyGroup == null)
		{
			keyGroup = new KeyGroup(group);
			keyGroups.push(keyGroup);
		}
		keyGroup.addKey(key);
	}
	
	public static function AddAliases(group:String, keys:Array<Int>):Void
	{
		var keyGroup:KeyGroup = GetGroup(group);
		if (keyGroup == null)
		{
			keyGroup = new KeyGroup(group);
			keyGroups.push(keyGroup);
		}
		for (i in keys)
		{
			keyGroup.addKey(i);
		}
	}
	
	private static function GetGroup(name:String):KeyGroup
	{
		for (i in keyGroups)
		{
			if (i.name == name)
			{
				return i;
			}
		}
		return null;
	}
	
	public static function Pressed(group:String):Bool
	{
		var keyGroup:KeyGroup = GetGroup(group);
		if (keyGroup == null)
		{
			return false;
		}
		return keyGroup.Pressed();
	}
	
	public static function JustPressed(group:String):Bool
	{
		var keyGroup:KeyGroup = GetGroup(group);
		if (keyGroup == null)
		{
			return false;
		}
		return keyGroup.JustPressed();
	}
	
	public static function JustReleased(group:String):Bool
	{
		var keyGroup:KeyGroup = GetGroup(group);
		if (keyGroup == null)
		{
			return false;
		}
		return keyGroup.JustReleased();
	}
	
}