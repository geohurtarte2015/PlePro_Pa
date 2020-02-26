
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
     <style id="compiled-css" type="text/css">
    
        table.display tbody tr:nth-child(even):hover td{
            background-color: #ffc2c2;
        }

        table.display tbody tr:nth-child(odd):hover td {
            background-color: #ffc2c2;
        }


  </style>


 <%---- Cuenta ---%>
<div style="display: none;" class="modal fade" id="cuenta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Creación de cuentas</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    <input hidden="true" type="text" name="idAccountHidden" id="idAccountHidden">  
                    
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionAccount" id="DescriptionAccount" placeholder="Descripcion">
                    </div>  

                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-ok"></span><label>Status</label>
                            <select id="status" class="form-control">
                                <option value="-1">Seleccionar..</option>
                                <option value="1">Activo</option>
                                <option value="0">Inactivo</option>
                            </select>
                    </div>
                    <br>
                    <button type="button" name="guardarcuentabtn" id="guardarcuentabtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <button type="button" name="modificarcuentabtn" id="modificarcuentabtn" class="btn btn-primary btn-block" disabled><span class="glyphicon glyphicon-off"></span> Modificar</button>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelAccount" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                </div>
        
        </div>

    </div>   
</div>

 <%---- Listas ---%>
<div style="display: none;" class="modal fade" id="listamodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Creación de listas</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    <input hidden="true" type="text" name="idAccountHiddenLista" id="idAccountHiddenLista">  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Id</label>
                        <input type="text" class="form-control" name="IdList" id="IdList" placeholder="Id">
                    </div>  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionList" id="DescriptionList" placeholder="Descripcion">
                    </div>  

                    <br>
                    <button type="button" name="guardarlistabtn" id="guardarlistabtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <button type="button" name="modificarlistabtn" id="modificarlistabtn" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Modificar</button>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelList" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                </div>
        
        </div>

    </div>   
</div>

 <%---- Perfil ---%>
<div style="display: none;" class="modal fade" id="perfilmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Creación de listas</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    <input hidden="true" type="teserviciomodalxt" name="idAccountHiddenPerfil" id="idAccountHiddenPerfil">  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span>Id</label>
                        <input type="text" class="form-control" name="IdProfile" id="IdProfile" placeholder="Id">
                    </div>  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionProfile" id="DescriptionProfile" placeholder="Descripcion">
                    </div>  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-ok"></span><label>Lista</label>
                            <select id="listoption" class="form-control">                                           
                            </select>
                    </div>

                    <br>
                    <button type="button" name="guardarperfilbtn" id="guardarperfilbtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <button type="button" name="modificarperfilbtn" id="modificarperfilbtn" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Modificar</button>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelProfile" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                   
                </div>
        
        </div>

    </div>   
</div>
    
 <%---- Estado Paquete ---%>
<div style="display: none;" class="modal fade" id="estadopaquetemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Estado Paquete</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    <input hidden="true" type="text" name="idAccountHiddenEstadoPaquete" id="idAccountHiddenEstadoPaquete">  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Id</label>
                        <input type="text" class="form-control" name="IdEstadoPaquete" id="IdEstadoPaquete" placeholder="Id">
                    </div>  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionEstadoPaquete" id="DescriptionEstadoPaquete" placeholder="Descripcion">
                    </div>  

                    <br>
                    <button type="button" name="guardarestadopaquetebtn" id="guardarestadopaquetebtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>

                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelStatePack" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                </div>
        
        </div>

    </div>   
</div>

 <%---- Servicio ---%>
