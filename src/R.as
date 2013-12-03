package  
{
	/**
	 * ...
	 * @author Cameron Ceschini
	 */
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	public final class R 
	{
		[Embed(source="sheet.png")]
		public static var Sheet:Class;
		public static var sheet:BitmapData = new Sheet().bitmapData;
		
		[Embed(source="block.png")]
		public static var Block:Class;
		public static var block:BitmapData = new Block().bitmapData;
		
		[Embed(source="player.png")]
		public static var Player:Class;
		public static var player:BitmapData = new Player().bitmapData;
		
		[Embed(source="back.png")]
		public static var Back:Class;
		public static var back:BitmapData = new Back().bitmapData;
		
		public static var graphic_block:Rectangle = new Rectangle(0, 0, 50, 50);
		public static var graphic_player:Rectangle = new Rectangle(0,0,50,50);
		public static var wl1:Rectangle = new Rectangle(84,0,41,84);
		public static var wl2:Rectangle = new Rectangle(42, 83, 42, 84);
		public static var wl3:Rectangle = new Rectangle(0, 84, 42, 83);
		public static var wr1:Rectangle = new Rectangle(125, 0, 41, 84);
		public static var wr2:Rectangle = new Rectangle(0, 0, 42, 84);
		public static var wr3:Rectangle = new Rectangle(42, 0, 42, 83);
		public static var anim_wr:Array = [wr1, wr2, wr3];
		
	}

}