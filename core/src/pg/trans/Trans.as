package pg.trans 
{
	import flash.events.EventDispatcher;
	import gs.easing.Linear;
	import gs.easing.Back;
	import gs.easing.Bounce;
	import gs.easing.Quad;
	/**
	 * ...
	 * @author david keys
	 */
	public class Trans extends EventDispatcher
	{
		protected var _target:Object;
		protected var _speed:Number=0.5;
		protected var _type:Class;
		protected var _ease:String = "easeIn";
		
		public function Trans() {
			type = "Linear";
		}
		public function set speed($speed:Number):void {
			_speed = $speed;
		}
		public function get speed():Number {
			return _speed;
		}
		public function set type($type:String):void {
			if ($type == "Bounce") {
				_type = Bounce;
			} else if ($type == "Linear") {
				_type = Linear;
			} else if ($type == "Quad") {
				_type = Quad;
			} else if ($type == "Back") {
				_type = Back;
			} else {
				_type = Linear;
			}
		}
		public function set ease($ease:String):void {
			_ease = $ease;
		}
		public function get ease():String {
			return _ease;
		}

	}

}