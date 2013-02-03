package lib.tip
{
	import base.AbsView;
	
	public class BaseTipViewer extends AbsView
	{
		public function BaseTipViewer()
		{
			super();
		}
		public function reset():void
		{
			while(this.numChildren)
			{
				this.removeChildAt(0);
			}
		}
	}
}