<div style="display: none;" class="modal fade" id="serviciomodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header" style="padding:35px 50px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4><span class="glyphicon glyphicon-lock"></span> Creación de Servicios</h4>
            </div>

            <div class="modal-body" style="padding:40px 50px;">
                <form action="TableSave" method="post" id="form_guardarserviciobtn">

                    <input hidden="true" type="text" name="idAccountHiddenServicio" id="idAccountHiddenServicio">  

                    <div class="form-group">
                        <label for="DescriptionService"><span class="glyphicon glyphicon-user"></span></label> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionService" id="DescriptionService" placeholder="Descripcion" required>
                    </div>  
                    <div class="form-group">
                        <label for="stateserviceoption"><span class="glyphicon glyphicon-list-alt"></span></label> Estado</label>
                        <select name="stateserviceoption" id="stateserviceoption" class="custom-select" required>  
                              
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="listserviceoption"><span class="glyphicon glyphicon-list-alt"></span></label> Perfil</label>
                        <select name="listserviceoption" id="listserviceoption" class="custom-select" required>                                           
                     
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="dateinitservicetxt">Fecha Inicio</label>
                        <div class='input-group date' id='dateinitservice'>                                            
                            <input type='text' name="dateinitservicetxt" id="dateinitservicetxt" class="form-control" required/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="datefinalservicetxt">Fecha Final</label>
                        <div class='input-group date'  id='datefinalservice'>                                            
                            <input name="datefinalservicetxt" id="datefinalservicetxt" type='text' class="form-control" required/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>

                    <br>
                    <button type="submit" name="guardarserviciobtn" id="guardarserviciobtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <button type="button" name="modificarserviciobtn" id="modificarserviciobtn" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Modificar</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="cancelService"  class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
            </div>

        </div>

    </div>   
</div>
 
 <%---- Canal ---%>
<div style="display: none;" class="modal fade" id="canalmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Creación de canales</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    <input hidden="true" type="text" name="idSourceHidden" id="idSourceHidden">                      
                  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionSource" id="DescriptionSource" placeholder="Descripcion">
                    </div>  
               
                    <br>
                    <button type="button" name="guardarcanalbtn" id="guardarcanalbtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <button type="button" name="modificarcanalbtn" id="modificarcanalbtn" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Modificar</button>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelChannel"  class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                </div>
        
        </div>

    </div>   
</div>

 <%---- Paquete ---%>
<div style="display: none;" class="modal fade" id="paquetemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Creación de Paquetes</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    <input hidden="true" type="text" name="idPackHiddenPack" id="idPackHiddenPack">  
                    
                    <form action="TableSave" method="post" id="form_guardarpaquetebtn">
                    
                    <div class="form-group">
                        <label for="DescriptionPack"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                        <input type="text" class="form-control" name="DescriptionPack" id="DescriptionPack" placeholder="Descripcion" required>
                    </div>  
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Tecnomen</label>
                        <input type="text" class="form-control" name="TecnomenPack" id="TecnomenPack" placeholder="Tecnomen" required>
                    </div>  
                    <div class="form-group">
                        <label for="OptionPack"><span class="glyphicon glyphicon-list-alt"></span> Cuenta</label>
                            <select id="OptionPack" class="custom-select" required>                                           
                            </select>
                    </div>
                    <div class="form-group">
                        <label for="PolicyPack"><span class="glyphicon glyphicon-user"></span>Politica</label>
                        <input type="text" class="form-control" id="PolicyPack" name="PolicyPack" id="PolicyPack" placeholder="Politica" required>
                    </div>  
                    <div class="form-group">
                        <label for="expiryPackHours"><span class="glyphicon glyphicon-user"></span>Exipración en horas</label>
                        <input type="text" class="form-control" name="expiryPackHours" id="expiryPackHours" placeholder="Expiración en Horas" required>
                    </div>  
                    <div class="form-group">
                        <label for="OptionExpiryDay"><span class="glyphicon glyphicon-list-alt"></span> Exipración en dias</label>                   
                        <select id="OptionExpiryDay" class="custom-select" required> 
                            <option selected disabled value="">Seleccionar..</option>
                            <option value="1">1</option>
                            <option value="0">0</option>
                        </select>
                    </div>  
                    <div class="form-group">
                        <label for="unitsPack"><span class="glyphicon glyphicon-user"></span>Asignación de unidades</label>
                        <input type="text" class="form-control" name="unitsPack" id="unitsPack" placeholder="Unidades de valor" required>
                    </div>  
            
                    <br>
                    <button type="submit" name="guardarpaquetebtn" id="guardarpaquetebtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <button type="button" name="modificarpaquetebtn" id="modificarpaquetebtn" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Modificar</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelPack" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                   
                </div>
        
        </div>

    </div>   
</div>
 
 <%---- PaqueteServicio ---%>
