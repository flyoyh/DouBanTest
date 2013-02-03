package container
{
	import base.BaseFace;
	
	import flash.text.TextField;
	
	import lib.tip.WordTipObj;
	
	import object.BookObj;
	
	public class BooksItem extends BaseFace
	{
		public function BooksItem()
		{
			super("ui.douBan.BookItem");
			initUI();
		}
		private function initUI():void
		{
			txt=_bg["txt"];
			this.buttonMode=true;
		}
		public function getBook():BookObj
		{
			return book;
		}
		private var book:BookObj
		public function showBooks(obj:BookObj):void
		{
			show();
			book=obj;
			txt.text=book.name;
			
			this.tipManager.addTip(this,new WordTipObj("作者："+book.auther));
		}
		private var txt:TextField;
		private function reset():void
		{
			this.tipManager.delTip(this);
		}
		private static var useList:Vector.<BooksItem>;
		private static var sleepList:Vector.<BooksItem>;
		
		private static var item:BooksItem;
		public static function getItem():BooksItem
		{
			if (useList==null) 
			{
				useList=new Vector.<BooksItem>();
			}
			if (sleepList==null) 
			{
				sleepList=new Vector.<BooksItem>();
			}
			
			if (sleepList.length==0) 
			{
				item=new BooksItem();
			}
			else
			{
				item=sleepList.pop();
			}
			useList.push(item);
			return item;
		}
		public static function sleepItem(tem:BooksItem):void
		{
			var index:int=useList.indexOf(tem);
			if (index!=-1) 
			{
				useList.splice(index,1);
			}
			sleepList.push(tem);
		}
	}
}