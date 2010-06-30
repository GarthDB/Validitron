package org.Validitron.vo {

	/**
	 *
	 * @author GarthDB
	 *
	 */
	public class RuleVO {
		public function RuleVO(rule:RegExp = null, message:String = null){
			this.rule = rule;
			this.message = message;
		}
		public var rule:RegExp;
		public var message:String;
		public var min:String = '';
		public var max:String = '';
		public var order:int = -1;
	}
}