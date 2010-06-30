package org.Validitron {
	import flash.utils.describeType;
	
	import org.Validitron.vo.RuleVO;
	
	/**
	 * TODO: Add documentation
	 * @author garthdb
	 * 
	 */
	public class Validitron {
		
		public var defaultRules:Object = {
			email:new RuleVO(email),
			zip:new RuleVO(zip)
		};
		public static const email:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
		public static const zip:RegExp =  /(\d{5}-\d{4})|(\d{9})|(\d{5})/;
		
		public static function validate(object:*):ValiditronResult {
			var output:Boolean;
			var classInfo:XML = describeType(object);
			for each (var variable:XML in classInfo..variable) {
				var validateMeta:XMLList = variable..metadata.(@name == 'Validate');
				for (var i:int = validateMeta.length() - 1; i >= 0; i--) {
					var result:ValiditronResult = new ValiditronResult();
					var validate:RuleVO = new RuleVO();
					var order:int;
					for each (var arg:XML in validateMeta[i]..arg){
						switch(arg.@key){
							case 'rule':
								validate.rule = arg.@value;
								break;
							case 'message':
								validate.message = arg.@value;
								break;
							case 'min':
								validate.min = arg.@value;
								break;
							case 'max':
								validate.max = arg.@value;
								break;
							case 'order':
								validate.max = arg.@order;
							default:
								break;
						}
					}
					result.validator = validate;
				}
			}
			return result;
		}
		
		/**
		 * TODO: Add documentation
		 * @param object
		 * @return 
		 * 
		 */
		public function validator(object:*, rules:Object = null):* {
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