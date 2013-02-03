package lib.scroll
{
	import base.BaseFace;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import utils.GlobalVar;
	
	public class ScrollView extends BaseFace
	{
		public function ScrollView(contatiner:Sprite,_mask:MovieClip,_downY:Number)
		{
			super("ui.lib.scroll");
			targetContainer=contatiner;
			mcMask=_mask;
			
			targetH=targetContainer.height;
			downY=_downY;
			
			
			initUI();
			
		}
		private function initUI():void
		{
			btnUp=_bg["btnUp"];
			btnDown=_bg["btnDown"];
			mcBar=_bg["mcBar"];
			mcBG=_bg["mcBg"];
			
			btnUp.y=0;
			mcBar.visible=false;
			mcBG.height=targetH-btnDown.height-btnDown.height;
			mcBG.y=btnUp.y+btnUp.height;
			btnDown.y=mcBG.y+mcBG.height;
			stY=btnUp.height;
			
			btnUp.y=0;
			btnDown.y=targetH-btnDown.height;
			
			moveH=targetH-btnDown.height-btnUp.height;
		
			btnUp.addEventListener(MouseEvent.CLICK,onUp);
			btnDown.addEventListener(MouseEvent.CLICK,onDown);
			mcBar.addEventListener(MouseEvent.MOUSE_DOWN,onMousedown);
			
			//targetContainer.parent.addChild(this);
			Global.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			this.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
			
			
		}
		public function onMouseWheel(eve:MouseEvent):void
		{
			//向下
			if (eve.delta<0) 
			{
				onDown(eve);
			}
			else
			{
				onUp(eve);
			}
		}
		private var stY:Number;
		private var mcBG:MovieClip;
		private var btnUp:SimpleButton;
		private var btnDown:SimpleButton;
		private var mcBar:MovieClip;
		
		private var downY:Number;
		private var targetH:Number;
		private var moveH:Number;
		private var moveRect:Rectangle;
		
		private var mcMask:MovieClip;
		private var targetContainer:Sprite;
		
		public function refuribish():void
		{
			reCount();
			movetoBottom();
	
		}
		private function onUp(eve:MouseEvent):void
		{
			if (!mcBar.visible) 
			{
				return;
			}
			if (mcBar.y-delY<btnUp.y+btnUp.height) 
			{
				mcBar.y=btnUp.y+btnUp.height;
			}
			else
			{
				mcBar.y-=delY;
			}
			refreshY();
		}
		
		private function onDown(eve:MouseEvent):void
		{
			if (!mcBar.visible) 
			{
				return;
			}
			if (mcBar.y+mcBar.height+delY>btnDown.y) 
			{
				mcBar.y=btnDown.y-mcBar.height;
			}
			else
			{
				mcBar.y+=delY;
			}
			refreshY();
		}
		private function onMousedown(eve:MouseEvent):void
		{
			mcBar.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
		}
		private function onMouseUp(eve:MouseEvent):void
		{
			mcBar.stopDrag();
			mcBar.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			this.removeEventListener(Event.ENTER_FRAME,loop);
		}
		private function onMouseMove(eve:MouseEvent):void
		{
			mcBar.startDrag(false,moveRect);
			this.addEventListener(Event.ENTER_FRAME,loop);
			
		}
		private function loop(eve:Event):void
		{
			refreshY();
		}
		private function reCount():void
		{
			GlobalVar.setBtnEnable(btnDown);
			GlobalVar.setBtnEnable(btnUp);
			mcBar.visible=true;
			if (targetContainer.height<=targetH) 
			{
				mcBar.visible=false;
				GlobalVar.setBtnDisable(btnDown);
				GlobalVar.setBtnDisable(btnUp);
				mcBar.height=0;
			}
			else
			{
				mcBar.height=(moveH/((targetContainer.height-targetH)/downY));
				delY=mcBar.height;
			}
			moveRect=new Rectangle(0,btnUp.y+btnUp.height,0,mcBG.height-mcBar.height);
		}
		private var delY:uint;
		private function refreshY():void
		{
			targetContainer.y=-(mcBar.y-stY)/(moveH-mcBar.height)*(targetContainer.height-targetH);
		}
		public function movetoBottom():void
		{
			mcBar.y=btnDown.y-mcBar.height;
			refreshY();
		}
	}
}