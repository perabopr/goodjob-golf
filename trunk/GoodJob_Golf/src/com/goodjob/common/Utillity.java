package com.goodjob.common;

import java.text.DecimalFormat;

public class Utillity {
	public String commify(int n) {
		DecimalFormat formater = new DecimalFormat("###,###,###,###,###,###,###");
		return formater.format(n);
	}
}
