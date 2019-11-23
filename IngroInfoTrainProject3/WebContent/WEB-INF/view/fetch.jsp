<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/trainprojectversion2";

	String userid = "hbstudent";
	String password = "hbstudent";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		String reader = request.getParameter("namevalue");
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement = connection.createStatement();
		String sql = "select Consumer_name from daily_arrear_list where READER='MR1'";
		/*String query = "SELECT * FROM daily_arrear_list D where D.READER= 'MR1'";*/
		/* String query = "SELECT Consumer_name FROM daily_arrear_list D where D.READER= 'MR1'"; */
		resultSet = statement.executeQuery(sql);
		int i = 0;
		while (resultSet.next()) {
			String consumerName = resultSet.getString("Consumer_name");
			i++;
			System.out.println(consumerName);
		}
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
