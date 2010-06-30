package com.garthdb.vo {

	public class SampleVO {

		[Validate(rule='email', message='The email you entered is not valid')]
		public var email:String;

		[Validate(rule='notBlank', message='Please enter an email address')]
		public var name:String;

		[Validate]
		public var zip:String;
	}
}