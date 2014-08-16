package core.utils;

import core.interfaces.IContiniousTerrainGenerator;
import core.interfaces.ITilemapMutator;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author lion123
 */
class ContiniousTerrainMapRight extends FlxGroup
{
	private var provider:IContiniousTerrainGenerator;
	private var mutator:ITilemapMutator;
	public var map:FlxTilemap;
	private var mapHeight:Int;
	private var mapWidth:Int;
	
	private var tileHeight:Int;
	private var tileWidth:Int;
	private var tileGraphic:Dynamic;
	
	private var iterationsPassed:Int;
	
	public function new(terrainProvider:IContiniousTerrainGenerator, _tileWidth:Int, _tileHeight:Int, _tileGraphic:Dynamic, visibleWidth:Int=32, flxTilemapMutator:ITilemapMutator) 
	{
		super();
		mutator = flxTilemapMutator;
		provider = terrainProvider;
		mapHeight = provider.Height;
		mapWidth = visibleWidth;
		tileGraphic = _tileGraphic;
		tileHeight = _tileHeight;
		tileWidth = _tileWidth;
		iterationsPassed = 0;
		newIteration();
	}
	
	private function prevIteration():Void
	{
		iterationsPassed --;
		newIteration();
		iterationsPassed --;
	}
	
	private function newIteration():Void
	{
		var normalIterator:Int = 0;
		var utilTable:Table2D<Int> = new Table2D<Int>(mapWidth * 3, mapHeight, 0);
		for (i in iterationsPassed * mapWidth ...(iterationsPassed+3)*mapWidth)
		{
			utilTable.SetColumn(normalIterator, provider.GenerateLayer(i));
			normalIterator++;
		}
		if (map != null)
		{
			remove(map);
		}
		map = new FlxTilemap();
		mutator.mutateTilemap(map);
		map.widthInTiles = mapWidth * 3;
		map.heightInTiles = mapHeight;
		map.loadMap(utilTable.ToArray(), tileGraphic, tileWidth, tileHeight);
		map.x -= tileWidth * mapWidth;
		add(map);
		iterationsPassed++;
	}
	
	override public function update():Void 
	{
		super.update();
		
	}
	
	public function MoveByX(amount:Float):Void
	{
		map.x += amount;
		var prevX:Float = map.x;
		//default: x=0  needs to move mapW*tileW
		if (prevX > 0)
		{
			newIteration();
			map.x += prevX;
			return;
		}
		if (prevX < - 2*mapWidth * tileWidth)
		{
			prevIteration();
			map.x += prevX + 2 * mapWidth * tileWidth;
			return;
		}
	}
}