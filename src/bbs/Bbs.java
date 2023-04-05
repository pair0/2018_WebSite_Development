package bbs;

import java.io.InputStream;

public class Bbs {
	private int bbsID;
	private int combbsID;
	private int combbsNum;
	private String bbsSearch;
	private String bbsSearchoption;
	private String bbsName;
	private String bbsCountry;
	private String bbsDate;
	private String bbsTitle;
	private String bbsMemo;
	private InputStream bbsFileData;
	private String bbsFileName;
	private int bbsCount;
	private int bbsGood;
	private int bbsBad;
	private int bbsAvailable;
	
	
	public String getBbsSearchoption() {
		return bbsSearchoption;
	}
	public void setBbsSearchoption(String bbsSearchoption) {
		this.bbsSearchoption = bbsSearchoption;
	}
	public String getBbsSearch() {
		return bbsSearch;
	}
	public void setBbsSearch(String bbsSearch) {
		this.bbsSearch = bbsSearch;
	}
	public int getBbsGood() {
		return bbsGood;
	}
	public void setBbsGood(int bbsGood) {
		this.bbsGood = bbsGood;
	}
	public int getBbsBad() {
		return bbsBad;
	}
	public void setBbsBad(int bbsBad) {
		this.bbsBad = bbsBad;
	}
	public int getCombbsNum() {
		return combbsNum;
	}
	public void setCombbsNum(int combbsNum) {
		this.combbsNum = combbsNum;
	}
	public int getCombbsID() {
		return combbsID;
	}
	public void setCombbsID(int combbsID) {
		this.combbsID = combbsID;
	}
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsName() {
		return bbsName;
	}
	public void setBbsName(String bbsName) {
		this.bbsName = bbsName;
	}
	public String getBbsCountry() {
		return bbsCountry;
	}
	public void setBbsCountry(String bbsCountry) {
		this.bbsCountry = bbsCountry;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsMemo() {
		return bbsMemo;
	}
	public void setBbsMemo(String bbsMemo) {
		this.bbsMemo = bbsMemo;
	}
	public InputStream getBbsFileData() {
		return bbsFileData;
	}
	public void setBbsFileData(InputStream bbsFileData) {
		this.bbsFileData = bbsFileData;
	}
	public String getBbsFileName() {
		return bbsFileName;
	}
	public void setBbsFileName(String bbsFileName) {
		this.bbsFileName = bbsFileName;
	}
	public int getBbsCount() {
		return bbsCount;
	}
	public void setBbsCount(int bbsCount) {
		this.bbsCount = bbsCount;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
	
}
