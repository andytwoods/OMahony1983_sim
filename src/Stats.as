package
{
	public class Stats
	{
		static public function median(plug:Array):Number
		{
			// Even length.
			if(plug.length % 2 == 0)
			{
				var a:Number = plug[int(plug.length / 2) - 1];
				var b:Number = plug[int(plug.length / 2)];
				
				return (a + b) / 2;
			}
			
			// Odd length.
			return plug[int(plug.length / 2)];
		}
		
		public static function average(aArray:Array):Number {
			return sum(aArray) / aArray.length;
		}
		
		public static function sum(aArray:Array):Number {
			var nSum:Number = 0;
			for(var i:Number = 0; i < aArray.length; i++) {
				if(typeof aArray[i] == "number") {
					nSum += aArray[i];
				}
			}
			return nSum;
		}
		
		public static function round(numberVal:Number, precision:int = 0):Number{
			var decimalPlaces:Number = Math.pow(10, precision);
			return Math.round(decimalPlaces * numberVal) / decimalPlaces;
		}
		
		
	}
}