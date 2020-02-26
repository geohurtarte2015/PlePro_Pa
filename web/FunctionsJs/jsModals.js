    $(document).ready(function(){
            //cuenta
            $('#cuentamd').load('modal.jsp');
  
            $("#crearbtn").click(function(){                    
                 $("#cuenta").modal({backdrop: 'static', keyboard: false});
                 $("#guardarcuentabtn").attr("disabled", false);
                 $("#modificarcuentabtn").attr("disabled", true);
            });
            
            $("#crearlistabtn").click(function(){                    
                 $("#listamodal").modal({backdrop: 'static', keyboard: false});
                 $("#guardarlistabtn").attr("disabled", false);
                 $("#modificarlistabtn").attr("disabled", true);
            });
            
            $("#crearperfilbtn").click(function(){                    
                 $("#perfilmodal").modal({backdrop: 'static', keyboard: false});
                 $("#guardarperfilbtn").attr("disabled", false);
                 $("#modificarperfilbtn").attr("disabled", true);
            });
            
            $("#crearserviciobtn").click(function(){                    
                 $("#serviciomodal").modal({backdrop: 'static', keyboard: false});
                 $("#guardarserviciobtn").attr("disabled", false);
                 $("#modificarserviciobtn").attr("disabled", true);
            });
            
            $("#crearcanalbtn").click(function(){                    
                 $("#canalmodal").modal({backdrop: 'static', keyboard: false});
                 $("#guardarcanalbtn").attr("disabled", false);
                 $("#modificarcanalbtn").attr("disabled", true);
            });
            
            $("#crearpaquetebtn").click(function(){                    
                        $("#paquetemodal").modal({backdrop: 'static', keyboard: false});
                        $("#guardarpaquetebtn").attr("disabled", false);
                        $("#modificarpaquetebtn").attr("disabled", true);
            });
            
           
    
    });