package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Enemy extends Sprite
	{	
		private var enemy		: 	TheEnemy = new TheEnemy();
		private var atkTimer	:	Timer = new Timer(400);
		public var canAttack	: Boolean = false;
		public static const ENEMY_ATTACK: String = "EnemySlash";
		private var _enemyNinja	: NinjaArt = new NinjaArt();
		
		public function Enemy() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Game.GAME_STARTED, startTimer);
			addChild(_enemyNinja);
		}
		
		private function startTimer(e:Event):void 
		{
			atkTimer.addEventListener(TimerEvent.TIMER, attackTimer);
			atkTimer.start();
			canAttack = true;
		}
		
		
		private function attackTimer(e:TimerEvent):void 
		{
			atkTimer.reset();
			atkTimer.stop();
			if (canAttack)
			{
				attack();
			}
		}
		private function attack():void
		{	
			
			trace("slash");
			dispatchEvent(new Event(ENEMY_ATTACK, true));
			atkTimer.start();
		}
	}

}