package org.Validitron.vo {

	/**
	 *
	 * @author GarthDB
	 *
	 */
	public class RuleVO {
		public function RuleVO(rule:RegExp, message:String = null){
			this.rule = rule;
			this.message = message;
		}
		public var rule:RegExp;
		public var message:String;
	}
}