package pg.trans {
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import pg.events.TransformEvent;
	
	public class TransAlpha extends Trans {
		
		private var _tweenAlpha:Tween;
		
		public function TransAlpha(mc:Object) {
			_target = mc;
			ease = "easeNone";
		}
		public function transAlpha($trans:Number):void {
			stop();
			_tweenAlpha = new Tween(_target, "alpha", _type[_ease], _target.alpha, $trans, _speed, true);
			_tweenAlpha.addEventListener(TweenEvent.MOTION_FINISH, transDone);
		}
		public function stop():void {
			if (_tweenAlpha != null) {
				_tweenAlpha.stop();
				_tweenAlpha.removeEventListener(TweenEvent.MOTION_FINISH,transDone);
			}
		}
		private function transDone($evt:TweenEvent):void {
			_tweenAlpha.removeEventListener(TweenEvent.MOTION_FINISH,transDone);
			dispatchEvent(new TransformEvent(TransformEvent.COMPLETE))
		}
	}
}