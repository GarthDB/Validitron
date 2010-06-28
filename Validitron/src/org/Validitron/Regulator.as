package org.Validitron {
	import flash.utils.describeType;
	
	/**
	 * TODO: Add documentation
	 * @author garthdb
	 * 
	 */
	public class Regulator {
		
		public var defaultRules:Object = {};
		public static const email:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
		
		/**
		 * TODO: Add documentation
		 * @param object
		 * @return 
		 * 
		 */
		public function validate(object:*, rules:Object = null):* {
			if(rules == null){
				rules = defaultRules;
			}
				
			var output:Boolean;
			var classInfo:XML = describeType(object);
			for each (var variable:XML in classInfo..variable) {
				var validateMeta:XMLList = variable..metadata.(@name == 'Validate');
			}
			return classInfo;
		}
	}
}