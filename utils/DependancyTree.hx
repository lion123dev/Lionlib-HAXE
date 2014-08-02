package core.utils;
import core.data.DependantNode;
import core.interfaces.IOpenable;
import flash.utils.Dictionary;

/**
 * ...
 * @author lion123
 */
class DependancyTree
{
	private var nodes:List<DependantNode>;
	private var neededIds:List<String>;
	
	public function new() 
	{
		Nodes = new List<DependantNode>();
		neededIds = new List<String>();
		//TODO: implement needIds for optimisation
	}
	
	public function RegisterNewNode(refresh:Bool, id:String, depends:Array<String>, object:IOpenable = null):Void
	{
		nodes.add(new DependantNode(id, depends, object));
		if (refresh)
		{
			CheckAll();
		}
	}
	
	public function IdNeeded(id:String):Bool
	{
		for (n in neededIds.iterator())
		{
			if (n == id)
			{
				return true;
			}
		}
		return false;
	}
	
	public function GetNodeById(atId:String):DependantNode
	{
		for (n in nodes.iterator())
		{
			if (n.Name == atId)
			{
				return n;
			}
		}
		return null;
	}
	
	public function OnCompleted(atId:String):Bool
	{
		var completedNode:DependantNode = GetNodeById(atId);
		if (completedNode == null)
		{
			return false;
		}
		completedNode.Data.Completed = true;
		if (IdNeeded(atId))
		{
			return CheckAll();
		}
		return false;
	}
	
	public function CheckId(atId:String):Bool
	{
		var somethingChanged:Bool = false;
		//TODO:implement
		return CheckAll();
	}
	
	public function CheckAll():Bool
	{
		var somethingChanged:Bool = false;
		var strs:List<String>;
		var dep2:DependantNode;
		var broken:Bool;
		for (dep in nodes.iterator())
		{
			if (dep.Data.Opened)
			{
				continue;
			}
			strs = dep.Depends.iterator();
			if (!strs.hasNext())
			{
				continue;
			}
			broken = false;
			for (str in strs.iterator())
			{
				dep = GetNodeById(str);
				if (!dep || !dep.Data.Completed)
				{
					broken = true;
					break;
				}
			}
			if (broken)
			{
				continue;
			}
			//if we got this far, everything's alright
			somethingChanged = true;
			dep.Data.Opened = true;
		}
		return somethingChanged;
	}
	
}