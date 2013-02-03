package
{
	import base.BaseFace;
	
	import container.BooksItemContainer;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextField;
	
	import lib.tip.WordTipObj;
	
	import object.BookObj;
	
	import utils.GlobalVar;
	
	public class MainPanle extends BaseFace
	{
		public function MainPanle()
		{
			super("ui.douBan.Main");
			initUI();
		}
		private function initUI():void
		{
			booksContianer=new BooksItemContainer(40);
			booksContianer.initMask(_bg["mcMask"]);
			booksContianer.initScroll(_bg["mcScroll"]);
			booksContianer.clickCallBackFunc=showInfo;
			_bg.addChild(booksContianer);
			
			booksInfoPanel=new BookInfoPanel(_bg["mcInfo"]);
			_bg.addChild(booksInfoPanel);
			
			txtInput=_bg["txt0"];
			txtPage=_bg["txt1"];
			
			txtPage.wordWrap=true;
			txtPage.multiline=true;
			txtPage.textColor=0xffffff;
			txtPage.filters=[GlobalVar.blackFilter];
			txtPage.height=40;
			txtPage.text="做测试，只显示了前十条记录，得到记录后点击获取详细信息";
			
			btnSearch=_bg["btn0"];
		
			
			btnSearch.addEventListener(MouseEvent.CLICK,onSearch);
			
			
			
		}
		private var booksContianer:BooksItemContainer;
		private var booksInfoPanel:BookInfoPanel;
		private var txtInput:TextField;
		private var txtPage:TextField;
		private var btnSearch:MovieClip;
		private var btnPre:MovieClip;
		private var btnNext:MovieClip;
		
		
		private var urlLoader:URLLoader;
		private var urlRequest:URLRequest;
		private var vars:URLVariables;
		private static var URL:String="https://api.douban.com/v2/book/search";
		private static var COUNT:uint=10;
		
		private var curPage:uint;
		private var sendObj:Object;
		
		private var curKey:String;
		private function onSearch(eve:MouseEvent):void
		{
			if (txtInput.text=="") 
			{
				return;
			}
			curKey=txtInput.text;
			if (urlLoader==null) 
			{
				urlLoader=new URLLoader();
				urlLoader.addEventListener(Event.COMPLETE,loadComplete);
			}
			if (urlRequest==null) 
			{
				urlRequest=new URLRequest();
				urlRequest.url=URL;
				urlRequest.method=URLRequestMethod.GET;
				
			}
			if (vars==null) 
			{
				vars=new URLVariables();
			}
			sendObj=new Object();
			sendObj["q"]=txtInput.text;
			sendObj["start"]=curPage*COUNT;
			sendObj["count"]=COUNT;
			
			
			urlRequest.data=getVars(sendObj);
			urlLoader.load(urlRequest);
		}
		public function showInfo(book:BookObj):void
		{
			booksInfoPanel.showBook(book);
		}
		private function getVars(obj:Object):URLVariables
		{
			var vars:URLVariables=new URLVariables("count="+obj["count"]+"&q="+obj["q"]+"&start="+obj["start"]);
			return vars;
		}
		private var recvObj:Object;
		private function loadComplete(eve:Event):void
		{
			recvObj=JSON.parse(eve.target.data);
			booksContianer.showBooks(recvObj);
		}
		private function onNext(eve:MouseEvent):void
		{
			
		}
		private function onPre(eve:MouseEvent):void
		{
			
		}
	}
}