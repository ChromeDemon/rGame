package  
{
	/**
	 * @author Cameron Ceschini
	 */
	import flash.display.BitmapData;
	import flash.geom.Point;
	public class GameObject 
	{
		private var sheetBMD:BitmapData;
		private var rects:Array;
		private var canvas:BitmapData;
		private var pos:Point = new Point();
		private var animIndex:int = 0;
		private var animTime:int = 0;
		private var count:int = 0;
		private var active:Boolean = false;
		
		private var state:String;
		private var onGround:Boolean = false;
		private var yShift:Number = 0;
		private var weight:Number = 0;
		private var xShift:Number = 0;
		
		public var animate:Boolean;
		public var x:Number=0;
		public var y:Number=0;
		public var w:Number=0;
		public var h:Number=0;
		
		public function GameObject(_canvas:BitmapData){
			canvas = _canvas;
		}
		public function render():void {
			if (active) {
				act();
				move();
			}
			draw();
		}
		public function act():void{
		}
		public function move():void{
			x += xShift;
			y += yShift;
		}
		
		private function draw():void{
			pos.x = x - rects[animIndex].width * 0.5;
			pos.y = y - rects[animIndex].height * 0.5;
			canvas.copyPixels(sheetBMD, rects[animIndex], pos);
			if (count % 4== 0 && animate){
				animIndex = (animIndex === rects.length - 1) ? 0 : animIndex + 1;
			}
			count++;
		}
		
		public function setShift(x:Number, y:Number):void {
			if (x != .1) {
				xShift = x;
			}
			if (y != .1) {
				yShift = y;
				trace(yShift);
			}
		}
		public function getShift(type:Boolean):Number {
			if (type) {
				return xShift;
			}else {
				return yShift;
			}
		}
		
		public function setActive(isIt:Boolean):void {
			if (isIt) {
				active = true;
			}else {
				active = false;
			}
		}
		
		public function setAttributes(state:String, anim:Boolean, b:BitmapData , r:Array):void {
			this.state = state;
			this.animate = anim;
			this.sheetBMD = b;
			this.rects = r;
			this.w=rects[animIndex].width*1.1;
			this.h = rects[animIndex].height * 1.1;
		}
		
		public function playAnim(animation:Array,frame:int):void{
			rects = animation
			animIndex = frame
		}
		
	}
}