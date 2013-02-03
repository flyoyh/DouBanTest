package mananger
{

	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import lib.tip.BaseTipObj;
	import lib.tip.BaseTipViewer;
	


	public class BaseTipManager extends Object
	{
		
		private var displayObjlist:Vector.<DisplayObject>;
		private var tipObjlist:Vector.<BaseTipObj>;
		private var pt:Point;
		protected var nowTipObj:BaseTipObj;
		protected var nowViewer:BaseTipViewer;
		protected var nowTarget:DisplayObject;
		
		public function BaseTipManager()
		{
			super();
			displayObjlist=new Vector.<DisplayObject>;
			tipObjlist=new Vector.<BaseTipObj>;
			pt=new Point();
		}

		
		public function addTip(displayObj:DisplayObject,tip:BaseTipObj):void
		{
			if (displayObjlist.indexOf(displayObj)!=-1) 
			{
				return;
			}
			displayObjlist.push(displayObj);
			displayObj.addEventListener(MouseEvent.MOUSE_OVER,over);
			displayObj.addEventListener(MouseEvent.MOUSE_OUT,out);
			tipObjlist.push(tip);
			if (displayObjlist.length!=tipObjlist.length) 
			{
				throw new Error("tip列表为对齐");
			}
		}
		public function delTip(obj:DisplayObject):void
		{
			var index:int=displayObjlist.indexOf(obj);
			if (index==-1) 
			{
				return;
			}
			displayObjlist.splice(index,1);
			tipObjlist.splice(index,1);
		}
		private function over(eve:MouseEvent):void
		{
			nowTarget=eve.currentTarget as DisplayObject;
			nowTipObj=getTipObj(nowTarget);
			nowTarget.addEventListener(MouseEvent.MOUSE_MOVE,move);
			showNowTip();
			pt.x=nowTarget.x+eve.localX;
			pt.y=nowTarget.y+eve.localY;
			domove();
			Global.stage.addChild(nowViewer);
			nowViewer.show();
		}
		
		private  function out(eve:MouseEvent):void
		{
			nowTarget=eve.currentTarget as DisplayObject;
			nowTarget.removeEventListener(MouseEvent.MOUSE_MOVE,move);
			
			Global.stage.removeChild(nowViewer);
			nowViewer.hide();
		}
		private function domove():void
		{
			
			nowViewer.x=Global.stage.mouseX+10;
			nowViewer.y=Global.stage.mouseY+10;
		}
		private function move(eve:MouseEvent):void
		{
			
			pt.x=nowTarget.x+eve.localX;
			pt.y=nowTarget.y+eve.localY;
		
			domove();
		}
		public function showNowTip():void
		{
			throw new Error("子类覆盖");
		}
		
		private function getTipObj(target:DisplayObject):BaseTipObj
		{		
			return tipObjlist[displayObjlist.indexOf(target)];
		}
		
		
	}
}