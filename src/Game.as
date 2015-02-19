package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Game extends Sprite
	{	
		private var plus		:	int 	= 1;
		public var nCount		:	Number 	= 11;
		private var myTimer		:	Timer 	= new Timer(2000, nCount);
		private var myString	:	String 	= nCount.toString();
		var myText				:	TextField = new TextField();
		
		public function Game() 
		{
			addEventListener(Event.ENTER_FRAME, update);
			myTimer.addEventListener(TimerEvent.TIMER, countDown);
			myTimer.start();
			
			addChild(myText);
		}
		
		private function countDown(e:TimerEvent):void 
		{
			nCount--;
			myText.text = nCount.toString();
		}
		
		private function update(e:Event):void 
		{	
			//trace("plus = " + plus);
			//plus+= 1;
			//trace(nCount);
		}
		
		
	}

}