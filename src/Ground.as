package  
{
	/**
	 * ...
	 * @author Cameron Ceschini
	 */
	import flash.display.BitmapData;
	public class Ground extends GameObject 
	{
		public function Ground(_canvas:BitmapData) 
		{
			super(_canvas);
			setAttributes("RESET",false, R.block, [R.graphic_block]);
			setActive(true);
			setShift(-5, 0);
		}
		override public function act():void{
			if (x < -50) {
				x = 850;
			}
		}
	}
}