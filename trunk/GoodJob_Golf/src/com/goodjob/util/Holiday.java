package com.goodjob.util;

import java.util.ArrayList;

public class Holiday {

	public static final ArrayList<String> days = new ArrayList<String>();
	
	static{
		days.add("20120123");
		days.add("20120124");
		days.add("20120301");
		days.add("20120411");
		days.add("20120528");
		days.add("20120501");
		days.add("20120606");
		days.add("20120815");
		days.add("20121001");
		days.add("20121003");
		days.add("20121219");
		days.add("20121225");
		days.add("20150101");
		days.add("20150218");
		days.add("20150219");
		days.add("20150220");
		days.add("20150505");
		days.add("20150525");
		days.add("20150928");
		days.add("20151225");
		days.add("20180101");
		days.add("20180215");
		days.add("20180216");
		days.add("20180301");
		days.add("20180522");
		days.add("20180606");
		days.add("20180815");
		days.add("20180924");
		days.add("20180925");
		days.add("20181003");
		days.add("20181225");
		days.add("20130101");
		days.add("20130211");
		days.add("20130301");
		days.add("20130517");
		days.add("20130606");
		days.add("20130815");
		days.add("20130918");
		days.add("20130919");
		days.add("20130920");
		days.add("20131003");
		days.add("20131225");
		days.add("20160101");
		days.add("20160208");
		days.add("20160209");
		days.add("20160301");
		days.add("20160505");
		days.add("20160606");
		days.add("20160815");
		days.add("20160914");
		days.add("20160915");
		days.add("20160916");
		days.add("20161003");
		days.add("20190101");
		days.add("20190204");
		days.add("20190205");
		days.add("20190206");
		days.add("20190301");
		days.add("20190606");
		days.add("20190815");
		days.add("20190912");
		days.add("20190913");
		days.add("20191003");
		days.add("20191225");
		days.add("20140101");
		days.add("20140130");
		days.add("20140131");
		days.add("20140505");
		days.add("20140506");
		days.add("20140606");
		days.add("20140815");
		days.add("20140908");
		days.add("20140909");
		days.add("20141003");
		days.add("20141225");
		days.add("20170127");
		days.add("20170301");
		days.add("20170503");
		days.add("20170505");
		days.add("20170606");
		days.add("20170815");
		days.add("20171003");
		days.add("20171004");
		days.add("20171005");
		days.add("20171225");
		days.add("20200101");
		days.add("20200123");
		days.add("20200430");
		days.add("20200505");
		days.add("20200930");
		days.add("20201001");
		days.add("20201002");
		days.add("20201225");
	}
	
	public static boolean isHoliday(String day){
		
		return days.contains(day);
	}
}
