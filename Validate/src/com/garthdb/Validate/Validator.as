package com.garthdb.Validate {
	import flash.utils.describeType;

	public class Validator {
		public static function validate(object:*):* {
			var output:Boolean;
			var classInfo:XML = describeType(object);
			for each (var variable:XML in classInfo..variable) {
				var validateMeta:XMLList = variable..metadata.(@name == 'Validate');
				trace(validateMeta);
			}
			return classInfo;
		}
		public static const email:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
	}
}