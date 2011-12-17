package com.goodjob.product.dto;

import java.io.Serializable;

public class RegionDto implements Serializable {
	private int region_seq;
	private String region_type;
	private String region_name;
	private String region_etc;
	
	public int getRegion_seq() {
		return region_seq;
	}
	public void setRegion_seq(int region_seq) {
		this.region_seq = region_seq;
	}
	public String getRegion_type() {
		return region_type;
	}
	public void setRegion_type(String region_type) {
		this.region_type = region_type;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getRegion_etc() {
		return region_etc;
	}
	public void setRegion_etc(String region_etc) {
		this.region_etc = region_etc;
	}	
}
