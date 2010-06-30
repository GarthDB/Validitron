/*
* Copyright (c) 2010 the original author or authors
* 
* Permission is hereby granted to use, modify, and distribute this file 
* in accordance with the terms of the license agreement accompanying it.
*/
package org.Validitron {
	import org.Validitron.vo.RuleVO;

	public class ValiditronResult {
		public var property:String;
		public var object:*;
		public var validator:RuleVO;
		public var result:Boolean;
	}
}