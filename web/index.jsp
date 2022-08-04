<%-- 
    Document   : index
    Created on : Jun 2, 2022, 3:52:33 PM
    Author     : IT(ERA)
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date  " %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/bootstrap/css/bootstrap-grid.min.css" type="text/css"/>
      <script src="../bootstrap/js/bootstrap.min.js"></script>
      
        
        <style>
            td{
               text-align: right;
               
            }
            input{
               border:none;
                border-bottom: 1px solid paleturquoise;
            }
            label{
                font-size: 18px;
                font-family: serif;
            }
            .radius{
                border-radius: 10px;
            }
            
        </style>
    </head>
    <body style="background: url(image/window.webp);background-size: cover;background-attachment: fixed;">
      
        <div class="container">
            <div class="row m-5"> 
             <div class="radius col-md-5 m-auto bg-light" > 
                 <h1 class="text-center m-3">Register Here..</h1>
                 <h5 id="msg"></h5>
                 <center>
                  <form action="servlet2" method="POST" class="m-auto  p-2 " >
                  <table>
                     <tr >
                        <td class="p-3">
                            <label>Name: </label>
                        </td>
                        <td class="p-3">
                          <input type="text" name="name" placeholder="Here!Enter Your Name "/>
                        </td>
                     </tr>
              
                    <tr >
                        <td class="p-3">
                            <label>Password:</label>
                        </td>
                        <td class="p-3">
                         <input type="password" name="password" placeholder="Here!Enter Your Password "/>
                        </td>
                    
                    </tr>
                    <tr >
                        <td class="p-3">
                            <label> Email:</label>
                        </td>
                        <td class="p-3">
                          <input type="email" name="email" placeholder="Here!Enter Your ..@gmail.com "/>
                        </td>
                    
                    </tr>
                    <tr>
                        <td class="p-2">
                            
                        </td>
                        <td class="p-2">
                          <button class="btn bg-danger border-0 m-2 text-white" type="reset"  name="reset">  Reset</button> 
                          <button value="submit" class="btn bg-primary border-0 m-2 text-white " type="submit"  name="submit">Send </button>  
                        </td>
                    </tr>
                  </table>
                    
            </form>
            </center>
           </div>
          </div>
        </div>
        
        
        
            
            
        
    </body>
</html>
