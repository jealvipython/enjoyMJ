package com.enjoyMJ.modules.common.utils;

import java.util.UUID;

public class UUIDUtils {
	public static String getTokenid(){
		String tokenid = UUID.randomUUID().toString().replace("-", "").concat(UUID.randomUUID().toString().replace("-", ""));
		return tokenid;
	}
}
