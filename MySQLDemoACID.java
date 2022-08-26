
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author cscharff Sample of JDBC for MySQL 
 * ACID is implemented
 */

public class MySQLDemoACID {

	public static void main(String args[]) throws SQLException, IOException, 
	ClassNotFoundException {

		System.out.println("Beginning");
		
		// Load the MySQL driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		// Old driver
		// Class.forName("com.mysql.jdbc.Driver");

		// Connect to the default database with credentials
		// You will have to change your credentials
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "root");

		// For atomicity
		conn.setAutoCommit(false);

		// For isolation
		conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

		Statement stmt1 = null;
		try {
			// Create statement object
			stmt1 = conn.createStatement();
			
			// Maybe a table student exists, maybe not
			// create table student(id integer, name varchar(10), primary key(id))
			// Either the 2 following inserts are executed, or none of them are. This is
			// atomicity
			stmt1.executeUpdate("insert into student values (1, 'stud1')");
			stmt1.executeUpdate("insert into student values (2, 'stud2')");
		} catch (SQLException e) {
			System.out.println("An exception was thrown");
			e.printStackTrace();
			// For atomicity
			conn.rollback();
			stmt1.close();
			conn.close();
			return;
		}
		conn.commit();
		stmt1.close();
		conn.close();
		System.out.println("End");
	}
}