<div  class="modal fade" id="paqueteserviciomodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y: scroll;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Definición del Servicio</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    
                   <form action="TableSavePerService" method="post" id="form_guardarserviciopaquetebtn">
                    
                    <div class="container">        
                        <div class="row">   
                            <div class="col-md-2">
                                <label for="IdServicePackInput"><span class="glyphicon glyphicon-user"></span> Id Servicio</label>
                                <input style="color: #C0C0C0;" type="text" name="IdServicePackInput" id="IdServicePackInput" class="form-control" disabled="disabled" placeholder="Id Servicio" >                                
                            </div>
                            <div class="col-md-4">
                                <label for="DescriptionServicePackInput"><span class="glyphicon glyphicon-user"></span> Nombre del Servicio</label>
                                <input style="color: #C0C0C0;" type="text" name="DescriptionServicePackInput" id="DescriptionServicePackInput" class="form-control" disabled="disabled" placeholder="Nombre del Servicio">                                
                            </div>
                        </div>
                          <div class="ln_solid"></div>
                        <div class="row">   
                            <div class="col-md-4">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Agregar Paquete</label>
                                <button type="button" id="seleccionpaquetebtn" class="btn btn-success">Vincular Paquete</button>                                
                            </div>
                            <div class="col-md-4">
                                <label for="IdPackInput"><span class="glyphicon glyphicon-user"></span> Id Paquete</label>
                                <input type="text" name="IdPackInput" id="IdPackInput" class="form-control" disabled="disabled" placeholder="Id Paquete" required>                                
                            </div>
                            <div class="col-md-4">
                                <label for="DescriptionPackInput"><span class="glyphicon glyphicon-user"></span> Descripcion Paquete</label>
                                <input type="text" name="DescriptionPackInput" id="DescriptionPackInput" class="form-control" disabled="disabled" placeholder="Descripcion Paquete" required>                                
                            </div>

                        </div>
                    </div>
                    
                  <div class="container">
                      <div class="row">
                                                  
                          <div class="col-md-4">
                              
                                  <label>Fecha Inicio</label>
                                  <div class='input-group date' id='dateinitservicepack'>                                            
                                      <input type='text' name="dateinitservicepacktxt" id="dateinitservicepacktxt" class="form-control" required/>
                                      <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-calendar"></span>
                                      </span>
                                  </div>
                             
                          </div>
                          <div class="col-md-4">
                           
                                  <label>Fecha Final</label>
                                  <div class='input-group date'  id='datefinalservicepack'>                                            
                                      <input name="datefinalservicepacktxt" id="datefinalservicepacktxt" type='text' class="form-control" required/>
                                      <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-calendar"></span>
                                      </span>
                                  </div>
                          
                          </div>

                      </div>
                      <span class="section">Asignación de Precios</span>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="PackPrice"><span class="glyphicon glyphicon-user"></span> Precio</label>
                                <input type="text" class="form-control" name="PackPrice" id="PackPrice" placeholder="Precio" required>

                            </div>
                            <div class="col-md-2">
                                <label for="Ottdebit"><span class="glyphicon glyphicon-user"></span> Ott Debito</label>
                                <input type="text" class="form-control" name="Ottdebit" id="Ottdebit" placeholder="Ott Debito" required>

                            </div>
                            <div class="col-md-2">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Ott Credito</label>
                                <input type="text" class="form-control" name="Ottcredit" id="Ottcredit" placeholder="Ott Credito" required>                          
                            </div>
                            <div class="col-md-2">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Account</label>
                                <select  class="form-control" name="Account" id="Account" required>
                                </select>
                            </div> 

                            <div class="col-md-2">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Rate Type</label>
                                <select id="RateTypePack" class="form-control" required>                                           
                                </select>
                            </div> 

                            <div class="col-md-2">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Exchange</label>
                                <input type="text" class="form-control" name="Exchange" id="Exchange" placeholder="Exchange">
                            </div>  

                               
                        </div>
                   
                        <span class="section">Asignación de Canales</span>
                        <div class="row">   
                            <form>
                            <div class="col-md-2">  
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Canal</label>
                                <select id="OptionChannel" class="form-control">                                           
                                </select>
                            </div>
                              <div class="col-md-2">  
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Rate Type</label>
                                <select id="RateTypeChannel" class="form-control">                                           
                                </select>
                            </div>
                            <div class="col-md-2">
                                 <label for="usrname"><span class="glyphicon glyphicon-user"></span>Text Source</label>
                                <input id="ChannelTextSource" type="text" class="form-control" placeholder="Text Source">                                
                            </div>     
                            <div class="col-md-2">
                                 <label for="usrname"><span class="glyphicon glyphicon-user"></span>TextKeyword</label>
                                <input id="ChannelTextKeyword" type="text" class="form-control" placeholder="Text Keyword">                                
                            </div>            
                            <div class="col-md-2">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Descripcion</label>
                                <input id="ChannelTextMessage" type="text" class="form-control" placeholder="Mensaje">                                
                            </div>
                                <div class="col-md-2">
                                    <label for="usrname"><span class="glyphicon glyphicon-ok"></span><label>Recurrencia</label>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" id="idRecurrence" class="flat"> Checked
                                            </label>
                                        </div>
                                </div>
                            <div class="col-md-3">
                                 <label for="usrname"><span class="glyphicon glyphicon-user"></span> Agregar Canal</label>
                                 <button type="button" id="seleccionpaquetecanalbtn" class="btn btn-success">Vincular Canal</button>                                                                
                            </div>
                                
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table id="TABLECANALSERVICIO" class="table table-striped table-bordered table-hover" role="grid" aria-describedby="datatable_info" width="100%">

                                        </table>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                            </div>

                        </div>
                   
                     
                  </div>    
        
                <br>
                    <button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Vincular paquete al servicio</button>
                    <button type="button" name="verserviciopaquetebtn" id="verserviciopaquetebtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Ver vinculaciones</button>
                </form>   
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelServicePack" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                </div>
        
        </div>

    </div>   
