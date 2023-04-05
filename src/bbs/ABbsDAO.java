package bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ABbsDAO {
	
	private Connection conn;

	private ResultSet rs;
	
	
	
	public ABbsDAO() {
		try {
			String dbURL = "jdbc:mysql://203.230.193.204:3306/201721363";
			String dbID ="201721363";
			String dbPassword="201721363";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getNext()
	{
		String SQL = "select imageId from IMAGE_TABLE order by imageId desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //db error
	}
	
	public int write(String sampleText, String imageFileName, int imageCount) 
	{
	
		File imgFile = new File(imageFileName);
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String SQL = "insert into IMAGE_TABLE values (?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			if( fin != null ) pstmt.setBinaryStream(2, fin, (int)imgFile.length() );
			pstmt.setString(3, sampleText );
			pstmt.setInt(4, imageCount );
			pstmt.setInt(5, 1);
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int write(String sampleText, int imageCount) 
	{

		String SQL = "insert into IMAGE_TABLE values (?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setBinaryStream(2, null);
			pstmt.setString(3, sampleText );
			pstmt.setInt(4, imageCount );
			pstmt.setInt(5, 1);
	
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public ABbs getBbs(int imageId) {
		String SQL = "select * from IMAGE_TABLE where imageId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, imageId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ABbs bbs = new ABbs();
				bbs.setImageId(rs.getInt(1) );
				bbs.setImageData(rs.getBinaryStream(2));
				bbs.setSampleText(rs.getString(3));
				bbs.setImageCount(rs.getInt(4) );
				bbs.setImageAvailable(rs.getInt(5));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}

	public ArrayList<ABbs> getList(int pageNumber)
	{
		String SQL = "select * from IMAGE_TABLE where imageId < ? AND imageAvailable = 1 order by imageId desc limit 5";
		ArrayList<ABbs> list = new ArrayList<ABbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ABbs bbs = new ABbs();
				bbs.setImageId(rs.getInt(1) );
				bbs.setImageData(rs.getBinaryStream(2));
				bbs.setSampleText(rs.getString(3));
				bbs.setImageCount(rs.getInt(4));
				bbs.setImageAvailable(rs.getInt(5));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from IMAGE_TABLE where imageId < ? AND imageAvailable = 1 order by imageId desc limit 5";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public int update(int imageId, String sampleText, String imageFileName)
	{
		File imgFile = new File(imageFileName);
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String SQL = "update IMAGE_TABLE set sampleText=?, imageFile=? where imageId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, sampleText );
			if( fin != null ) pstmt.setBinaryStream(2, fin, (int)imgFile.length() );
			pstmt.setInt(3, imageId );
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update(int imageId, String sampleText)
	{
		String SQL = "update IMAGE_TABLE set sampleText=? where imageId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, sampleText );
			pstmt.setInt(2, imageId );
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update1(int imageId)
	{
		
		String SQL = "update IMAGE_TABLE set imageCount=imageCount+1 where imageId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, imageId );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int delete(int imageId)
	{
		String SQL = "update IMAGE_TABLE set imageAvailable=0 where imageId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, imageId );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}

}

