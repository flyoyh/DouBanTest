package
{
	import base.AbsView;
	
	import flash.display.Loader;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	public class DouBanTest extends Sprite
	{
		public function DouBanTest()
		{
			stage.quality=StageQuality.BEST;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			Global.stage=stage;
			
			this.graphics.beginFill(0);
			this.graphics.drawRect(0,0,1366,600);
			this.graphics.endFill();
			
			this.mouseEnabled=false;
			
			this.addEventListener(Event.RESIZE,onReSize);
			
			loader=new Loader();
			loaderContext=new	 LoaderContext();
			loaderContext.applicationDomain=ApplicationDomain.currentDomain;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			loader.load(new URLRequest("../ui/douBan.swf"),loaderContext);
		}
		private function onReSize(eve:Event):void
		{
			var minW:uint=this.width;
			var minH:uint=this.height;
			if (this.width>Global.stage.stageWidth) 
			{
				minW=Global.stage.stageWidth;
			}
			if (this.height>Global.stage.stageHeight) 
			{
				minH=Global.stage.stageHeight;
			}
			mainPanel.x=(minW-mainPanel.width)/2;
			mainPanel.y=(minH-mainPanel.height)/2;
		}
		private var loader:Loader;
		private var loaderContext:LoaderContext;
		private var mainPanel:MainPanle;
		private function click(eve:MouseEvent):void
		{
			
			
		}
		private function loadComplete(eve:Event):void
		{
			mainPanel=new MainPanle();
			mainPanel.x=(Global.stage.width-mainPanel.width)/2;
			mainPanel.y=(Global.stage.height-mainPanel.height)/2;
			this.addChild(mainPanel);
			//this.addChild(loader);
		}
	}
}