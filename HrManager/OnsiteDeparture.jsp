<%@ page language="java" import="java.sql.*,joseph.Database" errorPage="" %><html><head><title>Visa Processing</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head><body><table width="900" height="100%" align="center">	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>	<tr><td width="100%" height="*" align="center">		<table width="100%" height="100%" border="0">			<tr>				<td width="175" height="100%" valign="top">					<jsp:include page="menu.jsp" flush="true" />				</td>								<td width="*" height="100%" valign="top"><br><br>					<table width="100%">					<script language="JavaScript">						function Validate(){							if(document.f1.EmpID.value==""){								alert("Plz Select Employee");								document.f1.EmpID.focus();								return false;							}							return true;						}					</script>					<form name="f1" action="ShowOnsiteDeparture.jsp" method="post" onSubmit="return Validate();">						<tr>                  <td width="200"><font color="#001967"><strong>Onsite Departure Details</strong></font></td>                  <td width="*"></td></tr>						<tr>                  <td align="right"><font color="#001967">Select Employee : </font></td>	<td>		<select name="EmpID">			<option value="">..Select..</option>			<% 				Database con=new Database();				ResultSet rs=con.getResultSet("select EmpID,EmpName from EmpDetails where EmpID in (select distinct(EmpID) from ApplicationEntry where Enquiry='yes' and Interview='yes' and Results='yes' and OnsiteDeparture='no')");				while(rs.next()){					String EmpID=rs.getString("EmpID");					String EmpName=rs.getString("EmpName");			%>			<option value="<%= EmpID %>"><%= EmpID %> &nbsp; <%= EmpName %></option>			<% } %>		</select>	</td></tr>						<tr><td height="20"></td><td width="*"></td></tr>						<tr><td></td><td width="*"><input type="submit" value="   Submit   "></td></tr>					</form>					</table>									</td>			</tr>		</table>	</td></tr>	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr></table></body></html>