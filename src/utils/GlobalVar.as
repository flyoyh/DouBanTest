package  utils
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.GlowFilter;

	public class GlobalVar
	{
		public function GlobalVar()
		{
		}
		public static const filter:ColorMatrixFilter=new ColorMatrixFilter([0.3,0.3,0.3,0,0,0.3,0.3,0.3,0,0,0.3,0.3,0.3,0,0,0.0,0.0,0.0,1,0]);
		public static const blackFilter:GlowFilter=new GlowFilter(0,1,2,2,6);
		
		public static function setMcEnable(mc:MovieClip):void
		{
			mc.filters=[];
			mc.mouseEnabled=true;
			mc.mouseChildren=true;
		}
		public static function setMcDisable(mc:MovieClip):void
		{
			mc.filters=[filter];
			mc.mouseChildren=false;
			mc.mouseEnabled=false;
		}
		public static function setBtnEnable(btn:SimpleButton):void
		{
			btn.filters=[];
			btn.mouseEnabled=true;
		}
		public static function setBtnDisable(btn:SimpleButton):void
		{
			btn.filters=[filter];
			btn.mouseEnabled=false;
		}
	}
}