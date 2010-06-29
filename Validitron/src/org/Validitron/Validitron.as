package org.Validitron {
	import flash.utils.describeType;
	
	import org.Validitron.vo.RuleVO;
	
	/**
	 * TODO: Add documentation
	 * @author garthdb
	 * 
	 */
	public class Validitron {
		
		public var defaultRules:Object = {email:new RuleVO(email)};
		public static const email:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
		public static const zip:RegExp =  /(\d{5,9})|(\d{5}-\d{4})/;
		
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