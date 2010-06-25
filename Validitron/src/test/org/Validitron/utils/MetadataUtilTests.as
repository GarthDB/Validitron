package test.org.Validitron.utils {
	import flash.utils.describeType;
	
	import flexunit.framework.Assert;
	
	import org.Validitron.utils.MetadataUtil;
	import org.Validitron.vo.VariableVO;

	public class MetadataUtilTests {
		[Validate]
		[Inject]
		[Bindable]
		public var email:String = "garthdb@gmail.com";
		
		[Validate(message='Please enter a complete address', rule='NOT_NULL')]
		[Validate(rule='^[a-zA-Z]\w{3,14}$')]
		[Validate(message='don\'t die')]
		public var address:String = "1204 W Maple St";

		[Before]
		public function setUp():void {
		}

		[After]
		public function tearDown():void {
		}

		[BeforeClass]
		public static function setUpBeforeClass():void {
		}

		[AfterClass]
		public static function tearDownAfterClass():void {
		}

		[Test]
		public function retrieveAllMetadataTest():void {
			var hardfact:XML = describeType(this);
			
			var results:Vector.<VariableVO> = MetadataUtil.RetrieveAllMetadata(this);
			Assert.assertFalse("Empty Results", results.length < 2);
			Assert.assertTrue("Results do not contain 'email' variable", results[0].name == "email");
			Assert.assertTrue("Results do not contain Validate metadata", results[1].metadata[1].name == "Validate");
			Assert.assertTrue("Results do not contain 'addess' variable", results[1].name == "address");
			
			
		}

		[Test]
		public function multipleMetadataTest():void {
			var results:Vector.<VariableVO> = MetadataUtil.RetrieveAllMetadata(this);
			Assert.assertTrue("Results are not ordered correctly 1", results[1].metadata[0].parameters.message == 'Please enter a complete address');
			Assert.assertTrue("Results are not ordered correctly 2", results[1].metadata[0].parameters.rule == 'NOT_NULL');
			Assert.assertTrue("Results are not ordered correctly 3", results[1].metadata[1].parameters.rule == '^[a-zA-Z]\w{3,14}$');
			Assert.assertTrue("Results are not ordered correctly 4", results[1].metadata[2].parameters.message == 'don\'t die');
		}
	}
}