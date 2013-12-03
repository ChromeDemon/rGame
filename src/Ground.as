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
			setShift(-10, 0);

		}
	}
}