package  
{
	/**
	 * ...
	 * @author Cameron Ceschini
	 */
	public class Tree 
	{
		public var children:Array=new Array;
		
		public function Tree() 
		{
			
		}
		public function kill():void
		{
			children.splice(0);
		}
		public function addChild(child:GameObject):void 
		{
			children.push(child);
		}
		public function numChildren():int
		{
			return children.length;
		}
		
	}

}