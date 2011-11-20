/**
 * 
 */
package com.goodjob.zipcode;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class ZipCodeDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8742233296762761025L;

	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	
}
