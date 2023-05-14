package bookstore;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.math.BigInteger;
public class DB {
	
			static  Connection con         = null;
			static  Statement stmt         = null;
			static  ResultSet rs           = null ;
			
			static String driver= "com.mysql.jdbc.Driver";
			static String URL = "jdbc:mysql://localhost:3306/bookstore" ;;
			
			public static void loadConnect()  {
				try {
					// ������ �ݴ´�.
					if( stmt != null ) stmt.close();
					if( con != null ) con.close();
				} catch (SQLException ex ) {};  

				// ����̹� �ε�
				try {
					Class.forName(driver);

				} catch ( java.lang.ClassNotFoundException e ) {
					System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
					e.printStackTrace();

				}

				try {

					// �����ϱ�
					con  = DriverManager.getConnection(URL, "root", "onlyroot");

					System.out.println("\n"+URL+"�� �����");


				} catch( SQLException ex ) 
				{

					System.err.println("** connection error in loadConnect(): " + ex.getMessage() );
					ex.printStackTrace();
				}	   

			}
			
			//�� ȸ������
			public static int insertCustomer(String id,String name,int age,String adress,String password) {
				String sql="insert into customer values('"+id+"','"+name+"','"+age+"','"+adress+"','"+password+"','0','0')";
				System.out.println("   >> SQL : " + sql + "\n");
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
				
			}
			
			//��й�ȣ ��ȣȭ
			public static String encriptPassword(String password) {
				if (password==null || password.equals(""))
					return "1Ew$H6KhfKHJHG";			
			
				return "" + password.hashCode();  // Java�� hashCode() �޼ҵ带 �̿��� ���� ������ ��ȣȭ
			}
			
