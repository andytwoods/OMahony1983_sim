package
{
	public class Simulation
	{
		
		private var simulations:int = 10000;
		private var SJs:int = 51;
		private var sessions:int = 3;
		private var colours:int = 12;
		
		
		
		public function Simulation()
		{
			
			collectData();
			
			
		}
		
		private function collectData():void
		{
			Experiment.sessions = this.sessions;
			Experiment.colours = this.colours;
			Experiment.SJs = this.SJs;
			
			var results:Array = [];
			
			for(var i:int=0;i<simulations;i++){
				results[results.length] = Experiment.run();			
			}
			
			var processedResults:Array = calcFrequencies(results);
			
			var result:Object;
			for(i=0;i<processedResults.length;i++){
				result = processedResults[i];
				trace("colours selected",result.colFreq,"times","p=",result.p);
			}

		}
		
		
		public function calcFrequencies(results:Array):Array
		{
			var freq:Object = {};
			var val_str:String;
			for(var i:int=0;i<results.length;i++){
				val_str = results[i];
				if(freq.hasOwnProperty(val_str)==false) freq[val_str] = {freq:1,colFreq:val_str};
				else freq[val_str].freq ++;
			}
			
			var newResults:Array = [];
			for each(var myFreq:Object in freq){
				myFreq.p = myFreq.freq / results.length;
				newResults.push(myFreq);
			}
			return newResults.sortOn("colFreq",Array.NUMERIC);
			
		}
		
	}
}