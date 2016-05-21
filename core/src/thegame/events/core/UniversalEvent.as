package thegame.events.core 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class UniversalEvent extends Event
	{
		
		public static const TIME_EVENT : String = "timer has ticked";
		public static const FOCUS_ON_OBJECT : String = "focus on object";
		
		
		public var arg:*;

		public function UniversalEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, ... a:*) {
			super(type, bubbles, cancelable);
			arg = a;

		}
 // Override clone
		override public function clone():Event{
			return new UniversalEvent(type, bubbles, cancelable, arg);
		}
	}
 }