package lib.tip
{
	public final class WordTipObj extends BaseTipObj
	{
		public function WordTipObj(_str:String)
		{
			super();
			str=_str;
			
		}
		public function get Word():String
		{
			return str;
		}
		public function set Word(_str:String):void
		{
			str=_str;
		}
		private var str:String;
	}
}