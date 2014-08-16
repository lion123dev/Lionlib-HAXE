package core.interfaces;

/**
 * @author lion123
 */

interface IContiniousTerrainGenerator 
{
	var Seed(get, set):Int;
	var Height(get, null):Int;
	
    function GenerateLayer(layerIndex:Int):Array<Int>;
  
}