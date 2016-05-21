package thegame.environment.systems.objects.celestialobjects 
{
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import thegame.units.people.CharDemo0;
	import thegame.units.people.CharDemo0_child;
	import flash.events.Event;
	import thegame.units.people.CharSprite;
	/**
	 * ...
	 * @author David Keys
	 */
	public class CityMelbourne extends City
	{
		
		public function CityMelbourne() 
		{
			_obj_name = "City Melbourne"
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			var $char:CharDemo0_child = new CharDemo0_child();
			$char.x = 100;
			$char.y = 100;
			display.addChar($char);
			$char.addEventListener(MouseEvent.CLICK, onCharFocus);
			$char = new CharDemo0_child();
			$char.x = 200;
			$char.y = 100;
			display.addChar($char);
			$char.addEventListener(MouseEvent.CLICK, onCharFocus);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyEvent);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyEvent);
		}
		
	}

}