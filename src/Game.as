package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.Timer;

	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Game extends Sprite
	{	
		public var Counter		:	Number 	= 4;
		private var myTimer		:	Timer 	= new Timer(2000, Counter);
		private var myString	:	String 	= Counter.toString();
		private var myText		:	TextField = new TextField();
		private var _enemy		:	 Enemy = new Enemy();
		private var _player		: 	Player =  new Player();
		public static const GAME_STARTED:String = "gameStarted";
		private var EnemydeathAnimation: NinjaDeath =  new NinjaDeath();
		private var playerDeathAnim: NinjaDeathTwo = new NinjaDeathTwo();
		
		public function Game() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{	
			//adding eventlisteners
			removeEventListener(Event.ADDED_TO_STAGE, init);
			myTimer.addEventListener(TimerEvent.TIMER, countDown);
			stage.addEventListener(Player.PLAYER_ATTACKS, playerAttacked);
			stage.addEventListener(Enemy.ENEMY_ATTACK, enemyAttacked);
			//starting the timer
			myTimer.start();
			
			//adding text to the center of the stage and making it bigger in size.
			addChild(myText);
			myText.x = stage.stageWidth / 2;
			myText.y = stage.stageHeight / 2;
			myText.scaleX += 2;
			myText.scaleY += 2;
			
			//adding the enemy class
			addChild(_enemy);
			_enemy.x = stage.stageWidth / 2 + 100;
			_enemy.y = stage.stageHeight / 2;
			
			//adding the player classs
			addChild(_player);
			_player.x = stage.stageWidth / 2 - 100;
			_player.y = stage.stageHeight / 2;
		}
		
		private function enemyAttacked(e:Event):void 
		{	
			trace("The enemy striked first!");
			//variable for when the enemy has won.
			var loseText: TextField = new TextField();
			loseText.text = "You lost! Your enemy was faster than you were!";
			loseText.width = 300;	//addjust the size of the textField
			addChild(loseText);
			
			//position the text at the center of the stage.
			loseText.x = stage.stageWidth / 2;
			loseText.y = stage.stageHeight / 2  - 100;
			
			_player.canAttack = false;
			_enemy.canAttack = false;
			addChild(playerDeathAnim);
			removeChild(_player);
			removeChild(_enemy);
			playerDeathAnim.x = stage.stageWidth / 2;
			playerDeathAnim.y = stage.stageHeight / 2;
			
		}
		
		private function playerAttacked(e:Event):void 
		{
			trace("the player striked first!");
			//variable for the text that will show that the player has won
			var winText: TextField = new TextField();
			winText.text = "You have successfully  slain your enemy! You have won!";
			winText.width = 300; //adjust the size of the textfield
			addChild(winText); 
			//position the text at the center of the stage
			winText.x = stage.stageWidth / 2;
			winText.y = stage.stageHeight / 2 - 100;
			
			_player.canAttack = false;
			_enemy.canAttack = false;
			addChild(EnemydeathAnimation);
			removeChild(_player);
			removeChild(_enemy);
			EnemydeathAnimation.x = stage.stageWidth / 2;
			EnemydeathAnimation.y = stage.stageHeight / 2;
		}
		
		private function countDown(e:TimerEvent):void 
		{
			var timer:Timer = e.target as Timer;
			trace(Counter - timer.currentCount);
			myText.text = (Counter - timer.currentCount).toString();
			if (timer.currentCount == Counter)
			{
				startGame();
			}
			

		}
		private function startGame():void
		{
			dispatchEvent(new Event(GAME_STARTED,true));
		}
		
		
	}

}