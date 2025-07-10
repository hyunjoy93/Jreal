package com.framework;

import com.framework.utl.BizUtil;

public class Test {

	public static void main(String[] args) throws Exception {
		
		String password = BizUtil.encryptPassword("New1234!");
		System.out.println("E1 SHA-256 ==>" + password);
		// MVMYpeQsjH+bM6PvQ+NcYMD+gYwcZYvEhvjebMvaFz8=
	}

}
