package mananger
{
	import lib.tip.WordTipObj;
	import lib.tip.WordTipViewer;
	
	import mananger.BaseTipManager;
	
	public class TipManager extends BaseTipManager
	{
		public function TipManager()
		{
			super();
		}
		
		override public function showNowTip():void
		{
			if (nowTipObj is WordTipObj) 
			{
				nowViewer=WordTipViewer.getInstance();
				(nowViewer as WordTipViewer).showWordTip(nowTipObj as WordTipObj);
			}
		//	nowViewer.show
		}
		
		static private var _instance:TipManager;
		static public function getInstance():TipManager
		{
			if (_instance==null) 
			{
				_instance=new TipManager();
			}
			return _instance;
		}
	}
}