package thegame.environment.Gallaxies 
{

	import thegame.environment.systems.StarSystem;
	import thegame.environment.systems.StarSystem0;
	import thegame.environment.systems.StarSystem0_child;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Gallaxy0 extends Gallaxy 
	{
		private var _system0:StarSystem;
		public function Gallaxy0() 
		{
			super();
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			_system0 = new StarSystem0_child();
			addChild(_system0);
		}
	}

}