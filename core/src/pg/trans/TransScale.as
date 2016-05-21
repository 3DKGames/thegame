package pg.trans {
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import pg.events.TransformEvent;
	
	public class TransScale extends Trans {
		
		private var _tweenSX:Tween;
		private var _tweenSY:Tween;
		
		public function TransScale(mc:Object) {
			_target = mc;
			ease = "easeNone";
		}
		public function transScale($trans:Number):void {
			stop();
			_tweenSX = new Tween(_target, "scaleX", _type[_ease], _target.scaleX, $trans, _speed, true);
			_tweenSY = new Tween(_target, "scaleY", _type[_ease], _target.scaleY, $trans, _speed, true);
			_tweenSY.addEventListener(TweenEvent.MOTION_FINISH, transDone);
		}
		public function stop():void {
			if (_tweenSX != null) {
				_tweenSX.stop();
			}
			if (_tweenSY != null) {
				_tweenSY.stop();
				_tweenSY.removeEventListener(TweenEvent.MOTION_FINISH,transDone);
			}
		}
		private function transDone($evt:TweenEvent):void {
			_tweenSY.removeEventListener(TweenEvent.MOTION_FINISH,transDone);
			dispatchEvent(new TransformEvent(TransformEvent.COMPLETE))
		}
	}
}