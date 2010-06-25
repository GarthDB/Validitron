package test.org.Validitron
{
	import test.org.Validitron.factories.MetadataFactoryTests;
	import test.org.Validitron.utils.MetadataUtilTests;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class RegulatorTestSuite
	{
		public var metadataUtilTests:MetadataUtilTests;
		public var metadataFactoryTests:MetadataFactoryTests;
	}
}