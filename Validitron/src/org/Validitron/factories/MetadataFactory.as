package org.Validitron.factories {
	import org.Validitron.vo.MetadataVO;
	import org.Validitron.vo.VariableVO;

	public class MetadataFactory {
		public static function BuildVariable(variableXML:XML):VariableVO {
			var variable:VariableVO = new VariableVO();
			variable.name = variableXML.@name;
			variable.metadata = new Vector.<MetadataVO>();
			for each (var metadataXML:XML in variableXML..metadata) {
				if (BuildMetadata(metadataXML) != null) {
					variable.metadata.push(BuildMetadata(metadataXML));
				}
			}
			variable.metadata.reverse();
			return variable;
		}

		public static function BuildMetadata(metadataXML:XML):MetadataVO {
			var results:MetadataVO;
			if (String(metadataXML.@name).indexOf("__")) {
				var metadata:MetadataVO = new MetadataVO();
				metadata.name = metadataXML.@name;
				for each (var argXML:XML in metadataXML..arg) {
					if (!metadata.parameters) {
						metadata.parameters = {};
					}
					metadata.parameters[argXML.@key.toString()] = argXML.@value.toString();
				}
				results = metadata;
			}
			return results;
		}
	}
}