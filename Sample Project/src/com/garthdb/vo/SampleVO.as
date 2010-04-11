package com.garthdb.vo {

	public class SampleVO {
		public function SampleVO() {
		}
		[Validate(rule='notBlank', message='Please enter an email address')]
		[Validate(rule='email', message='The email you entered is not valid')]
		public var email:String;

		public var name:String;
	}
}