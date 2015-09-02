/*
	Name 		:	S.Joseph Beevin
	Designation	:	Programmer
	Date		:	2006-02-07
	place		:	Horizone Technologies, T.Nagar.


	Project Name 	:	"Visa Processing"
*/

// Package
package joseph;

import java.io.*;
import java.net.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

// Start Of Class
public class delEmploy extends HttpServlet {

    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

    }

    /** Destroys the servlet.
     */
    public void destroy() {

    }

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        // geting Values from HTML Page
		String ExeID=request.getParameter("ExeID");

        //declaration
		Database con=null;
		String Qry=null,Qry1=null;

        //Establishing Databasse Connection
		try{
			con=new Database();
		}catch(Exception e){
			System.out.println("Cannot Create Connection : newEmployee.class"+e);
		}

        //Delete Respective Executive
        try{
			Qry="delete from LoginDetails where UserName='"+ExeID+"'";
			System.out.println("Qry"+Qry);
			int n=con.setResultSet(Qry);
			Qry1="delete from empdetails where empid='"+ExeID+"'";
			System.out.println("Qry"+Qry1);
			int m=con.setResultSet(Qry1);

			con.closeResultSet();
		}catch(Exception e){
			System.out.println("Error While Generating HrExecutiveID"+e);
		}
		//Re Directing Page to DeleteExecute
		response.sendRedirect("Admin/DeleteEmploy.jsp");
    }

    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }

}
