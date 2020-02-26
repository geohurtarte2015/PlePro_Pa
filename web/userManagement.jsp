
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Ple</title>
    


    <!-- Bootstrap -->
    <link href="plantilla/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="plantilla/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="plantilla/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="plantilla/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="plantilla/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom Theme Style -->
    <link href="plantilla/build/css/custom.min.css" rel="stylesheet">
    
    <!-- Style Modal -->
     <style>
        .modal-header, h4, .close {
            background-color: #5cb85c;
            color:white !important;
            text-align: center;
            font-size: 30px;
        }
        .modal-footer {
            background-color: #f9f9f9;
        }
    </style>

    
 
    
  </head>

  <body class="nav-md">
      
      
    <% 
        String nombre = (String) session.getAttribute("nombre");    
        String apellido = (String) session.getAttribute("apellido");
        String rol = (String) session.getAttribute("rol");
            
    
            String display1 = "display:block";
            String display2 = "display:block";
            String display3 = "display:block";
            String display4 = "display:block";
            String display5 = "display:block";
            String display6 = "display:block";
            String display7 = "display:block";
            int selectRol = Integer.parseInt(rol);
            
            switch (selectRol){
                case 2:
                    response.sendRedirect("principal.jsp");
     
                    display2 = "display:none";
                    display3 = "display:none";
                    display4 = "display:none";
                    display5 = "display:none";
                    display6 = "display:none";
                    break;
                case 3:
                    response.sendRedirect("principal.jsp");
                    display1 = "display:none";          
                    display5 = "display:none";
                    display6 = "display:none";
                    break;
                case 4:
                    response.sendRedirect("principal.jsp");               
                    display5 = "display:none";     
                    break;
                case 5:
         
                    display1 = "display:none";
                    display2 = "display:none";
                    display3 = "display:none";
                    display4 = "display:none";
                    display6 = "display:none";
                    break; 
                case 6:
                        response.sendRedirect("principal.jsp");
      
                    display1 = "display:none";
                    display2 = "display:none";
                    display3 = "display:none";
                    display4 = "display:none";  
                    display5 = "display:none";   
                    break; 
                 case 7:          
       
                        display2 = "display:none";
                        display3 = "display:none";
                        display4 = "display:none";
                        display5 = "display:none";
                        response.sendRedirect("principal.jsp");
                        break;
            }
            
    %>
         

        
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="principal.jsp" class="site_title"><span>CLARO</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
            
              <div class="profile_info">
                  <span>Bienvenido,<%=" "+nombre%></span>
                <h2></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />
             <br />
              <br />
               <br />
                <br />

            <!-- sidebar menu -->
             <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <!-- <li><a><i class="fa fa-home"></i> Consultas <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                     <li><a href="#">Consulta aprovisionamientos</a></li>
                       <li><a href="#">Consulta aprovisionamientos</a></li>    
                      <li><a href="#">Consulta notificaciones</a></li>    
                       <li><a href="#">Modificaciones</a></li>   
                    </ul>
                  </li>-->
                    <li style="<%=display1%>"><a><i class="fa fa-cogs"></i> Catalogos <span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu">
                          <li><a href="configuracion.jsp">Configuracion</a></li>  
                          <li><a href="aprovisionarpacks.jsp">Aprovisionar</a></li> 
                      </ul>
                  </li>
                  <li style="<%=display6%>"><a><i class="fa fa-home"></i> Consultas <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="aprovisionamiento.jsp">Consulta aprovisionamientos</a></li>  
                      <li><a href="notification.jsp">Consulta notificaciones</a></li>  
                     <!--  <li><a href="modificacion.jsp">Modificaciones</a></li>   -->
                    </ul>
                  </li>
           
                  <li style="<%=display5%>"><a><i class="fa fa-user-plus"></i> Administración <span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu">
                          <li><a href="userManagement.jsp">Usuarios y Perfiles</a></li>                     
                      </ul>
                  </li>
                </ul>
              </div>
            </div>    
            <!-- /sidebar menu -->

         
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Opciones
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">                    
                    <li><a href="EndSesion"><i class="fa fa-sign-out pull-right"></i> Salir</a></li>
                  </ul>
                </li>
         
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
                            
            <h1>Creacion de usuarios</h1>
            
              <div class="modal-footer">
                 
                     <div class="panel-body">
                         
                            <div class="row">   
                                <div class="col-sm-2">
                                    <div class="form-group">
                                            <label>Usuario</label>
                                            <input class="form-control" name="Usuario" id="Usuario" placeholder="Usuario">
                                    </div>
                                </div>       
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label>Pais</label>
                                                    <select name="Pais" id="Pais" class="form-control" required="">
                                                    <option value='502'>Guatemala</option>
                                                    <option value='503'>El Salvador</option>
                                                    <option value='504'>Honduras</option>
                                                    <option value='505'>Nicaragua</option>
                                                    <option value='506'>Costa Rica</option>
                                                    <option value='507'>Panama</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row"> 
                                  <div class="col-sm-2">
                                         <button type="button" name="validar" id="validar" class="btn btn-primary"/>Validar</button>                                
                                </div>
                                
                            </div>
                            
                            <div class="row">                            
                                <div class="col-sm-4">
                                    <div class="form-group">
                                            <label>Nombre</label>
                                            <input class="form-control" name="Nombre" id="Nombre" placeholder="Nombre" disabled>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                            <label>Apellido</label>
                                            <input class="form-control" name="Apellido" id="Apellido" placeholder="Apellido" disabled>
                                    </div>
                                </div>
                                
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Rol</label>
                                        <select name="Rol" id="Rol" class="form-control" required="">
                                           
                                        </select>
                                    </div>
                                </div>
                       
                         
                            </div><!-- /.Nombre Apellido -->  
                            
        
                            <br>
                         
                            <div class="col-sm-4">
                                <button type="button" name="ingresar" id="ingresar" class="btn btn-lg btn-success btn-block" disabled/>Guardar</button>  
                            </div>
                            
                            <div class="col-sm-4">
                                <button type="button" name="limpiar" id="limpiar" class="btn btn-lg btn-success btn-block">Limpiar</button>
                            </div>

                
                            </div>
       
                  <br />

                  <table id="TBUSER" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">  
                                          
                          <thead>
                                 <tr>
                                  <th>ID</th>
                                  <th>NOMBRE</th>
                                  <th>APELLIDO</th>                                
                                  <th>FECHA</th>
                                  <th>USUARIO</th>
                                  <th>ROL</th>
                                  <th>DESCRIPTION</th>
                                 </tr>
                          </thead>
                    </table>
          
                  
                  
              </div>
       
     
          <br />
          

        
        </div>
        
        
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    

      
    </div>
  </div> 
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Transaction Claro Video - Developer by <a href="https://www.claro.com.gt">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

     <!-- jQuery -->
    <script src="plantilla/new/vendors/jquery/dist/jquery.min.js"></script>
    
    <!-- Bootstrap -->
    <script src="plantilla/new/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    
    <!-- bootstrap-daterangepicker -->
    <script src="plantilla/vendors/moment/min/moment.min.js"></script>
    <script src="plantilla/bootdate/src/js/bootstrap-datetimepicker.js"></script>  
    
    
    <!-- FastClick -->
    <script src="plantilla/new/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="plantilla/new/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="plantilla/new/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="plantilla/new/vendors/iCheck/icheck.min.js"></script>
    
    <!-- bootstrap-wysiwyg -->
    <script src="plantilla/new/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="plantilla/new/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="plantilla/new/vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="plantilla/new/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="plantilla/new/vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="plantilla/new/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="plantilla/new/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="plantilla/new/vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="plantilla/new/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="plantilla/new/vendors/starrr/dist/starrr.js"></script>
    <!-- Datatables -->
    <script src="plantilla/new/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="plantilla/new/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="plantilla/new/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="plantilla/new/vendors/jszip/dist/jszip.min.js"></script>
    <script src="plantilla/new/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="plantilla/new/vendors/pdfmake/build/vfs_fonts.js"></script>
    

    <!-- Custom Theme Scripts -->
    <script src="plantilla/build/js/custom.min.js"></script>
  

    
     <script type="text/javascript">
        var id;
        var rol;
        
        $(document).ready(function(){
            
         //   $("#userManagementDiv").hide();
           //document.getElementById("userManagementDiv").style.display = "none";
          

            
            $("#validar").click(function(){   
                    var usuario = $("#Usuario").val();    
                    var pais = $("#Pais").val();
                      $.post("SelectData",
                            {
                                tableParameter: "select usuario from tb_user_ple where usuario='"+usuario+"'"+" and country="+pais

                            },
                    function (json) {    
                                                                            
                            if(json.Data0==usuario){
                                alert('Usuario ya existente en sistema PLE');

                        }else{         
                           
                                $.post("SelectData",
                                        {
                                            tableParameter: "select FIRST_NAME, LAST_NAME, RESPONSE, GPP_LDAP_PAIS, CODIGO_IBM, DISPLAY_NAME, MAIL from table(gu_ldap_search("+pais+",'"+usuario+"'))"

                                        },
                                        function (json) {
                                            if(json.Data2=="Successful Registration"){
                                                
                                                $("#ingresar").attr("disabled",false);                                              
                                                
                                                $("#Usuario").prop("disabled",true);
                                                
                                                $("#Nombre").val(json.Data0);
                                                $("#Apellido").val(json.Data1);     

                                                }else{
                                                     alert(json.Data2);
                                                }                                                
                                    }); 
                        }
                        
                        
                         
                    }); 
                    
                  
              }); 
            
            $("#limpiar").click(function(){
                  
                  clear();
                        
                        
            }); 
            
            function clear(){
                      $("#Nombre").val('');
                        $("#Apellido").val('');
                        $("#Usuario").val('');
                        $("#Password").val('');
                        $("#Usuario").prop("disabled",false);                  
                        document.getElementById("Rol").selectedIndex="0";                
            }
            
             $("#ingresar").click(function(){
                     
               var pais = $("#Pais").val();        
               var nombre = $("#Nombre").val();
               var apellido = $("#Apellido").val();
               var usuario = $("#Usuario").val();
               var password = $("#Password").val();
               var rolNew = $("#Rol").val();
               var auditory="Crea Usuario";

               var tableParameter = "insert into tb_user_ple(id,nombre,apellido,fecha_creacion,usuario,rol,country) values (sm_program.seq_user_ple.nextval,'"+nombre+"','"+apellido+"',sysdate,'"+usuario+"',"+rolNew+","+pais+")";


               $.post(
                        "TableSave",
                        {
                            tableParameter: tableParameter,
                            auditory: auditory

                        },
                function (json) {
                    tableUsers.clear().draw();
                    tableUsers.ajax.reload();   
                    clear();
                    alert(json.message);
            
        });

            }); 
            
            $("#modificar").click(function(){
                $("#idRolHidden").val($("#RolUpdate").prop('selectedIndex')); 
            });
            
            $("#Rol").empty();
            $.post(
                 "GetOptionList",
                 {
                     tableParameter: "select * from tb_rol_ple"

                 },
             function (json) {
             $("#Rol").append('<option value="-1">Seleccionar...</option>');
             $.each(json, function (key, value) {
                 $.each(value, function (id, description) {
                     $("#Rol").append('<option value="' + id + '">' + description + '</option>');
                 });
             });
         });

            
         
         
         var tableUsers = $('#TBUSER').DataTable({
                    "ajax": {
                        "url": "TableList",
                        "type": "POST",    
                         "data": function (d) {
                            d.id = 0;
                            d.tableParameter = "select a.id,a.nombre,a.apellido,a.fecha_creacion,a.usuario,b.id as rol,b.description from tb_user_ple a inner join tb_rol_ple b on a.rol=b.id";
                        }
                    },
                    "global": false,
                    "lengthMenu": [[4, 5, 6, -1], [4, 5, 6, "All"]],
                    "dataType": "json",
                    "createdRow": function (row, data, dataIndex) {
                        if (data[2] == "1") {
                            $(row).addClass('important');
                        }
                    },
                    "columns": [
                        {"title": "ID"},
                        {"title": "NOMBRE"},
                        {"title": "APELLIDO"},          
                        {"title": "FECHA"},
                        {"title": "USUARIO"},
                        {"title": "ROL"},
                        {"title": "DESCRIPTION"}
                    ]
            });
             
             
         
         });
         
    </script>


  </body>
</html>

