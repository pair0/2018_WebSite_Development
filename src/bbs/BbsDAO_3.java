package bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO_3 {
	
	private Connection conn;

	private ResultSet rs;
	
	public BbsDAO_3() {
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
	
	public String getDate()
	{
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //db error
	}
	
	public int getNext()
	{
		String SQL = "select bbsID from TABLE_201721363_3 order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public ArrayList<Bbs> getList(int pageNumber)
	{
		String SQL = "select * from TABLE_201721363_3 where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 5";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsName(rs.getString(2));
				bbs.setBbsCountry(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsTitle(rs.getString(5));
				bbs.setBbsMemo(rs.getString(6));
				bbs.setBbsFileData(rs.getBinaryStream(7));
				bbs.setBbsFileName(rs.getString(8));
				bbs.setBbsCount(rs.getInt(9));
				bbs.setBbsAvailable(rs.getInt(10));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	
	public int write(String bbsName, String bbsCountry, String bbsTitle, String bbsMemo, String bbsFileName, int bbsCount)
	{
		File imgFile = new File(bbsFileName);
		String realFileName = imgFile.getName();
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String SQL = "insert into TABLE_201721363_3 values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, bbsCountry );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, bbsTitle );
			pstmt.setString(6, bbsMemo );
			if( fin != null ) pstmt.setBinaryStream(7, fin, (int)imgFile.length() ); //파일 데이터
			pstmt.setString(8, realFileName );
			pstmt.setInt(9, bbsCount );
			pstmt.setInt(10, 1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int write(String bbsName, String bbsCountry, String bbsTitle, String bbsMemo, int bbsCount)
	{
		String SQL = "insert into TABLE_201721363_3 values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, bbsCountry );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, bbsTitle );
			pstmt.setString(6, bbsMemo );
			pstmt.setBinaryStream(7, null); //파일 데이터
			pstmt.setString(8, null );
			pstmt.setInt(9, bbsCount );
			pstmt.setInt(10, 1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int writeFile(String bbsName, String bbsCountry, String bbsTitle, String bbsMemo, String bbsFilname, String bbsFileRealname, int bbsCount)
	{
		String SQL = "insert into TABLE_201721363_3 values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, bbsCountry );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, bbsTitle );
			pstmt.setString(6, bbsMemo );
			pstmt.setInt(7, 1 );
			pstmt.setString(8, bbsFilname );
			pstmt.setString(9,  bbsFileRealname );
			pstmt.setInt(10, bbsCount );
			pstmt.setInt(11, 1 );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
		
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from TABLE_201721363_3 where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 5";
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
	
	public Bbs getBbs(int bbsID) {
		String SQL = "select * from TABLE_201721363_3 where bbsID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsName(rs.getString(2));
				bbs.setBbsCountry(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsTitle(rs.getString(5));
				bbs.setBbsMemo(rs.getString(6));
				bbs.setBbsFileData(rs.getBinaryStream(7));
				bbs.setBbsFileName(rs.getString(8));
				bbs.setBbsCount(rs.getInt(9));
				bbs.setBbsAvailable(rs.getInt(10));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID, String bbsCountry, String bbsTitle, String bbsMemo, String bbsFileName)
	{
		File imgFile = new File(bbsFileName);
		String realFileName = imgFile.getName();
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String SQL = "update TABLE_201721363_3 set bbsCountry=?, bbsTitle=?, bbsDate=?, bbsMemo=?, bbsFileData=?, bbsFileName=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsCountry );
			pstmt.setString(2, bbsTitle );
			pstmt.setString(3, getDate() );
			pstmt.setString(4, bbsMemo );
			if( fin != null ) pstmt.setBinaryStream(5, fin, (int)imgFile.length() ); //파일 데이터
			pstmt.setString(6, realFileName );
			pstmt.setInt(7, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}

	
	public int update(int bbsID, String bbsCountry, String bbsTitle, String bbsMemo)
	{
		
		String SQL = "update TABLE_201721363_3 set bbsCountry=?, bbsTitle=?, bbsDate=?, bbsMemo=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsCountry );
			pstmt.setString(2, bbsTitle );
			pstmt.setString(3, getDate() );
			pstmt.setString(4, bbsMemo );
			pstmt.setInt(5, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update1(int bbsID)
	{
		
		String SQL = "update TABLE_201721363_3 set bbsCount=bbsCount+1 where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int delete(int bbsID)
	{
		String SQL = "update TABLE_201721363_3 set bbsAvailable=0 where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}

