package org.Validitron.utils {
	import flash.utils.describeType;
	
	import org.Validitron.factories.MetadataFactory;
	import org.Validitron.vo.MetadataVO;
	import org.Validitron.vo.VariableVO;

	public class MetadataUtil {
		public static function RetrieveAllMetadata(object:Object, types:Vector.<String> = null):Vector.<VariableVO> {
			var results:Vector.<VariableVO> = new Vector.<VariableVO>;
			var classInfo:XML = flash.utils.describeType(object);
			for each (var variable:XML in classInfo..variable) {
				results.push(MetadataFactory.BuildVariable(variable));
			}
			return results;
		}

		/*public static function RetrieveMetadata(object:Object, properties:Array, types:Vector.<String> = null):Vector.<VariableVO> {
			var results:Vector.<VariableVO>;
			return results;
		}*/
		
	}
}