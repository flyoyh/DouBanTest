package base
{
	import flash.display.MovieClip;
	
	import mananger.TipManager;
	
	import utils.ForeKit;

	public class BaseFace extends AbsView
	{
		public function BaseFace(_id:String)
		{
			super();
			id=_id;
			if (id!="") 
			{
				_bg=ForeKit.getMovieClicp(id);
				
			}
			if (_bg!=null) 
			{
				_bg.x=0;
				_bg.y=0;
				this.addChild(_bg);
			}
			else
			{
				throw new Error("获取类失败!");
			}
			this.tipManager=TipManager.getInstance();
		}
		protected var tipManager:TipManager;
		private var id:String;
		protected var _bg:MovieClip;
	}
}