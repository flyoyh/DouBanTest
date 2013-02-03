package lib.scroll
{
	import base.AbsView;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class ScrollViewContainer extends AbsView
	{
		public function ScrollViewContainer(downY:Number=10)
		{
			super();
			_downY=downY;
		}
		protected var intXY:Point;
		protected var geXY:Point;
		private var _downY:uint;
		public function initMask(mc:MovieClip):void
		{
			targetMc=mc;
			_mask=new Sprite();
			_mask.graphics.beginFill(0x888888,0);
			_mask.graphics.drawRect(0,0,targetMc.width,targetMc.height);
			_mask.graphics.endFill();
			
			this.x=targetMc.x;
			this.y=targetMc.y;
			
			
			targetMc.parent.addChild(this);

			_container=new Sprite();
			_container.x=0;
			_container.y=0;
			_container.graphics.beginFill(0x888888,0);
			_container.graphics.drawRect(0,0,targetMc.width,targetMc.height);
			_container.graphics.endFill();
			this.addChild(_container);
			
			this.addChild(_mask);
			_container.mask=_mask;
			
			targetMc.parent.removeChild(targetMc);
			
		}
		override public function show():void
		{
			super.show();
			scroll.show();
		}
		public function initScroll(mcScroll:MovieClip):void
		{
			scroll=new ScrollView(this._container,mcScroll,this._downY);
			mcScroll.parent.addChild(scroll);
			scroll.x=mcScroll.x;
			scroll.y=mcScroll.y;
			scroll.mask=mcScroll;
			this.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
			scroll.hide();
		}
		private function onMouseWheel(eve:MouseEvent):void
		{
			scroll.onMouseWheel(eve);
		}
		protected var scroll:ScrollView;
		private var _mask:Sprite;
		private var _container:Sprite;
		private var targetMc:MovieClip;
		private var targetScroll:MovieClip;
		
		public function addItem(item:DisplayObject):void
		{
			_container.addChild(item);
			scroll.refuribish();
		}
		public function delItem(item:DisplayObject):void
		{
			if (_container.contains(item)) 
			{
				_container.removeChild(item);
			}
			scroll.refuribish();
		}
		public function reset():void
		{
			while(this._container.numChildren)
			{
				_container.removeChildAt(0);
			}
			scroll.refuribish();
		}
	}
}