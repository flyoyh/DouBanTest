package base
{
	import flash.display.MovieClip;
	
	import mananger.TipManager;

	public class BaseMcSprite extends AbsView
	{
		public function BaseMcSprite(_mc:MovieClip)
		{
			super();
			this._bg=_mc;
			this._bg.parent.addChild(_bg);
			this.x=_bg.x;
			this.y=_bg.y;
			this.addChild(_bg);
			_bg.x=0;
			_bg.y=0;
			this.tipManager=TipManager.getInstance();
		}
		protected var tipManager:TipManager;
		protected var _bg:MovieClip;
	}
}