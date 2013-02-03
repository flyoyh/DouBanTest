package lib.tip
{
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import utils.ForeKit;

	public class WordTipViewer extends BaseTipViewer
	{
		public function WordTipViewer()
		{
			super();
			if (bg==null) 
			{
				bg=ForeKit.getMovieClicp("ui.lib.WordTip");
				this.addChild(bg);
			}
			txt=bg["txt"];
			txt.autoSize=TextFieldAutoSize.LEFT;
			txt.wordWrap=false;
			txt.selectable=false;
			txt.filters=[new GlowFilter(0x00000,1,4,4,4)];
		}
		private var txt:TextField;
		public function showWordTip(obj:WordTipObj):void
		{
			txt.text=obj.Word;
			initBg();
		}
		private function initBg():void
		{
			bg._bg.width=txt.width+10;
			bg._bg.height=bg["txt"].height;
		}
		private var bg:MovieClip;
		
		private static var _instance:WordTipViewer;
		public static function getInstance():WordTipViewer
		{
			if (_instance==null) 
			{
				_instance=new WordTipViewer();
			}
			return _instance;
		}
	}
}