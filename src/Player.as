package  
{
	/**
	 * ...
	 * @author Cameron Ceschini
	 */
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
    import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	public class Player extends GameObject {
		
		private var key:Object;
		
		public function Player(_canvas:BitmapData){
			super(_canvas);
			setAttributes("IDLE",true,R.sheet, R.anim_wr);
			setActive(true);
		}
		public function jump():void{
			setShift(.1, -5);
		}
	}
}