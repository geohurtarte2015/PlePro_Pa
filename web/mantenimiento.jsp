

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
    
    <!-- Bootstrap CSS-->
    <link href="plantilla/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Jquery -->
     <script src="plantilla/js/jquery-1.9.1.min.js"></script>
   
    
       <!-- DatePick -->
    <link href="plantilla/bootdate/build/css/bootstrap-datetimepicker.css" rel="stylesheet">    
     
    <!-- Boostrap Js -->
    <script src="plantilla/js/bootstrap.min.js"></script> 
    
    <!-- Font Awesome -->
    <link href="plantilla/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="plantilla/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="plantilla/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    
    <!-- Alert Bootbox -->
    <script src="plantilla/bootbox/bootbox.min.js"></script> 
    
   
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
             
                        display2 = "display:none";
                        display3 = "display:none";
                        display4 = "display:none";
                        display5 = "display:none";
                        display6 = "display:none";
                        response.sendRedirect("principal.jsp");
                    break;
                case 3:
                        display1 = "display:none"; 
                        display5 = "display:none"; 
                        display6 = "display:none";
                  
                    break;      
                 case 4:
                        display5 = "display:none";    
                        break; 
                 case 5:
                        display1 = "display:none"; 
                        display2 = "display:none";
                        display3 = "display:none";
                        display4 = "display:none";
                        display6 = "display:none";
                        response.sendRedirect("principal.jsp");
                        break; 
                  case 6:
                        display1 = "display:none"; 
                        display2 = "display:none";
                        display3 = "display:none";
                        display4 = "display:none";
                        display5 = "display:none";
                        response.sendRedirect("principal.jsp");
                        break; 
                    case 7:                       
                      
                        display2 = "display:none";
                        display3 = "display:none";
                        display4 = "display:none";
                        display5 = "display:none";
                        response.sendRedirect("principal.jsp");
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
                    <!--   <li><a><i class="fa fa-play-circle"></i>Gestión Claro Video <span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu">
                          <li><a href="#">Consulta perfil de usuario</a></li>     
                          <li><a href="#">Subscripciones activas</a></li>
                           <li><a href="#">Modificación de correo electronico</a></li>   
                          <li><a href="#">Altas de servicios</a></li> 
                          <li><a href="#">Bajas de servicios</a></li>                   
                      </ul>
                    </li>-->
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
                     
                 
           <h2>Mantenimiento clientes POS </h2>         
      

            <br />
            
            <%-- page cuenta --%>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Filtro <small></small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                               
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                         
                                <div class="form-group">
                                    <div class="row"> 
                                 
                                        <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Fecha Inicio</label>
                                                <div class='input-group date' id='fechainicio'>                                            
                                                    <input type='text' id="fechainiciotxt" class="form-control" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Fecha Final</label>
                                                <div class='input-group date'  id='fechafinal'>                                            
                                                    <input id="fechafinaltxt" type='text' class="form-control" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                          </div>
                                    <br>
                                    <div class="row">                   
                                        <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Focalización/Marcación</label>
                                                <select name="focus" id="focus" class="form-control" required="">
                                                     <option value="0">Seleccionar</option>
                                                    <option value="1">2|POS ORIENTE NORMAL|400</option>
                                                    <option value="2">3|POS CADENAS ORIENTE|400</option>        
                                                     <option value="3">5|POS CADENAS ILIMITADO|500</option>     
                                                      <option value="4">6|POS CADENAS DESARROLLO|500</option>     
                                                </select>
                                            </div>
                                        </div>
                              
                                         <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Estado</label>
                                                <select name="status" id="status" class="form-control" required="">
                                                    <option value="0">Seleccionar</option>
                                                    <option> A</option>
                                                    <option> I</option>                                          
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                  

                                        <br>
                                        <br>
                                        <div class="form-group">
                                            <div class="x_content">
                                                <button type="button" id = "btnSubmit"  class="btn btn-primary">Buscar</button>
                                                <button type="button" id = "btnClear"  class="btn btn-primary">Limpiar</button>
                                            </div>
                                        </div>
                                  
                           
                                </div>

                                <div class="col-lg-12">
                                    <div class="panel-body">
                                        <div class="table-responsive">

                                            <table id="TABLEUPDATE" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">  
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>MSISDN</th>
                                                        <th>FOCALIZADO</th>
                                                        <th>STATUS</th>
                                                        <th>DATE_REGISTERED</th>
                                                        <th>BEGIN_DATE</th>    
                                                        <th>END_DATE</th>          
                                                        <th>MARCACION</th>   
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                      <tr>
                                                        <th>ID</th>
                                                        <th>MSISDN</th>
                                                        <th>FOCALIZADO</th>
                                                        <th>STATUS</th>
                                                        <th>DATE_REGISTERED</th>
                                                        <th>BEGIN_DATE</th>    
                                                        <th>END_DATE</th>          
                                                        <th>MARCACION</th>   
                                                    </tr>
                                                </tfoot>
                                            </table>


                                        </div>


                                    </div>
                                    <div class="ln_solid"></div>
                                </div>
                        </div>       
                        </form>
                    </div>
                </div>



            </div>
            
             <%-- page cuenta --%>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Cambio por selección <small></small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                               
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                         
                                <div class="form-group">
                                    
                                    <div class="row"> 
                                 
                                        <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Cambio de Fecha Final</label>
                                                <div class='input-group date'  id='fechafinalUpdate'>                                            
                                                    <input id="fechafinalUpdatetxt" type='text' class="form-control" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                          </div>
                               
                                    <br>
                                    <div class="row">                   
                                        <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Cambio de Focalización/Marcación</label>
                                                <select name="focusUpdate" id="focusUpdate" class="form-control" required="">
                                                     <option value="0">Seleccionar</option>
                                                    <option value="1">2|POS ORIENTE NORMAL|400</option>
                                                    <option value="2">3|POS CADENAS ORIENTE|400</option>        
                                                     <option value="3">5|POS CADENAS ILIMITADO|500</option>     
                                                      <option value="4">6|POS CADENAS DESARROLLO|500</option>     
                                                </select>
                                            </div>
                                        </div>
                                         <div class='col-lg-4'>
                                            <div class="form-group">
                                                <label>Cambio de Estado</label>
                                                <select name="statusUpdate" id="statusUpdate" class="form-control" required="">
                                                    <option value="0">Seleccionar</option>
                                                    <option>A</option>
                                                    <option>I</option>                                          
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                  

                                        <br>
                                        <br>
                                        <div class="form-group">
                                            <div class="x_content">
                                                <button type="button" id = "btnUpdate"  class="btn btn-primary">Update</button>
                                                <button type="button" id = "btnClearUpdate"  class="btn btn-primary">Limpiar</button>
                                            </div>
                                        </div>
                                  
                           
                                </div>

                         
                        </div>       
                        </form>
                    </div>
                </div>



            </div>

          



        
        </div>
        

        
      

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Segmented Packages - Desarrollado por <a href="https://www.claro.com.gt">Desarrollo de Productos</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>


    

    <!-- Custom Theme Scripts -->
    <script src="plantilla/build/js/custom.min.js"></script>
    
              
    <!-- bootstrap-daterangepicker -->
    <script src="plantilla/vendors/moment/min/moment.min.js"></script>
    <script src="plantilla/bootdate/src/js/bootstrap-datetimepicker.js"></script>  
    
    <!-- Datatables -->
    <script src="plantilla/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="plantilla/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="plantilla/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="plantilla/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="plantilla/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="plantilla/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="plantilla/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="plantilla/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="plantilla/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="plantilla/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="plantilla/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="plantilla/vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
    <script src="plantilla/vendors/jszip/dist/jszip.min.js"></script>
    <script src="plantilla/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="plantilla/vendors/pdfmake/build/vfs_fonts.js"></script>


    
    
     <script type="text/javascript">
        var id;
        var rol;
        var data = new FormData();
        
        var dateinit="";  
        var datefinish="";
        var focus="";
        var dial="";
        var status="";
        
        
         dateinit=$("#fechainiciotxt").val();
         datefinish=$("#fechafinaltxt").val();
                
         focus = $("#focus").val();
         status = $("#status").val();
         dial = $("#dial").val();

      
        $('#message').hide();
        $(function () {
                       $('#fechainicio').datetimepicker({
                           format: "DD-MM-YYYY hh:mm:ss a"                      
                           });
                       });

        $(function () {
                       $('#fechafinal').datetimepicker({
                           format: "DD-MM-YYYY hh:mm:ss a"                      
                           });
                       });
        
         $(function () {
                       $('#fechafinalUpdate').datetimepicker({
                           format: "DD-MM-YYYY hh:mm:ss a"                      
                           });
                       });
        
        
        
        

        
        $(document).ready(function(){     
            
            var tableFilter= $('#TABLEUPDATE').DataTable( {
            "ajax" : {
            "url": "FilterResult",
            "type": "POST",
            "data" : function(d){                            
                            d.dateinit=$("#fechainiciotxt").val();
                            d.datefinish=$("#fechafinaltxt").val();                
                            d.focus = $("#focus").val();
                            d.status = $("#status").val();
                            d.dial = $("#dial option:selected").text();    
                            d.dialOption = $("#dial").val();
                            }              
             },           
            "global" : false,
            "lengthMenu": [[ 4, -1], [ 4,20,"All"]],
            "dataType" : "json",
            "dom" : "Bfrtip",
            "buttons" : [
                  'csv', 'excel'
                       ],
            "columns" : [           
                    {"title": "ID"},
                    {"title": "MSISDN"},
                    {"title": "FOCALIZADO"},
                    {"title": "STATUS"},
                    {"title": "DATE_REGISTERED"},
                    {"title": "BEGIN_DATE"},
                    {"title": "END_DATE"},         
                    {"title": "MARCACION"}
                                                                            
            ]

        });

            
            
           $("#btnClear").click(function(){
                        tableFilter.clear().draw();
                        $("#fechainiciotxt").val('');
                        $("#fechafinaltxt").val('');
                        $("#status").val(0);  
                        loadFocusList();            
   
            }); 
            
            
            $("#btnClearUpdate").click(function(){                        
                        $("#fechafinalUpdatetxt").val('');      
                        $("#statusUpdate").val(0);     
        
                        loadFocusListUpdate();
            }); 
            
                        
            $("#btnSubmit").click(function(){
                
            $('#TABLEUPDATE tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Filtrar por '+title+'" />' );
            } );  
         
         
                    
        
        tableFilter.clear().draw();
       // $('#message').show();
       //recarga los datos nuevamente en el dataTable por ajax
        tableFilter.ajax.reload();

         tableFilter.columns().every( function () {
            var that = this;
 
                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                        }
                } );
            } );
                
                
          });   
            
            $("#btnUpdate").click(function(){
                
                var data=tableFilter.rows( {search:'applied'} ).data();
                
               // var data=tableFilter.rows().data();
                var dataJson="";
                var num = data.length;
                
                for (i=0;i<num;i++){
                dataJson += JSON.stringify(data[i]);
                }
               
               
              
                var datefinishUpdate= $("#fechafinalUpdatetxt").val();                
                var focusUpdate = $("#focusUpdate").val();
                var statusUpdate = $("#statusUpdate").val();
                var focusTxtUpdate = $("#focusUpdate option:selected").text(); 
                
                     
                var option = confirm("¿Desea modificar el registro?");
                if (option == true) {
                    $.post("UpdateResult",
                            {
                            
                            datefinish: datefinishUpdate,                                   
                            focus: focusUpdate,
                            focusTxt: focusTxtUpdate,
                            status: statusUpdate,
                            dataJson: dataJson
                           
                    
                            },
                    function (json) {       
                        tableFilter.clear().draw();
                        tableFilter.ajax.reload();
                        alert(json.message);                 
                    });
                } else {
                    alert("Cancelado");
                }
              
           
                
     
          });  
          
            loadFocusList();            
            loadFocusListUpdate();
          
            function loadFocusList(){
                    $("#focus").empty();
                 $.post(
                         "GetOptionListSplit",
                         {
                             tableParameter: "select id,id||'|'||description||'|'||marcacion as description from POS_CATALOG.tb_pos_type_focalizado"

                         },
                 function (json) {
                     $("#focus").append('<option value="0">Seleccionar...</option>');
                     $.each(json, function (key, value) {
                         $.each(value, function (id, description) {
                             $("#focus").append('<option value="' + id + '">' + description + '</option>');
                         });
                     });
                 });
            }
            
            function loadFocusListUpdate(){
                    $("#focusUpdate").empty();
                 $.post(
                         "GetOptionListSplit",
                         {
                             tableParameter: "select id,id||'|'||description||'|'||marcacion as description from POS_CATALOG.tb_pos_type_focalizado"

                         },
                 function (json) {
                     $("#focusUpdate").append('<option value="0">Seleccionar...</option>');
                     $.each(json, function (key, value) {
                         $.each(value, function (id, description) {
                             $("#focusUpdate").append('<option value="' + id + '">' + description + '</option>');
                         });
                     });
                 });
            }
            
            

            

            
     
            
         });
         
         
         
    </script>


  </body>
</html>

