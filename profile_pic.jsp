<title>profile pics</title><%@ include file="connect.jsp" %>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%
 Blob image = null;
    byte[] imgData = null;
	String type = request.getParameter("type");
	//String name = (String)application.getAttribute("name");
  	try{  
	     
		  if(type.equalsIgnoreCase("user"))
		{
		int id = Integer.parseInt(request.getParameter("id"));      
    	Statement st=connection.createStatement();
    	String strQuery = "select image from user where id='"+id+"'" ;
    	ResultSet rs = st.executeQuery(strQuery);
    	String imgLen="";
    	if(rs.next())
		{
      		image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
}
				 response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
		}
		
		else if(type.equalsIgnoreCase("tweet"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			Statement st=connection.createStatement();
			String strQuery = "select image from tweets where id="+id+"" ;
			ResultSet rs = st.executeQuery(strQuery);
			String imgLen="";
			if(rs.next())
			{
				image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
}
				 response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
			
		}
		
		
  	}
  	catch (Exception e){
    	e.printStackTrace();
  	}
%>
</body>
</html>