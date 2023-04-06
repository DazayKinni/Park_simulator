event_inherited();

if PathFinderExists() //tells us this object was created after room start, therefore we need to be added to the grid
{
	PathfinderAddObjects(id);	
}