
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author cscharff Sample of JDBC for MySQL
 * Note that this code is wrong as
 * ACID in not implemented
 */

public class MySQLDemoWrongNotACID {

	/**
	 * @param args
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static void main(String args[]) throws SQLException, IOException, 
	ClassNotFoundException {

		// Load the MySQL driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		// Old driver
		// Class.forName("com.mysql.jdbc.Driver");

		// Connect to the default database with credentials
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "root");

		Statement stmt = conn.createStatement();

		// create table student(Id integer, Name varchar(10));
		// I did not put any primary key such that this code can be executed several
		// times
		
		// The inserts are not implemented with atomicity

		stmt.executeUpdate("insert into student values (1,'Smith')");

		stmt.executeUpdate("insert into student values (2,'John')");

		ResultSet rs = stmt.executeQuery("select * from  student");

		while (rs.next()) {
			System.out.println("ID: " + rs.getInt("ID") + " NAME: " + rs.getString("NAME"));
		}
	}
}