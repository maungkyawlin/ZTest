/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;




/**
 *
 * @author IT(ERA)
 */
@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet2</title>");
          ///// Bootstrap Links ...
            out.println("<link href=\"bootstrap/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\"/>");
            out.println(" <link rel=\"stylesheet\" href=\"bootstrap/bootstrap/css/bootstrap-grid.min.css\" type=\"text/css\"/>");
            out.println("<style src=\"../bootstrap/js/bootstrap.min.js\"></style>");
       ///

            out.println("</head>");
            out.println("<body style=\"background: url(image/window.webp);background-size: cover;background-attachment: fixed;\">");
            
           
             String name=request.getParameter("name");
             String password=request.getParameter("password");
             String email=request.getParameter("email");
             Connection con=null;
             RequestDispatcher dispatcher=null;  
            
            
                 
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
                
                 String ins="insert into user(name,password,email)values(?,?,?)";
                 PreparedStatement pst=con.prepareStatement(ins);
                  pst.setString(1, name);
                  pst.setString(2, password);
                  pst.setString(3, email);
             
                  int rowCont= pst.executeUpdate();
                  dispatcher=request.getRequestDispatcher("signup.jsp");
                  if(rowCont>0){
                      request.setAttribute("status", "<h1 style=\"color:white;\" >Register Success</h1>");
                  }
             
                  else{
                      
                      request.setAttribute("status", "Register Failed");
                  }
               
                   
               
                } 
               catch (Exception ex) {
         
                    ex.getStackTrace();
                    out.print("<h4 style=\"color:white;\">Error ..</h4>");
        
                    }
             
             finally{
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Servlet2.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
                
                 
      
          
          
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String id=request.getParameter("id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
            PreparedStatement pst=con.prepareStatement("select * from register where id=?");
            pst.setString(1, id);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                out.print("<div class=\"container\">");
                out.print("<table>");
                out.print("<tr>"
                        + "<td>Name</td>"
                         + "<td>Password</td>"
                         + "<td>Email</td>"
                        
                        + "</tr>");
                out.print("</table>");
                
                out.print("</div>");
            }
            
        } catch (Exception ex) {
            Logger.getLogger(Servlet2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
        
        
    }// </editor-fold>

}
