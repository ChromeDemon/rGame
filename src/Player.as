package  
{
	/**
	 * ...
	 * @author Cameron Ceschini
	 */
	import flash.display.BitmapData;
	public class Player extends GameObject
	{
		public function Player(_canvas:BitmapData) 
		{
			super(_canvas);
			setAttributes("IDLE",true,R.sheet, R.anim_wr);
			setActive(false);
		}
	}
}