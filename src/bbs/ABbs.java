package bbs;

import java.io.InputStream;

public class ABbs {
	private int imageId;
	private String sampleText;
	private String imageFileName;
	private InputStream imageData;
	private int imageCount;
	private int imageAvailable;
	public int getImageId() {
		return imageId;
	}
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	public String getSampleText() {
		return sampleText;
	}
	public void setSampleText(String sampleText) {
		this.sampleText = sampleText;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public int getImageCount() {
		return imageCount;
	}
	public void setImageCount(int imageCount) {
		this.imageCount = imageCount;
	}
	public int getImageAvailable() {
		return imageAvailable;
	}
	public void setImageAvailable(int imageAvailable) {
		this.imageAvailable = imageAvailable;
	}
	public InputStream getImageData() {
		return imageData;
	}
	public void setImageData(InputStream imageData) {
		this.imageData = imageData;
	}
}

