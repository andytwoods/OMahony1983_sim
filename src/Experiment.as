package
{
	public class Experiment
	{

		public static var sessions:int;
		public static var colours:int;
		public static var SJs:int;


		private static var session_i:int;
		private static var colour_i:int;
		private static var SJs_i:int;
				
		private static var colourVector:Vector.<int> = new Vector.<int>;
		private static var successCount:int;

		
		
		public static function run():int
		{
			successCount=0;
			
			for(var SJs_i:int=0;SJs_i<SJs;SJs_i++){
				if(	runOneTaste()	)	successCount++;
			}
			return successCount;
		}
		

		
		private static function runOneTaste():Boolean{
			//generate data for each experimenteral session;
			//testGenRandColour();

			resetVector();
			
			for(session_i = 0; session_i < sessions; session_i++){
				//select a random colour for each sessio
				colourVector[	genRandColour()	] ++;
			}
			
			for(colour_i = 0; colour_i < colours; colour_i++){
				//look to see if any of the colours have, by chance, been chosen every single session
				if(colourVector[colour_i] == sessions) return true;
			}
			
			//return false if criteria true, 'same colour chosen on all sessions'
			return false;
		}
		
		
		
		private static function testGenRandColour():void
		{
			var arr:Array = [0,0,0,0];
			for(var i:int=0;i<10000;i++){
				arr[genRandColour()]++;
			}
			trace(arr[0]>1000 && arr[1]>1000 && arr[2]>1000 && arr[3]>1000); //fairly rubbish test
		}		
		
		
		
		private static function genRandColour():int{
			return Math.random()*colours;
		}
		
		private static function resetVector():void
		{
			for(colour_i=0;colour_i<colours;colour_i++){
				colourVector[colour_i]=0;
			}
		}
		

	}
}