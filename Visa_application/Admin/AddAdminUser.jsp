<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,joseph.Database"%>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>

<body Class="SC">
<center>
<!--Declaration of varaibles-->

<%! String errormsg ;%>
<%! String dislUserName ;%>
<%! String dislpwd ;%>
<%! String dislnewpwd ;%>
    

<% 
   /*Retreiving user id and password*/

    dislUserName = request.getParameter("UserName");
    if(dislUserName == null)
    dislUserName = "";
    dislpwd = request.getParameter("Password");
    if(dislpwd == null)
    dislpwd = "";

%>
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="menu.jsp" flush="true" />
				</td>
				
				<td width="*" height="100%">


<%

/*Declaration of variables*/


ResultSet rs=null;
	Database con = new Database();

String UserName,Password;

try
{

	/*Getting the connection variable from session*/

	

	String Query = "SELECT * from LoginDetails where UserName = \'"+dislUserName+
		"\' and Password =\'"+dislpwd+"\'";
	System.out.println(Query);
	rs = con.getResultSet(Query);
		
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
/* If user provides valid username & password then update the new password to database*/
if(rs.next())
{
%>
		<B> User already exists.</B>
			<BR>
    <A href="home.jsp" class=genlinks> Home </A>

	<%
}else{
String InsertQuery = 
"Insert into Logindetails Values ('"+dislUserName+"','"+dislpwd+"','Administrator')";
System.out.println(InsertQuery);
	int rowsAffected=con.setResultSet(InsertQuery);		
	System.out.println("Rows Affected = " + rowsAffected);

if(rowsAffected==1)
	{%>
		<B> User created Successfully</B>
			<BR>
    <A href="home.jsp" class=genlinks> Home </A>

	<%}
/* If user provides invalid password or username*/
else{%>
		<B>Error in updating... Please Try again </B>
	<BR>

		<A href="ChangePassword1.jsp" class=genlinks> Back </A>

<%
}
}
%>


	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>
</BODY>
</HTML>




