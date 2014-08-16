package core.utils;
import openfl.Vector;

/**
 * ...
 * @author lion123
 */
class Table2D<T>
{
	private var _list:Vector<T>;
	public var Width:Int;
	public var Height:Int;
	public function new(_width:Int,_height:Int,_prototype:T) 
	{
		Width = _width;
		Height = _height;
		_list = [];
		for (i in 0... _width * _height)
		{
			_list[i] = _prototype;
		}
	}
	
	public function ToArray():Array<T>
	{
		return _list;
	}
	
	public function GetAt(column:Int, row:Int):T
	{
		if (column < 0 || column >= Width)
		{
			throw "Error in Table2D: GetAt Column's index out of range";
		}
		if (row < 0 || row >= Height)
		{
			throw "Error in Table2D: GetAt Row's index out of range";
		}
		return UnsafeGetAt(column, row);
	}
	
	public function SetAt(column:Int, row:Int, value:T):Void
	{
		if (column < 0 || column >= Width)
		{
			throw "Error in Table2D: SetAt Column's index out of range";
		}
		if (row < 0 || row >= Height)
		{
			throw "Error in Table2D: SetAt Row's index out of range";
		}
		UnsafeSetAt(column, row, value);
	}
	
	public function UnsafeGetAt(column:Int, row:Int):T
	{
		return _list[column + row * Width];
	}
	
	public function UnsafeSetAt(column:Int, row:Int, value:T):Void
	{
		_list[column + row * Width] = value;
	}
	
	public function SetColumn(index:Int, values:Vector<T>):Void
	{
		if (index >= Width || index < 0)
		{
			throw "Error in Table2D: Set Column's index out of range";
		}
		for (i in 0...Height)
		{
			_list[index + i * Width] = values[i];
		}
	}
	
	public function GetColumn(index:Int):Vector<T>
	{
		var values:Vector<T> = [];
		if (index >= Width || index < 0)
		{
			throw "Error in Table2D: Get Column's index out of range";
		}
		for (i in 0...Height)
		{
			values[i] = _list[index + i * Width];
		}
		return values;
	}
	
	public function SetRow(index:Int, values:Vector<T>):Void
	{
		if (index >= Height || index < 0)
		{
			throw "Error in Table2D: Set Row's index out of range";
		}
		for (i in 0...Width)
		{
			_list[index * Height + i] = values[i];
		}
	}
	
	public function GetRow(index:Int):Vector<T>
	{
		var values:Vector<T> = [];
		if (index >= Height || index < 0)
		{
			throw "Error in Table2D: Get Row's index out of range";
		}
		for (i in 0...Width)
		{
			values[i] = _list[index * Height + i];
		}
		return values;
	}
	
}