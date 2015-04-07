package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Main extends Sprite
	{	
		private var _game	: Game = new Game();
		private var _menu	: Menu = new Menu();
		private var _playagain	: Boolean = false;
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(_menu);
			addEventListener(Menu.STARTGAME, startGame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Restart);
			
		}
		
		private function Restart(e:KeyboardEvent):void 
		{
			if (_playagain)
			{	//remove the game
				removeChild(_game);
				
				//add the game again
				addChild(_game);
				_playagain = false;
			}
		}
		
		private function startGame(e:Event):void 
		{
			removeChild(_menu);
			addChild(_game);
		}
		
	}
}

