package thegame.environment.displays.city 
{
	import flash.display.DisplayObject;
	import thegame.environment.displays.Displays;
	/**
	 * ...
	 * @author David Keys
	 */
	public class DisplayCity extends Displays
	{
		
		public function DisplayCity() 
		{
			
		}
		public function addChar($char:DisplayObject) {
			addChild($char);
		}
		
	}

}