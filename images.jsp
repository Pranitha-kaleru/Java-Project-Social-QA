<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ include file="connect.jsp" %>
    <%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
Blob image = null;
    byte[] imgData = null;
	
  	try{  
	     			String value=request.getParameter("value"); 
					String name = request.getParameter("name");

			if(value.equals("user"))
			{
				int id = Integer.parseInt(request.getParameter("id"));
				Statement st=connection.createStatement();
				String strQuery = "select image from user where id='"+id+"'|| username='"+name+"' ";
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
		else if(value.equals("places"))
		{
				int i=Integer.parseInt(request.getParameter("id")); 
				Statement st=connection.createStatement();
				String strQuery = "select image from places where id='"+i+"' " ;
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
		else if(value.equals("photos"))
		{
				int i=Integer.parseInt(request.getParameter("id"));
				Statement st=connection.createStatement();
				String strQuery = "select image from photos where  id='"+i+"' " ;
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
		else
		{}
		
		
			
			
		
		
  	}
  	catch (Exception e){
    	out.print(e);
  	}
%>

</body>
</html>