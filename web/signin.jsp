<%-- 
    Document   : signin
    Created on : Jun 7, 2022, 6:27:42 AM
    Author     : IT(ERA)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background: url(image/window.webp);background-size: cover;background-attachment: fixed;">
      <!--- container -->
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3 ">
                    <div class="card">
                        <div class="card-content">
                            <h2 class="mb-5 center-align">Register Here!!</h2>
                            <h5 id="msg"></h5>
                            <!--creatting form-->
                            <div class="form ">
                                <form action="" method="POST" id="myform">
                                    <input type="text" name="name" placeholder="Enter Your Name"/>
                                    <input type="password" name="password" placeholder="Enter Your Password"/>
                                    <input type="email" name="email" placeholder="Enter Your ..@gmail.com"/>
                                    <button type="submit" class="btn light-blue accent-3">Signin</button>
                                    
                                </form>
                               
                            </div>
                            <!--end form-->
                            <!--creating loading--> 
                            <div class="loader center-align " style="display:none;margin-top: 10px;">
                                <div class="preloader-wrapper big active ">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                             <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
 
                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                           <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                           <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                 
                                <h5>Please Wait ...</h5>
                                
                            </div>
                            <!--end loading-->
                        </div>
                    </div>
                </div>
            </div>
          
        </div>
      <!-- //container -->
      
      <!--JQuery cnd-->
      <script
         src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
         integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
         crossorigin="anonymous"></script>
         
         
      <!--end Jquery--> 
      
      
      <!--ajxa script-->
      <script>
            
     $(document).ready(function(){
                console.log("page is ready ...")
                
                $("#myform").on('submit',function(event){
                    
                    event.preventDefault();
                    var f=$(this).serialize();
                    console.log(f);
                    $(".loader").show();
                    $(".form").hide();
                    
                    jQuery.ajax({
                        url:"servlet2",
                        data:f,
                        type:"POST",
                        success:function(data,textStatus,jqXHR){
                            
                            console.log(data);
                            console.log("Success ...")
                            $(".loader").hide();
                            $(".form").show();
                            if(data.trim()=== 'done'){
                                $("#msg").html("Successfully Register");
                            }
                            else{
                                $("#msg").html("Something went worng  on server");
                            }
                            
                        },
                        error:function(jqXHR,textStatus,errorThrown){
                            console.log(data);
                            console.log("Error ...")
                            $(".loader").hide();
                            $(".form").show();
                            
                        }
                    })
                })
                
                
            })
            
      </script>
        
    </body>
</html>
