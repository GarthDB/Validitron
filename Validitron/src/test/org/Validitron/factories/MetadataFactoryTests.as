package test.org.Validitron.factories
{
	import flexunit.framework.Assert;
	
	import org.Validitron.factories.MetadataFactory;
	import org.Validitron.vo.MetadataVO;
	import org.Validitron.vo.VariableVO;

	public class MetadataFactoryTests
	{
		public var variableXML_one:XML = new XML('<variable name="email" type="String"><metadata name="Validate"/><metadata name="__go_to_definition_help"><arg key="file" value="/Users/garthdb/Projects/Regulator/Regulator/src/test/utils/MetadataUtilTests.as"/><arg key="pos" value="203"/></metadata></variable>');
		public var variableXML_two:XML = new XML('<variable name="address" type="String"><metadata name="Validate"><arg key="message" value="Please enter a complete address"/><arg key="rule" value="NOT_NULL"/></metadata><metadata name="__go_to_definition_help"><arg key="file" value="/Users/garthdb/Projects/Regulator/Regulator/src/test/utils/MetadataUtilTests.as"/><arg key="pos" value="325"/></metadata></variable>');
		[Before]
		public function setUp():void
		{
			
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function buildMetadataTest():void {
			var metadataXMLList:XMLList = variableXML_one..metadata;
			var results:MetadataVO = MetadataFactory.BuildMetadata(metadataXMLList[0]);
			Assert.assertTrue("First metadata is not 'Validate' as expected", results.name == 'Validate');
		}
		[Test]
		public function complexBuildMetadataTest():void{
			var metadataXMLList:XMLList = variableXML_two..metadata;
			var results:MetadataVO = MetadataFactory.BuildMetadata(metadataXMLList[0]);
			Assert.assertTrue("First parameter was not 'message' as expected", results.parameters.message == "Please enter a complete address");
		}
		
		[Test]
		public function buildVariableTest():void {
			var results:VariableVO = MetadataFactory.BuildVariable(variableXML_one);
			Assert.assertTrue("First Variable is not 'email' as expected", results.name == 'email');
		}
		
	}
}