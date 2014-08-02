package core.data;
import core.interfaces.IOpenable;

/**
 * ...
 * @author lion123
 */

//it's actually more like a struct, not a class :D
class DependantNode
{
	
	public var Depends:List<String>;
	public var Name:String;
	public var Data:IOpenable;
	
	public function new(name:String,depends:List<String>,data:IOpenable) 
	{
		Depends = depends;
		Name = name;
		Data = data;
	}
	
}