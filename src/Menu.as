package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Menu extends Sprite
	{	
		private var _startButton:StartBtn = new StartBtn();
		private var startText: TextField = new TextField;
		public static const STARTGAME:String = "StartGame";
		
		public function Menu() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
				//addEventListener(MouseEvent.CLICK, onClick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			_startButton.x = 200;
			_startButton.y = 200;
			startText.text = "Press space to play!";
			startText.x = stage.stageWidth / 2;
			startText.y = stage.stageHeight / 2;
			addChild(startText);
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)
			{	
				dispatchEvent(new Event(STARTGAME,true));
			}
		}
		
		//when clicked
		/*private function onClick(e:MouseEvent):void 
		{	
			if (e.target == _startButton)
			{
				
			}
		}*/
		
	}

}