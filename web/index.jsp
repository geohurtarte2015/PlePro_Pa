

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap Core CSS -->
        
            
       	<link rel="stylesheet" href="option/chosen.css">
	<link rel="stylesheet" href="option/ImageSelect.css">

        <script src="option/jquery-1.11.0.min.js"></script>
        <script src="option/chosen.jquery.js"></script>
        <script src="option/ImageSelect.jquery.js"></script>
    

        
        <!-- Bootstrap -->
        <link href="plantilla/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="plantilla/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

     
    

        <script src="plantilla/vendors/bootstrap/dist/js/bootstrap.min.js"></script>



        <!-- Alerts -->
        <script src="plantilla/js/bootbox.min.js"></script>  
    

    
    
    
    
    
    
        <title>PLE CLARO</title>
    </head>
    <body>
    <center><h1 style="color:red">PLE Claro</h1></center>
        <br>
        <br>
        
<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Ingreso del Usuario</h3>
                    </div>
                   
                    <div class="panel-body">
                        <div id="alerts"></div>
                       
                            <fieldset>
                                    <!-- Bootstrap -->
                                <div class="form-group">
                
                                    <select  id='country' name='country' class="my-select" >
                                        <option value='502'  data-img-src="img/flags/gt.png">Guatemala</option>
                                        <option value='503' data-img-src="img/flags/sv.png">El Salvador</option>
                                        <option value='504' data-img-src="img/flags/hn.png">Honduras</option>
                                        <option value='505' data-img-src="img/flags/ni.png">Nicaragua</option>
                                        <option value='506' data-img-src="img/flags/cr.png">Costa Rica</option>
                                        <option value='507' data-img-src="img/flags/pa.png">Panama</option>
                                        
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Usuario" id="name" name="name" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" id="pass" name="pass" type="password" value="">
                                </div>                                
                                <input type="button" id="ingresar" value="Ingresar" class="btn btn-lg btn-success btn-block"/>
                            
                            </fieldset>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
        <script>
        $(".my-select").chosen({width:"50%"});
           
            $(document).ready(function(){
      
                
                $("#ingresar").click(function(){
                   name=$('#name').val();
                   pass=$('#pass').val();
                   country=$("#country").val();
                   
                   
                  $.ajax({
                      type:"post",
                      url: "User",
                      dataType:"text",
                      data: {
                              name: name,
                              pass: pass,
                              country: country
                          },
                      success:
                        function(message){
                             if (message.toString().trim() == "errorusuario") {
                           $('#alerts').html("<div class='alert alert-danger'>"+"Error de usuario"+"</div>");
                            } else {
                            $('#alerts').html("<div class='alert alert-success'>"+"Aceptado"+"</div>");
                            window.location.href = "principal.jsp";
                            }
                        }
                  });
                });
              });
            
        </script>
    </body>
</html>
