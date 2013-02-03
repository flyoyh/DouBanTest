package
{
	import base.BaseMcSprite;
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import object.BookObj;
	
	public class BookInfoPanel extends BaseMcSprite
	{
		public function BookInfoPanel(_mc:MovieClip)
		{
			super(_mc);
			initUi();
			
		}
		private var txtName:TextField;
		private var txtAuth:TextField;
		private var txtPrice:TextField;
		private var txtPublisher:TextField;
		private var txtDesc:TextField;
		private var txtDate:TextField;
		private var txtTrans:TextField;
		private function initUi():void
		{
			this.mouseChildren=false;
			this.mouseEnabled=false;
			
			txtName=_bg["txt0"];
			txtAuth=_bg["txt1"];
			txtPrice=_bg["txt2"];
			txtPublisher=_bg["txt3"];
			txtDate=_bg["txt4"];
			txtTrans=_bg["txt5"];
			
			txtDesc=_bg["txt6"];
			txtDesc.multiline=true;
			txtDesc.wordWrap=true;
		}
		private var book:BookObj;
		public function showBook(obj:BookObj):void
		{
			book=obj;
			reset();
			txtName.text="书名："+book.name;
			txtAuth.text="作者："+book.auther;
			txtTrans.text="译者："+book.traner;
			txtDate.text="出版日期："+book.publishDate;
			txtPublisher.text="出版社："+book.publisher;
			txtPrice.text="价格："+book.price;
			txtDesc.text="简介："+book.content;
		}
		public function reset():void
		{
			txtName.text="";
			txtAuth.text="";
			txtPrice.text="";
			txtPublisher.text="";
			txtDesc.text="";
			txtDate.text="";
			txtTrans.text="";
		}
	}
}