</div>


 <!-- modals -->  
 <%---- Seleccion Table Paquete para Servicio ---%>
 <div  class="modal fade" id="servicepack" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y: scroll;" >
     <div class="modal-dialog modal-lg">
         <div class="modal-content">

             <div class="modal-header" style="padding:35px 50px;">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4><span class="glyphicon glyphicon-lock"></span> Seleccionar Paquete</h4>
             </div>

             <div class="modal-body" style="padding:40px 50px;">


                 <div class="col-lg-12">
                     <div class="panel panel-default">
                         <div class="panel-body">                           
                             <div class="table-responsive">
                                 <table id="TABLEPACKSERV" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">

                                     <tr>
                                         <th>ID</th>
                                         <th>DESCRIPTION</th>
                                         <th>TECNOMEN</th>
                                         <th>ACCOUNT</th>
                                         <th>POLICY</th>
                                         <th>HOURS</th>
                                         <th>UNITS</th>
                                         <th>DAYS</th>
                                     </tr>
                                     </thead>

                                     <tfoot>
                                         <tr>
                                             <th>ID</th>
                                             <th>DESCRIPTION</th>
                                             <th>TECNOMEN</th>
                                             <th>ACCOUNT</th>
                                             <th>POLICY</th>
                                             <th>HOURS</th>
                                             <th>UNITS</th>
                                             <th>DAYS</th>
                                         </tr>
                                     </tfoot>
                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>

             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
             </div>

         </div>

     </div>   
 </div>

  
 <!-- modals -->  
 <%---- Seleccion Table Vinculaciones ---%>
 <div style="overflow-y: scroll;" class="modal fade" id="servicepackprice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">

             <div class="modal-header" style="padding:35px 50px;">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4><span class="glyphicon glyphicon-lock"></span> PAQUETES VINCULADOS</h4>
             </div>

             <div class="modal-body" style="padding:40px 50px;">
                <div class="col-lg-12">
                     <div class="panel panel-default">
                         <div class="panel-body">    
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span>PRECIOS</label>
                             <div class="table-responsive">
                                 <table id="TABLEVINCULACIONPACKS" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">

                                     <tr>
                                         <th>ID_PACK</th>
                                         <th>DESCRIPTION</th>
                                         <th>ID_TECNOMEN</th>
                                         <th>OTT_CREDIT</th>
                                         <th>OTT_DEBIT</th>
                                         <th>VALUE</th>
                                         <th>INIT_PRICE</th>
                                         <th>END_DATE</th>
                                     </tr>
                                     </thead>

                                     <tfoot>
                                          <tr>
                                         <th>ID_PACK</th>
                                         <th>DESCRIPTION</th>
                                         <th>ID_TECNOMEN</th>
                                         <th>OTT_CREDIT</th>
                                         <th>OTT_DEBIT</th>
                                         <th>VALUE</th>
                                         <th>INIT_PRICE</th>
                                         <th>END_DATE</th>
                                     </tr>
                                     </tfoot>
                                 </table>
                             </div>
                             <br>
                               <button type="button" name="aditionalpackpricebtn" id="aditionalpackpricebtn" class="btn btn-primary btn-default pull-left"><span class="glyphicon glyphicon-off"></span> Adicionar Precio</button>
                         </div>

                     </div>
                 </div>
                 
                <div class="col-lg-12">
                     <div class="panel panel-default">
                         <div class="panel-body">   
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span>PAQUETES DEL SERVICIO</label>
                             <div class="table-responsive">
                                 <table id="TABLEVINCULACIONPACKSPERSERVICE" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">

                                     <tr>
                                         <th>ID</th>
                                         <th>ID_PACK</th>
                                         <th>DESCRIPTION</th>                              
                                         <th>RENEWAL</th>
                                         <th>PACK_INIT</th>
                                         <th>PACK_END</th>
                                     </tr>
                                     </thead>

                                     <tfoot>
                                          <tr>
                                         <th>ID_PACK</th>
                                         <th>DESCRIPTION</th>                                   
                                         <th>AUTO_RENEWAL</th>
                                         <th>PACK_INIT</th>
                                         <th>PACK_END</th>
                                     </tr>
                                     </tfoot>
                                 </table>
                             </div>
                             <br>
                               <button type="button" name="aditionalpackbtn" id="aditionalpackbtn" class="btn btn-primary btn-default pull-left"><span class="glyphicon glyphicon-off"></span> Adicionar Paquete</button>
                         </div>                         
                     </div>
                 </div>
                 


             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
             </div>

         </div>

     </div>   
 </div>
 
 
 
   <!-- modals -->  
 <%---- Seleccion Table PackNotificaciones ---%>
 <div  class="modal fade" id="NOTIFICACIONPACKMODAL" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y: scroll;">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">

             <div class="modal-header" style="padding:35px 50px;">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4><span class="glyphicon glyphicon-lock"></span> PAQUETES VINCULADOS</h4>
             </div>

             <div class="modal-body" style="padding:40px 50px;">
        
                <div class="col-lg-12">
                     <div class="panel panel-default">
                         <div class="panel-body">   
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span>PAQUETES NOTIFICACION</label>
                             <div class="table-responsive">
                                 <table id="TABLEVINCULACIONSMS" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">

                                 

                             
                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>
                 


             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
             </div>

         </div>

     </div>   
 </div>
 
 
 
  <!-- modals -->  
 <%---- Seleccion Table Select pack and add pack ---%>
 <div  class="modal fade" id="NOTIFICACIONMODAL" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y: scroll;">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">

             <div class="modal-header" style="padding:35px 50px;">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4><span class="glyphicon glyphicon-lock"></span> Crear Notificaciones</h4>
             </div>

             <div class="modal-body" style="padding:40px 50px;">
                 
                    <input hidden="true" type="text" name="idNotificationHidden" id="idAccountHidden">  
                    
                    <form action="TableSave" method="post" id="form_guardarNotificacionbtn">
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Mensaje SMS</label>
                        <input type="text" class="form-control" name="DescriptionNotification" id="DescriptionNotification" placeholder="Descripcion" required>
                    </div>  

                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-ok"></span><label>Tipo de Mensaje</label>
                            <select id="OptionNotificationType" class="form-control" required>                       
                            </select>
                    </div>
                    <br>
                    <button type="submit" name="guardarNotificacionbtn" id="guardarNotificacionbtn" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Crear</button>
                    <br>
                    </form>

                 <div class="col-lg-12">
                     <div class="panel panel-default">
                         <div class="panel-body">                           
                             <div class="table-responsive">
                                 <table id="TABLENOTIFICATION" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">
                                        
                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>

             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
             </div>

         </div>

     </div>   
 </div>
 
 
 
