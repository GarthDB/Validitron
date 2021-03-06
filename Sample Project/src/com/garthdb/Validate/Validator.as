package com.garthdb.Validate {
	import flash.utils.describeType;

	public class Validator {
		public static function validate(object:*):* {
			var output:Boolean;
			var classInfo:XML = describeType(object);
			for each (var variable:XML in classInfo..variable) {
				var validateMeta:XMLList = variable..metadata.(@name == 'Validate');
				trace(variable.@name);
				for (var i:int = validateMeta.length() - 1; i >= 0; i--) {
					var result:ValidationResult = new ValidationResult();
					result.validator = new ValidateVO();
					for each (var arg:XML in validateMeta[i]..arg){
						switch(arg.@key){
							case 'rule':
								result.validator.rule = arg.@value;
								break;
							case 'message':
								result.validator.message = arg.@value;
								break;
							case 'min':
								result.validator.min = arg.@value;
								break;
							case 'max':
								result.validator.max = arg.@value;
								break;
							default:
								break;
						}
					}
				}
			}
			return classInfo;
		}
		public static const email:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
		public static const usPhone:RegExp = /^\(?([0-9]{3})\)?\s*[\. -]?\s*([0-9]{3})\s*[\. -]?\s*([0-9]{4})\s?((ext|x)\s*\.?:?\s*([0-9]+))?$/gim;
		public static const usZip:RegExp = /((^\d{5})|(^\d{5}-\d{4})|(^\d{9}$)/g;
	}
}	