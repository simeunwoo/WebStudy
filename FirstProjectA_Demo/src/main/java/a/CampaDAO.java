package a;
import java.util.*;
import java.sql.*;
public class CampaDAO {
   private Connection conn;
   private PreparedStatement ps;
   private static CampaDAO dao;
   private final String URL="jdbc:oracle:thin:@211.238.142.124:1521:XE";
   
   // 드라이버 등록 
   public CampaDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) {}
   }
   
   // 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr2","happy");
	   }catch(Exception ex) {}
   }
   // 해제 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 싱글턴
   public static CampaDAO newInstance()
   {
	   if(dao==null)
		   dao=new CampaDAO();
	   return dao;
   }
   // 기능 
   /*
 CAMP_NO                                   NOT NULL NUMBER
 CAMP_PRICE                                NOT NULL NUMBER
 CAMP_NAME                                 NOT NULL VARCHAR2(51)
 CAMP_ADDR                                          VARCHAR2(200)
 CAMP_PHONE                                         VARCHAR2(20)
 CAMP_CONTENT                                       CLOB
 CAMP_IMAGE                                         VARCHAR2(4000)
 CAMP_WIFI                                          VARCHAR2(30)
 CAMP_STORE                                         VARCHAR2(30)
 CAMP_ANIMAL                                        VARCHAR2(30)    
    */
   public void campInsert(CampaVO vo)
   {
	   try
	   {
		   getConnection();
		   String sql="INSERT INTO camp(camp_no,camp_price,camp_name,camp_addr"
		   		+ ",camp_phone,camp_content,camp_image,camp_wifi,camp_store,camp_animal) "
				     +"VALUES(camp_no_seq.nextval,?,?,?,?,?,?,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getCamp_price());
		   ps.setString(2, vo.getCamp_name());
		   ps.setString(3, vo.getCamp_addr());
		   ps.setString(4, vo.getCamp_phone());
		   ps.setString(5, vo.getCamp_content());
		   ps.setString(6, vo.getCamp_image());
		   ps.setString(7, vo.getCamp_wifi());
		   ps.setString(8, vo.getCamp_store());
		   ps.setString(9, vo.getCamp_animal());
		   
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
   }
}





