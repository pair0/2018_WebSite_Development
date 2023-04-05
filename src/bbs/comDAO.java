package bbs;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class comDAO {
	
	private Connection conn;

	private ResultSet rs;
	
	public comDAO() {
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
		String SQL = "select bbsID from TABLE_201721363_com order by bbsID desc";
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
		String SQL = "select * from TABLE_201721363_com where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 100";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*100);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setCombbsID(rs.getInt(2));
				bbs.setCombbsNum(rs.getInt(3));
				bbs.setBbsGood(rs.getInt(4));
				bbs.setBbsBad(rs.getInt(5));
				bbs.setBbsName(rs.getString(6));
				bbs.setBbsMemo(rs.getString(7));
				bbs.setBbsDate(rs.getString(8));
				bbs.setBbsAvailable(rs.getInt(9));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	
	public int write(int combbsID, int combbsNum, int bbsGood, int bbsBad, String bbsName, String bbsMemo)
	{
		String SQL = "insert into TABLE_201721363_com values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setInt(2, combbsID );
			pstmt.setInt(3, combbsNum );
			pstmt.setInt(4, bbsGood );
			pstmt.setInt(5, bbsBad );
			pstmt.setString(6, bbsName );
			pstmt.setString(7, bbsMemo );
			pstmt.setString(8, getDate() );
			pstmt.setInt(9, 1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int writeFile(int bbsGood, int bbsBad, String bbsName, String bbsCountry, String bbsTitle, String bbsMemo, String bbsFilname, String bbsFileRealname)
	{
		String SQL = "insert into TABLE_201721363_com values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setInt(2, bbsGood );
			pstmt.setInt(3,  bbsBad);
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
		String SQL = "select * from TABLE_201721363_com where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 100";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*100);
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
		String SQL = "select * from TABLE_201721363_com where bbsID =?, ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setCombbsID(rs.getInt(2) );
				bbs.setCombbsNum(rs.getInt(3) );
				bbs.setBbsGood(rs.getInt(4) );
				bbs.setBbsBad(rs.getInt(5) );
				bbs.setBbsName(rs.getString(6));
				bbs.setBbsMemo(rs.getString(7));
				bbs.setBbsDate(rs.getString(8));
				bbs.setBbsAvailable(rs.getInt(9));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public Bbs getBbs(int bbsID, int combbsID, int combbsNum) {
		String SQL = "select * from TABLE_201721363_com where bbsID =?, combbsID=?, combbsNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setInt(2, combbsID);
			pstmt.setInt(3, combbsNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setCombbsID(rs.getInt(2) );
				bbs.setCombbsNum(rs.getInt(3) );
				bbs.setBbsGood(rs.getInt(4) );
				bbs.setBbsBad(rs.getInt(5) );
				bbs.setBbsName(rs.getString(6));
				bbs.setBbsMemo(rs.getString(7));
				bbs.setBbsDate(rs.getString(8));
				bbs.setBbsAvailable(rs.getInt(9));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID, String bbsMemo)
	{	
		String SQL = "update TABLE_201721363_com set bbsMemo=?, bbsDate=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsMemo );
			pstmt.setString(2, getDate() );
			pstmt.setInt(3, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update1(int bbsID)
	{
		
		String SQL = "update TABLE_201721363_com set bbsGood=bbsGood+1 where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update2(int bbsID)
	{
		
		String SQL = "update TABLE_201721363_com set bbsBad=bbsBad+1 where bbsID=?";
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
		String SQL = "update TABLE_201721363_com set bbsAvailable=0 where bbsID=?";
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

