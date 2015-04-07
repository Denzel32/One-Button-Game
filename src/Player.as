package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Player extends Sprite
	{	
		public var canAttack : Boolean = false;
		public static const PLAYER_ATTACKS: String = "PlayerSlash";
		private var _ninja	: NinjaArt = new NinjaArt();
		
		public function Player() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Game.GAME_STARTED, attack);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			addChild(_ninja);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32 && canAttack)
			{
				trace("The player attacks!");
				dispatchEvent(new Event(PLAYER_ATTACKS, true));
			}
		}
		
		private function attack(e:Event):void 
		{
			canAttack = true;
		}
		
	}

}