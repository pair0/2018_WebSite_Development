package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
    
    public int login(String userID, String userPassword)
	{
		String SQL = "select userPassword, userAvailable From User where userID =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if( rs.next())
			{
				if(rs.getString(1).equals(userPassword))
				{
					if(rs.getInt(2)==0)
						return -1; //id not exist
					return 1; //login success
				}
				else
					return 0; //password error
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //db error
	}
    
    public String IDfind(String userName, String userPhone)
	{
		String SQL = "select userName, userAvailable, userID From User where userPhone =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userPhone);
			rs = pstmt.executeQuery();
			if( rs.next())
			{
				User user=new User();
				user.setUserID(rs.getString(3));
				if(rs.getString(1).equals(userName))
				{
					if(rs.getInt(2)==0)
						return null; //id not exist
					return user.getUserID(); //login success
				}
				else
					return null; //password error
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null; //db error
	}
    
    public String passwordfind(String userID, String userName, String userPhone)
   	{
   		String SQL = "select userName, userAvailable, userPhone, userPassword From User where userID =?";
   		try {
   			pstmt = conn.prepareStatement(SQL);
   			pstmt.setString(1,userID);
   			rs = pstmt.executeQuery();
   			if( rs.next())
   			{
   				User user=new User();
   				user.setUserPassword(rs.getString(4));
   				if(rs.getString(1).equals(userName) && rs.getString(3).equals(userPhone))
   				{
   					if(rs.getInt(2)==0)
   						return null; //id not exist
   					return user.getUserPassword(); //login success
   				}
   				else
   					return null; //password error
   			}
   		}catch(Exception e)
   		{
   			e.printStackTrace();
   		}
   		return null; //db error
   	}
    
    public int join(User user)
   	{
   		String SQL = "insert into User values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
   		try {
   			pstmt = conn.prepareStatement(SQL);
   				pstmt.setString(1, user.getUserID());
   	            pstmt.setString(2, user.getUserPassword());
   	            pstmt.setString(3, user.getUserName());
   	            pstmt.setString(4, user.getUserGender());
   	            pstmt.setString(5, user.getUserBirthdayy());
   	            pstmt.setString(6, user.getUserBirthdaym());
   	            pstmt.setString(7, user.getUserBirthdayd());
   	            pstmt.setString(8, user.getUserEmail1());
   	            pstmt.setString(9, user.getUserEmail2());
   	            pstmt.setString(10, user.getUserPhone());
   	            pstmt.setString(11, user.getUserAddress());
   	            pstmt.setString(12, user.getUserSurvey());
   	            pstmt.setInt(13, 1 );
   			return pstmt.executeUpdate();
   	
   		}catch(Exception e)
   		{
   			e.printStackTrace();
   		}
   		return -1; //db error
   	}
    
    
    public User getBbs(String userID) {
		String SQL = "select * from User where userID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User bbs = new User();
				bbs.setUserID(rs.getString(1));
				bbs.setUserPassword(rs.getString(2));
				bbs.setUserName(rs.getString(3));
				bbs.setUserGender(rs.getString(4));
				bbs.setUserBirthdayy(rs.getString(5));
				bbs.setUserBirthdaym(rs.getString(6));
				bbs.setUserBirthdayd(rs.getString(7));
				bbs.setUserEmail1(rs.getString(8));
				bbs.setUserEmail2(rs.getString(9));
				bbs.setUserPhone(rs.getString(10));
				bbs.setUserAddress(rs.getString(11));
				bbs.setUserSurvey(rs.getString(12));
				bbs.setUserAvailable(rs.getInt(13));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
    
    public int update(String userID, String userPassword, String userName, String userGender, String userBirthdayy, String userBirthdaym, String userBirthdayd,String userEmail1, String userEmail2, String userPhone, String userAddress, String userSurvey)
	{
		
		String SQL = "update User set userPassword=?, userName=?, userGender=?, userBirthdayy=?, userBirthdaym=?, userBirthdayd=?, userEmail1=?, userEmail2=?, userPhone=?, userAddress=?, userSurvey=? where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword );
			pstmt.setString(2, userName );
			pstmt.setString(3, userGender );
			pstmt.setString(4, userBirthdayy );
			pstmt.setString(5, userBirthdaym );
			pstmt.setString(6, userBirthdayd );
			pstmt.setString(7, userEmail1 );
			pstmt.setString(8, userEmail2 );
			pstmt.setString(9, userPhone );
			pstmt.setString(10, userAddress );
			pstmt.setString(11, userSurvey );
			pstmt.setString(12, userID );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
    
    public int delete(String userID)
	{
		String SQL = "update User set userAvailable=0 where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
