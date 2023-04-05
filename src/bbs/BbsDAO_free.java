package bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO_free {
	
	private Connection conn;

	private ResultSet rs;
	
	public BbsDAO_free() {
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
		String SQL = "select bbsID from TABLE_201721363_free order by bbsID desc";
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
		String SQL = "select * from TABLE_201721363_free where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 5";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsName(rs.getString(2));
				bbs.setBbsDate(rs.getString(3));
				bbs.setBbsTitle(rs.getString(4));
				bbs.setBbsMemo(rs.getString(5));
				bbs.setBbsFileData(rs.getBinaryStream(6));
				bbs.setBbsFileName(rs.getString(7));
				bbs.setBbsCount(rs.getInt(8));
				bbs.setBbsAvailable(rs.getInt(9));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	
	public int write(String bbsName, String bbsTitle, String bbsMemo, String bbsFileName, int bbsCount)
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
		
		String SQL = "insert into TABLE_201721363_free values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, getDate() );
			pstmt.setString(4, bbsTitle );
			pstmt.setString(5, bbsMemo );
			if( fin != null ) pstmt.setBinaryStream(6, fin, (int)imgFile.length() ); //파일 데이터
			pstmt.setString(7, realFileName );
			pstmt.setInt(8, bbsCount );
			pstmt.setInt(9, 1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int write(String bbsName, String bbsTitle, String bbsMemo, int bbsCount)
	{
		String SQL = "insert into TABLE_201721363_free values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, getDate() );
			pstmt.setString(4, bbsTitle );
			pstmt.setString(5, bbsMemo );
			pstmt.setBinaryStream(6, null); //파일 데이터
			pstmt.setString(7, null );
			pstmt.setInt(8, bbsCount );
			pstmt.setInt(9, 1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	
	public int writeFile(String bbsName, String bbsTitle, String bbsMemo, String bbsFilname, String bbsFileRealname, int bbsCount)
	{
		String SQL = "insert into TABLE_201721363_free values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, getDate() );
			pstmt.setString(4, bbsTitle );
			pstmt.setString(5, bbsMemo );
			pstmt.setInt(6, 1 );
			pstmt.setString(7, bbsFilname );
			pstmt.setString(8,  bbsFileRealname );
			pstmt.setInt(9, bbsCount );
			pstmt.setInt(10, 1 );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
		
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from TABLE_201721363_free where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 5";
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
		String SQL = "select * from TABLE_201721363_free where bbsID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsName(rs.getString(2));
				bbs.setBbsDate(rs.getString(3));
				bbs.setBbsTitle(rs.getString(4));
				bbs.setBbsMemo(rs.getString(5));
				bbs.setBbsFileData(rs.getBinaryStream(6));
				bbs.setBbsFileName(rs.getString(7));
				bbs.setBbsCount(rs.getInt(8));
				bbs.setBbsAvailable(rs.getInt(9));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID,  String bbsTitle, String bbsMemo, String bbsFileName)
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
		
		String SQL = "update TABLE_201721363_free set bbsTitle=?, bbsDate=?, bbsMemo=?, bbsFileData=?, bbsFileName=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle );
			pstmt.setString(2, getDate() );
			pstmt.setString(3, bbsMemo );
			if( fin != null ) pstmt.setBinaryStream(4, fin, (int)imgFile.length() ); //파일 데이터
			pstmt.setString(5, realFileName );
			pstmt.setInt(6, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}

	
	public int update(int bbsID, String bbsTitle, String bbsMemo)
	{
		
		String SQL = "update TABLE_201721363_free set bbsTitle=?, bbsDate=?, bbsMemo=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle );
			pstmt.setString(2, getDate() );
			pstmt.setString(3, bbsMemo );
			pstmt.setInt(4, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update1(int bbsID)
	{
		
		String SQL = "update TABLE_201721363_free set bbsCount=bbsCount+1 where bbsID=?";
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
		String SQL = "update TABLE_201721363_free set bbsAvailable=0 where bbsID=?";
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

