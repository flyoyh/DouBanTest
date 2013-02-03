package container
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import lib.scroll.ScrollViewContainer;
	
	import object.BookObj;
	
	public class BooksItemContainer extends ScrollViewContainer
	{
		public function BooksItemContainer(downY:uint=10)
		{
			super(downY);
			intXY=new Point(0,1);
			geXY=new Point(0,50);
			
			
		}
		override public function initMask(mc:MovieClip):void
		{
			super.initMask(mc);
			itemList=new Vector.<BooksItem>();
			booksList=new Vector.<BookObj>();
		}
		public var clickCallBackFunc:Function;
		private function click(eve:MouseEvent):void
		{
			if (clickCallBackFunc!=null) 
			{
				clickCallBackFunc((eve.currentTarget as BooksItem).getBook());
			}
		}
		
		private var itemList:Vector.<BooksItem>;
		private var booksList:Vector.<BookObj>;
		private var item:BooksItem;
		private var bookObj:BookObj;
		private function decodeObj(obj:Object):void
		{
			var books:Array=obj.books;
			var len:uint=books.length;
			booksList.length=0;
			for (var i:int = 0; i < len; i++) 
			{
				bookObj=new BookObj();
				
				bookObj.name=books[i].title;
				bookObj.auther=books[i].author;
				bookObj.traner=books[i].translator;
				bookObj.publishDate=books[i].pubdate;
				bookObj.publisher=books[i].publisher;
				bookObj.price=books[i].price;
				bookObj.content=books[i].summary;	
				booksList.push(bookObj);
			}
			show();
		}
		private function showList():void
		{
			
		}
		public function showBooks(obj:Object):void
		{
			reset();
			decodeObj(obj);
			//bookList=list;
			var len:uint=booksList.length;
			for (var i:int = 0; i <len; i++) 
			{
				item=BooksItem.getItem();
				item.x=intXY.x;
				item.y=geXY.y*i+intXY.y;
				item.addEventListener(MouseEvent.CLICK,click);
				item.showBooks(booksList[i]);
				this.addItem(item);
				itemList.push(item);
			}
			
		}
		override public function reset():void
		{
			super.reset();
			for (var i:int = 0; i < itemList.length; i++) 
			{
				BooksItem.sleepItem(itemList[i]);
				itemList[i].removeEventListener(MouseEvent.CLICK,click);
			}
			
			itemList.length=0;
			
		}
	}
}