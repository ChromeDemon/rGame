package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.Graphics;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	
	[SWF(width="800",height="600",frameRate=60)]
	public class Main extends Sprite {
		
		private var canvas:BitmapData;
		private var zeroPoint:Point = new Point;
		private var coreTree:Tree = new Tree;
		private var PlayerCharacter:GameObject;
		private var collisionHull1:Rectangle;
		private var collisionHull2:Rectangle;
		private var ct:Number = 0;
		private var xShiftWorld:Number = 0;
		private var yShiftWorld:Number = 0;
		
		public function Main() {
			canvas = new BitmapData(800,600,false);
			addChild(new Bitmap(canvas));
			for (var i:int = 1; i < 20; i++) {
				makeObject(0, i*50-50, 550);
			}
			for (var i2:int = 1; i2 < 20; i2++) {
				makeObject(0, i2*50-50, 600);
			}
			makeObject(1, 650, 483);
			addChild( new Stats() );
			addEventListener(Event.ENTER_FRAME, loop);
		}
		protected function makeObject(ID:Number, _x:Number, _y:Number):void {
			if (ID == 1) {
				var character:Player = new Player(canvas);
				character.x = _x;
				character.y = _y;
				PlayerCharacter = character;
				coreTree.addChild(character);
			}else{
				var ground:Ground = new Ground(canvas);
				ground.x = _x;
				ground.y = _y;
				coreTree.addChild(ground);
			}
		}
		
		protected function cameraControl(_xShift:Number,_yShift:Number):void {
			for (var inObject:int = 0; inObject < coreTree.numChildren(); inObject++) {
				coreTree.children[inObject].x -= _xShift;
				coreTree.children[inObject].y -= _yShift;
			}
		}
		
		protected function loop(event:Event):void {
			canvas.lock();
			canvas.copyPixels(R.back, canvas.rect, zeroPoint);
			for (var inObject:int = 0; inObject < coreTree.numChildren(); inObject++) {
				coreTree.children[inObject].render();
				/* COLLISION?
				for (var testObject:int = 0; testObject < coreTree.numChildren(); testObject++) {
					if (inObject == testObject) {
					}else {
						collisionHull1= new Rectangle()
					}
				}
				*/
			}
			canvas.unlock();
		}
	}
}