			//ID�� ㅇㄹ
			public static String getPasswordById(String id) {
				String sql="select pw from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="����!!";
					return error;
				}
				return null;			
			}
			
			public static String getNameById(String id) {
				String sql="select cname from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="오류!!";
					return error;
				}
				return null;			
			}
			
			public static String getAgeById(String id) {
				String sql="select age from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="오류!!";
					return error;
				}
				return null;			
			}
			
			public static String getAddressById(String id) {
				String sql="select address from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="����!!";
					return error;
				}
				return null;			
			}
			
			public static String getBuyCntById(String id) {
				String sql="select buycnt from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="����!!";
					return error;
				}
				return null;			
			}
			
			public static String getBuySumById(String id) {
				String sql="select buysum from customer where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="����!!";
					return error;
				}
				return null;			
			}
			
			//isbn���� å�̸� �ҷ�����
			public static String getBookNameByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select* from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("bname");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			//isbn���� ���� �ҷ�����
			public static String getWriterByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select* from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("Writer");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			//isbn���� ���ǻ� �ҷ�����
			public static String getPublisherByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select* from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("publisher");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			public static String getManagerPasswordById(String id) {
				String sql="select pw from manager where id='"+id+"'";
				
				try {
					Statement stmt =con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
					String pw =rs.getString(1);
					return pw;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					String error ="����!!";
					return error;
				}
				return null;			
			}
			
			public static String getImagePathByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select* from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("imgpath");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			public static String getPriceByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select * from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("price");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			public static String getDetailByIsbn(String isbn) {
				
				String sql="select * from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("detail");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			public static String getCategoryByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select * from books where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("category");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			public static String getIsbnByBname(String bname) {
				String sql="select * from books where bname='"+bname+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("isbn");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			public static String getIsbnBySearch(String bname) {
				String sql="select * from books where bname like ?";
				
				try {
					PreparedStatement prstmt=con.prepareStatement(sql);
					prstmt.setString(1,"%"+bname+"%");
					ResultSet rs = prstmt.executeQuery();
					if(rs.next()) {
						String book =rs.getString("isbn");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				sql = "no";
				return sql;
			}
			public static int getRateByBname(String bname) {
				String sql="select * from books where bname='"+bname+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						int book =rs.getInt("rateavg");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return 0;
			}
			public static String getIsbnByBuyingno(int bno) {
				String sql="select * from buying where buyingno='"+bno+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("isbn");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			public static int inputReview(String rating,String review,int buyingno) {
				int year,month,day;
				year = Date.getYear();
				month = Date.getMonth();
				day = Date.getDay();
				
				String sql="update buying set rating = "+rating+", review = '"+review+"', "
						+ "reviewdate = '"+year+"-"+month+"-"+day+"' where buyingno = "+buyingno+"";
				return updateQuery(sql);
			}
			
			public static int updateQuery(String sql) { 
				int count;
				
				try {
					stmt = con.createStatement();
					count = stmt.executeUpdate(sql);  
					return count;
				} catch( SQLException ex ) 	    {
					System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
					return -1;
				}
			}
			
			public static String getReviewByIsbn(String isbn) {
				String sql="select * from buying where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String book =rs.getString("review");
						return book;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String ifNull = "아직 리뷰가 없습니다.";
				return ifNull;
			}
			public static int getNextno() {
				String sql = "select buyingno from buying order by buyingno desc";
				try {
					PreparedStatement prstmt = con.prepareStatement(sql);
					ResultSet rs =  prstmt.executeQuery();
					if(rs.next()) {
						return rs.getInt(1) + 1;
					}
					return 1;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return -1;
			}
			public static int buyingStep(String isbn,String cid,String price) { //구매처리 메소드
				int year,month,day;
				year = Date.getYear();
				month = Date.getMonth();
				day = Date.getDay();
				
				String sql="insert into buying values ("+isbn+",'"+cid+"',"+getNextno()+",'"+year+"-"+month+"-"+day+"',1,"+price+",null,null,null,'배송준비',null)";
				
				return updateQuery(sql);
			}
			
			//ID랑 PW 받아서 비밀번호바꾸기 비밀번호 암호화기능도 같이있다.
			public static int ChangePasswordById(String id,String password) {
				String enscriptpw =DB.encriptPassword(password);
			
				String sql="Update customer set pw ='"+enscriptpw+"' where id ='"+id+"'";
				System.out.println("   >> SQL : " + sql + "\n");
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
				
			}
			
			public static int shipDateUpdateByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				
				int year,month,day;
				year = Date.getYear();
				month = Date.getMonth();
				day = Date.getDay();
				
				String sql="update buying set shipdate='"+year+"-"+month+"-"+day+"' where isbn='"+isbn+"'";
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
				
			}
			public static String getIsbnFromShipDateNull() {
				
				String sql="select isbn from buying where shipdate is null";
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String isbn =rs.getString("isbn");
						return isbn;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;	
			}
			public static int updateShippingByIsbn(String isbn) {
				BigInteger a = new BigInteger(isbn);
				String sql="update buying set shipping='"+"배송출발"+"' where isbn='"+isbn+"'";
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
			}
			public static String getIsbnFromShipping() {
				String sql="select isbn from buying where shipping is 배송출발";
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String isbn =rs.getString("isbn");
						return isbn;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;	
			}
			
			public static int insertBook(int isbn, String bname,String writer,String publisher ,String category, int price, String imgpath, String detail) {
				String sql="insert into books values('"+isbn+"','"+bname+"','"+writer+"','"+publisher+"','"+category+"','"+price+"','0','0','0.0','"+imgpath+"','"+detail+"')";
				System.out.println("   >> SQL : " + sql + "\n");
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
			}
			
			public static int deleteBookByBname(String bname) {
				String sql="delete from books where bname='"+bname+"'";
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
			}
			
			public static String getShipDateByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select shipdate from buying where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String shipdate =rs.getString("shipdate");
						return shipdate;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			public static String getShippingByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select shipping from buying where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String shipping =rs.getString("shipping");
						return shipping;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			public static int deleteCustomerById(String id) {
				String sql="delete from customer where id='"+id+"'";
				System.out.println("   >> SQL : " + sql + "\n");
				
				try {
					Statement stmt =con.createStatement();
					return stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return 0;
				}
				
			}
			public static String getCustomer_IdByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select customer_id from buying where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String customer_id =rs.getString("customer_id");
						return customer_id;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
			
			public static String getDateByIsbn(String isbn) {
				BigInteger a=new BigInteger(isbn);
				String sql="select date from buying where isbn='"+isbn+"'";
				
				try {
					Statement stmt=con.createStatement();
					ResultSet rs =stmt.executeQuery(sql);
					if(rs.next()) {
						String date =rs.getString("date");
						return date;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sql;
			}
}


