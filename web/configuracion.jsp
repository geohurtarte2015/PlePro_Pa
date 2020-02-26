
<!DOCTYPE html>

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
                    break;
                case 3:
                        display1 = "display:none"; 
                        display5 = "display:none"; 
                        display6 = "display:none";
                        response.sendRedirect("principal.jsp");
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
                        break;  
            }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>PLE CLARO </title>
    


        <!-- DatePick -->
    <link href="plantilla/bootdate/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

     <!-- Bootstrap -->
    <link href="plantilla/new/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    
    
    <!-- Font Awesome -->
    <link href="plantilla/new/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="plantilla/new/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="plantilla/new/vendors/iCheck/skins/flat/green.css" rel="stylesheet">    
    
    <!-- bootstrap-wysiwyg -->
    <link href="plantilla/new/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
	
    <!-- Select2 -->
    <link href="plantilla/new/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="plantilla/new/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="plantilla/new/vendors/starrr/dist/starrr.css" rel="stylesheet">


    
    <!-- Datatables -->
    <link href="plantilla/new/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/new/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/new/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/new/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="plantilla/new/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="plantilla/new/build/css/custom.min.css" rel="stylesheet">

  </head>

  <body class="nav-md"> 
         
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="principal.jsp" class="site_title"> <span>CLARO</span></a>
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

            <!-- /menu footer buttons -->
     
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
         <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle" >
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
          <div class="">
    
            <div class="clearfix"></div>
            
       
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-bars"></i> Configuración </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
            
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                        


                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                      <ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Catalogos</a>
                        </li>
                        <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Paquetes</a>
                        </li>
                        <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Servicios</a>
                        </li>
                        <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Catalogos Generales</a>
                        </li>
                      </ul>
                      <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <br>               
                            <%-- page cuenta --%>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Cuentas <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearbtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLECUENTA" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="70%">
                                                                 <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>STATE</th>
                                                                        <th>DATE</th>
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>STATE</th>
                                                                        <th>DATE</th>
                                                                        <th></th>
                                                                        <th></th>
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

                            <!-- page lista -->
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Listas de Perfiles <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearlistabtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLELISTA" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="datatable_info" width="70%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>                                                                    
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>                                                                  
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </tfoot>

                                                            </table>


                                                        </div>
                                                    </div>
                                                </div>  


                                                <div class="form-group">

                                                </div>
                                                <div class="ln_solid"></div>

                                        </div>

                                        </form>
                                    </div>
                                </div>


                            </div>
                            <!-- end page lista -->

                            <!-- page perfil -->
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Perfil <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                            
                                        <div class="x_content">
                                            <div class="container">
                                                <div class="panel-group">
                                                    <div class="panel panel-info">
                                                        <div class="panel-heading">Carga masiva de perfiles</div>
                                                        <form  method="post" role="form" action="UploadProfile" enctype="multipart/form-data" id="fileUploadFormListProfile">
                                                            <div class="panel-body">
                                                                <div class="row">                                
                                                                 
                                                                        <div class="col-sm-6">               
                                                                        <input type="file" class="form-control-file" name="fileListProfile" id="fileListProfile">
                                                                        </div>
                                                                        <div class="col-sm-4">  
                                                                        <button type="button" class="btn btn-danger" data-loading-text="Loading ..."  id="btnSubmitListProfile"> Cargar </button>
                                                                        </div>
                                                                        <div class="col-sm-4">
                                                                          Descarga de formato CSV:
                                                                        <a href="option/profile.csv" download="profile.csv">
                                                                            <img src="img/excel.png" alt="W3Schools" width="80" height="80">
                                                                        </a>
                                                                        </div>    
                                                                        <!-- <input type="submit" value="Submit" value="uploadList" id="btnSubmitList">  -->
                                                                                           
                                                                </div>  
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                         
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearperfilbtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>  
                                                
                                               
  
                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLEPERFIL" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="datatable_info" width="70%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>ID LIST</th>
                                                                        <th>DESCRIPTION LIST</th>
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>ID LIST</th>
                                                                        <th>DESCRIPTION LIST</th>
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </tfoot>  
                                                            </table>


                                                        </div>
                                                    </div>
                                                </div>  


                                                <div class="form-group">

                                                </div>
                                                <div class="ln_solid"></div>

                                            </form>
                                        </div>
                                    </div>


                                </div>

                            </div>
                            <!-- end page perfil -->
                            
                            <%-- page canal--%>
                           <%--   <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Canales <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearcanalbtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLECANAL" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">

                                                            </table>


                                                        </div>


                                                    </div>
                                                    <div class="ln_solid"></div>
                                                </div>
                                        </div>       
                                        </form>
                                    </div>
                                </div>

                             

                            </div> --%>
                            <%-- end page canal--%>
                        
                        
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                           <br>       
                          <%-- page estado paquete --%>
                          <%--  <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Estado del Paquete <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearestdopaquetebtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLEESTADOPAQUETE" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">

                                                            </table>


                                                        </div>


                                                    </div>
                                                    <div class="ln_solid"></div>
                                                </div>
                                        </div>       
                                        </form>
                                    </div>
                                </div>

                             

                            </div> --%>
                            
                           <%-- page paquete--%>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Paquetes <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearpaquetebtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLEPAQUETE" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>TECNOMEN</th>
                                                                        <th>ACCOUNT</th>
                                                                        <th>POLICY</th>
                                                                        <th>EXP.HOURS</th>
                                                                        <th>UNITS</th>
                                                                        <th>EXP.DAYS</th>
                                                                        <th></th>
                                                                        <th></th>
                                                         
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>TECNOMEN</th>
                                                                        <th>ACCOUNT</th>
                                                                        <th>POLICY</th>
                                                                        <th>EXP.HOURS</th>
                                                                        <th>UNITS</th>
                                                                        <th>EXP.DAYS</th>
                                                                        <th></th>
                                                                        <th></th>
                                                       
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
                                                                                                              
                        </div>
                            
                            
                        <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                           <br>       
                           

                             <%-- page crear servicio--%>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Servicios <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <div class="col-sm-12">               
                                                        <button type="button" id="crearserviciobtn" class="btn btn-success">Crear</button>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLESERVICIO" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">
                                                                
                                                                 <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>STATE</th>
                                                                        <th>INIT_DATE</th>
                                                                        <th>FINISH_DATE</th>
                                                                        <th>ID LIST</th>
                                                                        <th>LIST</th>
                                                                        <th></th>    
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>STATE</th>
                                                                        <th>INIT_DATE</th>
                                                                        <th>FINISH_DATE</th>
                                                                        <th>ID LIST</th>
                                                                        <th>LIST</th>
                                                                        <th></th>
                                                                        <th></th>  
                                                                        <th></th>
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
                            
                      
                            
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                          <br>    
                             <%-- page PRODUCTOS--%>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Listado de productos <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                          

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLEPRODUCTO" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">
                                                                
                                                                 <thead>
                                                                    <tr>
                                                                        <th>SERVICE_ID</th>
                                                                        <th>DESCRIPTION_SERVICE</th>
                                                                        <th>ID_PACK</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>ID_TECNOMEN</th>
                                                                        <th>ACCOUNT_TYPE</th>
                                                                        <th>RECHARGE_POLICY</th>
                                                                        <th>EXPIRY_TIME</th>
                                                                        <th>UNITS</th>
                                                                        <th>EXPIRY_DAY</th>
                                                                        <th>VALUE</th>
                                                                        <th>OTT_CREDIT</th>
                                                                        <th>OTT_DEBIT</th>
                                                                        <th>TEXT_SOURCE</th>
                                                                        <th>TEXT_KEYWORD</th>
                                                                        <th>ID_PROFILELIST</th>
                                                                        <th>INI_DATE</th>
                                                                        <th>END_DATE</th>
                                                                        <th>AUTO_RENEWAL</th>
                                                                        <th>DESCRIPTION_PKG</th>
                                                                        <th>CHANNEL</th>
                                                                        <th>DESCRIPTION_CHANNEL</th>
                                                                        <th>DESCRIPTION_ACT_COMERCIAL</th>
                                                                        <th>PRODUCT_SERVICE_ID</th>                                                                    
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>SERVICE_ID</th>
                                                                        <th>DESCRIPTION_SERVICE</th>
                                                                        <th>ID_PACK</th>
                                                                        <th>DESCRIPTION</th>
                                                                        <th>ID_TECNOMEN</th>
                                                                        <th>ACCOUNT_TYPE</th>
                                                                        <th>RECHARGE_POLICY</th>
                                                                        <th>EXPIRY_TIME</th>
                                                                        <th>UNITS</th>
                                                                        <th>EXPIRY_DAY</th>
                                                                        <th>VALUE</th>
                                                                        <th>OTT_CREDIT</th>
                                                                        <th>OTT_DEBIT</th>
                                                                        <th>TEXT_SOURCE</th>
                                                                        <th>TEXT_KEYWORD</th>
                                                                        <th>ID_PROFILELIST</th>
                                                                        <th>INI_DATE</th>
                                                                        <th>END_DATE</th>
                                                                        <th>AUTO_RENEWAL</th>
                                                                        <th>DESCRIPTION_PKG</th>
                                                                        <th>CHANNEL</th>
                                                                        <th>DESCRIPTION_CHANNEL</th>
                                                                        <th>DESCRIPTION_ACT_COMERCIAL</th>
                                                                        <th>PRODUCT_SERVICE_ID</th>    
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
                            
                            <%-- page NOTIFICACIONES--%>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Notificaciones por producto <small></small></h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                                </li>                   

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                          

                                                <div class="col-lg-12">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">

                                                            <table id="TABLEPRODUCTOSMS" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">
                                                                
                                                                 <thead>
                                                                    <tr>
                                                                        <th>SERVICE_ID</th>
                                                                        <th>DESCRIPTION_SERVICE</th>
                                                                        <th>ID_PACK</th>
                                                                        <th>DESCRIPTION_PACK</th>
                                                                        <th>ID</th>
                                                                        <th>TYPE_SMS</th>
                                                                        <th>TEXT_SMS</th>                                               
                                                                    </tr>
                                                                </thead>

                                                                <tfoot>
                                                                    <tr>
                                                                        <th>SERVICE_ID</th>
                                                                        <th>DESCRIPTION_SERVICE</th>
                                                                        <th>ID_PACK</th>
                                                                        <th>DESCRIPTION_PACK</th>
                                                                        <th>ID</th>
                                                                        <th>TYPE_SMS</th>
                                                                        <th>TEXT_SMS</th>  
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
                      
                            
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
            
             </div>   
           <!-- modals -->  
           <div id="cuentamd">

           </div>

       
        
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
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
    <script src="plantilla/new/build/js/custom.min.js"></script>    
    
        <!-- Alert Bootbox -->
    <script src="plantilla/bootbox/bootbox.min.js"></script> 

    
        
        
       <!-- Functions Scripts -->  
    <script type="text/javascript" src="FunctionsJs/jsModals.js"></script>   

       
    
    
    
  </body>
</html>



