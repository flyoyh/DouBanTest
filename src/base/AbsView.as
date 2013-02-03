package base
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	public class AbsView extends Sprite
	{
		public function AbsView()
		{
			super();
		}
		private var parentContainer:DisplayObjectContainer;
		
		public function show():void
		{
			if (this.parent is Sprite) 
			{
				this.parentContainer=this.parent;
			}
			if (this.parentContainer!=null) 
			{
				if (!this.parentContainer.contains(this)) 
				{
					this.parentContainer.addChild(this);
				}
			}
			this.visible=true;
		}
		public function hide(bRemove:Boolean=true):void
		{
			if (bRemove) 
			{
				if (this.parentContainer!=null) 
				{
					if (this.parentContainer.contains(this)) 
					{
						this.parentContainer.removeChild(this);
					}
				}
			}
			else
			{
				
			}
			this.visible=false;
		}
	}
}