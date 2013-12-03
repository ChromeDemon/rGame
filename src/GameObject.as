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
		private var speed:Number;
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
				transform();	
			}
			draw();
		}
		
		public function transform():void{
			if (state == "IDLE") {
				yShift += weight;
			}if (state == "RESET") {
				if (x < -50) {
					x = 850;
				}
			}
			y += yShift;
			x += xShift;
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
		
		public function getShift(type:Boolean):Number {
			if (type) {
				return yShift;
			}else {
				return xShift;
			}
		}
		
		public function setActive(isIt:Boolean):void {
			if (isIt) {
				active = true;
			}else {
				active = false;
			}
		}
		
		public function setShift(x:Number,y:Number):void {
			xShift = x;
			yShift = y;
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