<%---- modals ---%>
<%---- Edicion de Paquetes ---%>
<div style="display: none;" class="modal fade" id="editperservicemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Editar ejecución del paquete</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    
                <span class="section">Edición Paquete</span>
                <form action="TableSave" method="post" id="form_crearnewpack2btn">
                <div class="row">
                    <div class="col-md-2">
                        <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Id</label>
                        <input type="text" class="form-control" name="idPackLink2" id="idPackLink2" placeholder="Id" disabled>
                    </div>    
                    <div class="col-md-8">
                        <label for="usrname"><span class="glyphicon glyphicon-object-align-vertical"></span> Description</label>
                        <input type="text" class="form-control" name="packDesciptionLink2" id="packDesciptionLink2" placeholder="Description Pack" disabled>
                    </div>  
                </div>
                <br>
                <%----    
                    <div class="form-group">
                        <label for="usrname"><span class="glyphicon glyphicon-ok"></span><label>Recurrencia</label>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="idRecurrenceEdit" class="flat" checked="checked"> Habilitación  de recurrencia
                                </label>
                            </div>
                    </div>                  
                     ----%>   
		    <div class="row"> 
                    <div class="col-md-4">
                        <label>Fecha Inicio</label>
                        <div class='input-group date' id='dateiniteditservice'>                                            
                            <input type='text' id="dateiniteditservicetxt" class="form-control" required/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <label>Fecha Final</label>
                        <div class='input-group date'  id='datefinaleditservice'>                                            
                            <input id="datefinaleditservicetxt" type='text' class="form-control" required/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
		    </div>
					
					<br>
                      <div class="form-group">
                        <div class="btn-group" role="group" aria-label="Basic example">                            
                                <button type="submit" id="crearnewpack2btn" name="crearnewpack2btn" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Crear</button>      
                                <button type="button" name="modificareditserviciobtn" id="modificareditserviciobtn" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>                  
                        </div>
                    </div>  
                    </form>                   
				 <%---- TABLE ---%>
                    <div class="row" id="tablePackList">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-body">                           
                                    <div class="table-responsive">
                                        <table id="TABLEPACKSERVLINK2" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>DESCRIPTION</th>
                                                    <th>TECNOMEN</th>
                                                    <th>ACCOUNT</th>
                                                    <th>POLICY</th>
                                                    <th>HOURS</th>
                                                    <th>UNITS</th>
                                                    <th>DAYS</th>
                                                </tr>
                                            </thead>

                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>DESCRIPTION</th>
                                                    <th>TECNOMEN</th>
                                                    <th>ACCOUNT</th>
                                                    <th>POLICY</th>
                                                    <th>HOURS</th>
                                                    <th>UNITS</th>
                                                    <th>DAYS</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelService"  class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                </div>
        
        </div>

    </div>   
