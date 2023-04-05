package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class mapDAO {
	
	private Connection conn;

	private ResultSet rs;
	
	public mapDAO() {
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
		String SQL = "select bbsID from TABLE_201721363_map order by bbsID desc";
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
		String SQL = "select * from TABLE_201721363_map where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
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
				bbs.setBbsAvailable(rs.getInt(5));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	
	public int write(String bbsName, String bbsCountry)
	{
		String SQL = "insert into TABLE_201721363_map values (?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, bbsName );
			pstmt.setString(3, bbsCountry );
			pstmt.setString(4, getDate() );;
			pstmt.setInt(5, 1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int writeFile(String bbsName, String bbsCountry, String bbsTitle, String bbsMemo, String bbsFilname, String bbsFileRealname)
	{
		String SQL = "insert into TABLE_201721363_map values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
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
			pstmt.setInt(10, 1 );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
		
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from TABLE_201721363_map where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
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
		String SQL = "select * from TABLE_201721363_map where bbsID =?";
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
				bbs.setBbsAvailable(rs.getInt(5));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID, String bbsCountry)
	{	
		String SQL = "update TABLE_201721363_map set bbsCountry=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsCountry );;
			pstmt.setInt(2, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}

	
	public int delete(int bbsID)
	{
		String SQL = "update TABLE_201721363_map set bbsAvailable=0 where bbsID=?";
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

