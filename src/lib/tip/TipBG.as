package lib.tip
{
	import base.BaseFace;
	
	public class TipBG extends BaseFace
	{
		public function TipBG()
		{
			super("ui.lib.TipBG");
		}
		override public function set width(val:uint):void
		{
			_bg.width=val;
		}
		override public function height(val:uint):void
		{
			_bg.height=val;
		}
		private static var _instance:TipBG;
		public static function getTipBG():TipBG
		{
			if (_instance==null) 
			{
				_instance=new TipBG();
			}
			return _instance;
		}
	}
}