</div>


<%---- modals ---%>
<%---- Edicion de Precios ---%>
<div style="display: none;" class="modal fade" id="editpricemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span> Editar Precio del Paquete</h4>
                </div>

                <div class="modal-body" style="padding:40px 50px;">
                    
                     <span class="section">Edición de Precios</span>
                     
                     <form action="TableSave" method="post" id="form_crearnewpackbtn">
                     <div class="row">
                         <div class="col-md-2">
                                <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Id</label>
                                <input type="text" class="form-control" name="idPackLink" id="idPackLink" placeholder="Id" disabled>
                         </div>    
                         <div class="col-md-8">
                                <label for="usrname"><span class="glyphicon glyphicon-object-align-vertical"></span> Description</label>
                                <input type="text" class="form-control" name="packDesciptionLink" id="packDesciptionLink" placeholder="Description Pack" disabled>
                         </div>  
                     </div>
                     <br>
                     <div class="row">
                         <div class="col-md-2">
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span> Precio</label>
                             <input type="text" class="form-control" name="PackPriceEdit" id="PackPriceEdit" placeholder="Precio" required>

                         </div>
                         <div class="col-md-2">
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span> Ott Debito</label>
                             <input type="text" class="form-control" name="OttdebitEdit" id="OttdebitEdit" placeholder="Ott Debito" required>

                         </div>
                         <div class="col-md-2">
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span> Ott Credito</label>
                             <input type="text" class="form-control" name="OttcreditEdit" id="OttcreditEdit" placeholder="Ott Credito" required>                          
                         </div>
                         <div class="col-md-2">
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span> Account</label>
                             <select class="form-control" name="AccountEdit" id="AccountEdit" required>
                             </select>
                         </div> 

                         <div class="col-md-2">
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span> Rate Type</label>
                             <select id="RateTypePackEdit" class="form-control">                                           
                             </select>
                         </div> 

                         <div class="col-md-2">
                             <label for="usrname"><span class="glyphicon glyphicon-user"></span> Exchange</label>
                             <input type="text" class="form-control" name="ExchangeEdit" id="ExchangeEdit" placeholder="Exchange">
                         </div>  


                     </div>
                     <div class="row">               
                         <div class="col-md-4">
                             <label>Fecha Inicio</label>
                             <div class='input-group date' id='dateiniteditpack'>                                            
                                 <input type='text' id="dateiniteditpacktxt" class="form-control" required/>
                                 <span class="input-group-addon">
                                     <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                             </div>
                         </div>

                         <div class="col-md-4">
                             <label>Fecha Final</label>
                             <div class='input-group date'  id='datefinaleditpack'>                                            
                                 <input type='text' id="datefinaleditpacktxt" class="form-control" required/>
                                 <span class="input-group-addon">
                                     <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                             </div>
                         </div>
                     </div>       
                    <br>
                      <div class="form-group">
                        <div class="btn-group" role="group" aria-label="Basic example">                            
                                <button type="submit" name="crearnewpackbtn" id="crearnewpackbtn" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Crear</button>      
                                <button type="button" name="modificareditpackbtn" id="modificareditpackbtn" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>                  
                        </div>
                    </div>    
                     </form>
                    <%---- TABLE ---%>
                    <div class="row" id="tableLink">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-body">                           
                                    <div class="table-responsive">
                                        <table id="TABLEPACKSERVLINK" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>DESCRIPTION</th>
                                                    <th>TECNOMEN</th>
                                                    <th>ACCOUNT</th>
                                                    <th>POLICY</th>
                                                    <th>HOURS</th>
                                                    <th>UNITS</th>
                                                    <th>DAYS</th>
                                                </tr>
                                            </thead>

                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>DESCRIPTION</th>
                                                    <th>TECNOMEN</th>
                                                    <th>ACCOUNT</th>
                                                    <th>POLICY</th>
                                                    <th>HOURS</th>
                                                    <th>UNITS</th>
                                                    <th>DAYS</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelEditPack"  class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                    
                </div>
        
        </div>

    </div>   
</div>
                    

  <!-- modals -->  
 <%---- Seleccion add pack on Channel---%>
<div style="display: none;" class="modal fade" id="CHANNELADDPACKMODAL" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">

             <div class="modal-header" style="padding:35px 50px;">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4><span class="glyphicon glyphicon-lock"></span> Paquetes extras</h4>
             </div>

             <div class="modal-body" style="padding:40px 50px;">
                 


                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">                           
                                <div class="table-responsive">
                                    <table id="TABLEPACKCHANNEL" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <br>
                    
                    <br>

                  <div class="row"> 
                    <div class="col-md-4">
                        <label>Fecha Inicio</label>
                        <div class='input-group date' id='dateinitpackchannel'>                                            
                            <input type='text' id="dateinitpackchanneltxt" class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <label>Fecha Final</label>
                        <div class='input-group date'  id='datefinalpackchannel'>                                            
                            <input id="datefinalpackchanneltxt" type='text' class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
		    </div>
                    
                 <div class="col-lg-12">
                     <div class="panel panel-default">
                         <div class="panel-body">                           
                             <div class="table-responsive">
                                 <table id="TABLEADDPACKCHANNEL" class="table table-striped table-bordered table-hover" style="cursor:pointer"  cellspacing="0" width="100%">
                                        
                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>

             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
             </div>

         </div>

     </div>   
 </div>
 

 

 
 

 

     
<script type="text/javascript" src="FunctionsJs/jsFunctions.js"></script>

    



