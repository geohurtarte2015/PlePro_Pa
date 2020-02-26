var id;
var idPackServiceTable = "";
var idService = "-100";
var idProductService = "-100";
var idPerServiceEdit = "-100";
var idPackPriceEdit = "-100";
var idPackService = "-100";
var idSource;

$(document).ready(function () {

    $(function () {
        $('#dateiniteditservice').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#datefinaleditservice').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });  
    $(function () {
        $('#dateinitservice').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#datefinalservice').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });  
    $(function () {
        $('#dateinitservicepack').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#datefinalservicepack').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#dateinitpricepack').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#datefinishpricepack').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#dateiniteditpack').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#datefinaleditpack').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    
     $(function () {
        $('#dateinitpackchannel').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    $(function () {
        $('#datefinalpackchannel').datetimepicker({
            format: "DD/MM/YYYY hh:mm:ss a"
        });
    });
    
    
    
    
    
    var tableCuenta = $('#TABLECUENTA').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",
            "data": function (d) {
                d.id = 0;
                d.tableParameter = "select * from mpm_account_type";
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[4, -1], [4, 20, "All"]],
        "dataType": "json",
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],
         "columnsDef": [
            {"width": "5%", "targets": 0},
            {"width": "130%", "targets": 1},
            {"width": "20%", "targets": 2},
            {"width": "10%", "targets": 3},
            {"width": "5%", "targets": 4},
            {"width": "5%", "targets": 5}
        
        ],
        "createdRow": function (row, data, dataIndex) {
            if (data[2] == "1") {
                $(row).addClass('important');
            }
        },   
        "columns": [
            {"title": "ID"},
            {"title": "DESCRIPTION"},
            {"title": "STATE"},
            {"title": "DATE"}
        ],
        "columnDefs": [{
                "targets": 4,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarCuenta' data-toggle='tooltip' data-placement='top' title='Eliminar la cuenta'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 5,
                "data": null,
                "defaultContent": "<center><a href='#' id='updateCuenta' data-toggle='tooltip' data-placement='top' title='Editar la cuenta'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

    });
    $('#TABLECUENTA tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tableCuenta.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    }); 
    
    $('#TABLECUENTA tbody').on('click', '#eliminarCuenta', function () {
        var auditory="Borrar Cuenta";
        var data = tableCuenta.row($(this).parents('tr')).data();
        idUpdate = data[0];


        var option = confirm("¿Desea Eliminar el registro?");
        if (option == true) {
            $.post("TableDelete",
                    {
                        tableParameter: "delete from mpm_account_type where id_account_type=" + idUpdate,
                        auditory: auditory
                    },
            function (json) {
                tableCuenta.clear().draw();
                tableCuenta.ajax.reload();
                loadContentAccountType();
                alert(json.message);
            });
        } else {
            alert("Cancelado")
        }




    });
    $('#TABLECUENTA tbody').on('click', '#updateCuenta', function () {

        var data = tableCuenta.row($(this).parents('tr')).data();
        idUpdate = data[0];


        var option = confirm("¿Desea Modificar el registro?");
        if (option == true) {
            $.post("SelectData",
                    {
                        tableParameter: "select * from mpm_account_type where id_account_type=" + idUpdate
                    },
            function (json) {
               $("#DescriptionAccount").val(json.Data1);
               $("#status").val(json.Data2);
               $("#cuenta").modal({backdrop: 'static', keyboard: false});
               $("#guardarcuentabtn").attr("disabled", true);
               $("#modificarcuentabtn").attr("disabled", false);
                
            });
        } else {
            alert("Cancelado")
        }




    });
    $("#guardarcuentabtn").click(function () {
        var auditory="Crea Cuenta";
        var description = $("#DescriptionAccount").val();
        var valState = $("#status").val();
        var tableParameter = "insert into mpm_account_type(id_account_type,description,state,date_registered) values (SM_PROGRAM.SEQ_ACCOUNT_TYPE.nextval," + "'" + description + "'" + "," + valState + ",sysdate)";

        $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory

                },
        function (json) {
            tableCuenta.clear().draw();
            tableCuenta.ajax.reload();
            loadContentAccountType();
            alert(json.message);
            clearAccount();

            
        });

    });   
    
    $("#modificarcuentabtn").click(function () {   
        
        var auditory="Modificar Cuenta";
        var description = $("#DescriptionAccount").val();
        var valState = $("#status").val();
        
        
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_account_type set description='"+description+"',state="+valState+" where id_account_type=" + idUpdate,
                        auditory: auditory
                    },
            function (json) {            
                tableCuenta.clear().draw();
                tableCuenta.ajax.reload();
                loadContentAccountType();
                alert(json.message);
                
            });
        
    });
    
    


    var tableLista = $('#TABLELISTA').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",
            "data": function (d) {
                d.id = 1;
                d.tableParameter = "select * from mpm_profile_list";
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[4, -1], [4, 20, "All"]],
        "dataType": "json",
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],        
        "columns": [
            {"title": "ID"},
            {"title": "DESCRIPTION"}
        ],
        "columnDefs": [{
                "targets": 2,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarLista' data-toggle='tooltip' data-placement='top' title='Eliminar Lista'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 3,
                "data": null,
                "defaultContent": "<center><a href='#' id='updateLista' data-toggle='tooltip' data-placement='top' title='Modificar lista'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

    });
    $('#TABLELISTA tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tableLista.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    }); 
    
    $('#TABLELISTA tbody').on('click', '#eliminarLista', function () {

        var auditory="Borrar Lista";
        var data = tableLista.row($(this).parents('tr')).data();
        idUpdate = data[0];


        var option = confirm("¿Desea Eliminar el registro?");
        if (option == true) {
            $.post("TableDelete",
                    {
                        tableParameter: "delete mpm_profile_list where id=" + idUpdate,
                        auditory: auditory
                    },
            function (json) {
                tableLista.clear().draw();
                tableLista.ajax.reload();
                loadContentList();
                loadContentList2();
                alert(json.message);
            });
        } else {
            alert("Cancelado");
        }




    });
    $('#TABLELISTA tbody').on('click', '#updateLista', function () {
        var data = tableLista.row($(this).parents('tr')).data();
        idUpdate = data[0];

        var option = confirm("¿Desea Modificar el registro?");
        if (option == true) {
            $.post("SelectData",
                    {
                        tableParameter: "select * from mpm_profile_list where id=" + idUpdate
                    },
            function (json) {
                $("#IdList").val(json.Data0);
                $("#DescriptionList").val(json.Data1);
                $("#listamodal").modal({backdrop: 'static', keyboard: false});
                $("#guardarlistabtn").attr("disabled", true);
                $("#modificarlistabtn").attr("disabled", false);
                
            });
        } else {
            alert("Cancelado");
        }
    });
    
    
    $("#guardarlistabtn").click(function () {
        var auditory="Crear lista";
        var idList = $("#IdList").val();
        var descriptionList = $("#DescriptionList").val();

        var tableParameter = "insert into mpm_profile_list(id,description) values (" + idList + "," + "'" + descriptionList + "'" + ")";

     $.post(
                "TableSave",
                {
                     tableParameter: tableParameter,
                    auditory: auditory

                },
        function (json) {
            tableLista.clear().draw();
            tableLista.ajax.reload();    
            loadContentList();
            loadContentList2();
            alert(json.message);
            clearList();
        });

    });
    $("#modificarlistabtn").click(function () {       
        var auditory="Modifica Cuenta";
        var descriptionList = $("#DescriptionList").val();
        
        
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_profile_list set description='"+descriptionList+"' where id=" + idUpdate,
                        auditory: auditory
                       
                    },
            function (json) {            
                tableLista.clear().draw();
                tableLista.ajax.reload();
                loadContentList();
                loadContentList2();
                alert(json.message);
                
            });
        
    });
    



    var tablePerfil = $('#TABLEPERFIL').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",
            "data": function (d) {
                d.id = 1;
                d.tableParameter = "select a.id,a.description,b.id as id_list,b.description as DESCRIPTION_LIST from mpm_profile_pack_allowed a inner join mpm_profile_list b on a.id_profilelist = b.id";
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[4, -1], [4, 20, "All"]],
        "dataType": "json",
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],
        "columns": [
            {"title": "ID"},
            {"title": "DESCRIPTION"},
            {"title": "ID LIST"},
            {"title": "DESCRIPTION LIST"}
        ],
        "columnDefs": [{
                "targets": 4,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarPerfil' data-toggle='tooltip' data-placement='top' title='Eliminar Perfil'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 5,
                "data": null,
                "defaultContent": "<center><a href='#' id='updatePerfil' data-toggle='tooltip' data-placement='top' title='Modificar Perfil'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

    });
    
     $('#TABLEPERFIL tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tablePerfil.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    }); 
    
    
    $('#TABLEPERFIL tbody').on('click', '#eliminarPerfil', function () {
        var auditory="Borrar Perfil";


        var data = tablePerfil.row($(this).parents('tr')).data();
        idUpdate = data[0];


        var option = confirm("¿Desea Eliminar el registro?");
        if (option == true) {
            $.post("TableDelete",
                    {
                        tableParameter: "delete mpm_profile_pack_allowed where id=" + idUpdate,
                        auditory: auditory
                    },
            function (json) {
                tablePerfil.clear().draw();
                tablePerfil.ajax.reload();
                alert(json.message);
            });
        } else {
            alert("Cancelado");
        }




    });
    $('#TABLEPERFIL tbody').on('click', '#updatePerfil', function () {

        var data = tablePerfil.row($(this).parents('tr')).data();
        idUpdate = data[0];
        var idList = data[2];


        var option = confirm("¿Desea Modificar el registro?");
        if (option == true) {
            $.post("SelectData",
                    {
                        tableParameter: "select * from mpm_profile_pack_allowed where id=" + idUpdate +"and id_profilelist="+idList
                    },
            function (json) {
                $("#IdProfile").val(json.Data0);
                $("#DescriptionProfile").val(json.Data1);
                $("#listoption").val(json.Data2);                
                $("#perfilmodal").modal({backdrop: 'static', keyboard: false});
                $("#guardarperfilbtn").attr("disabled", true);
                $("#modificarperfilbtn").attr("disabled", false);
                
            });
        } else {
            alert("Cancelado");
        }




    });
    $("#guardarperfilbtn").click(function () {
        var auditory="Crea Perfil";
        var idProfile = $("#IdProfile").val();
        var descriptionProfile = $("#DescriptionProfile").val();
        var idLista = $("#listoption").val();
        var tableParameter = "insert  into mpm_profile_pack_allowed(id,description,id_profilelist) values (" + idProfile + "," + "'" + descriptionProfile + "'" + "," + idLista + ")";

        $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory

                },
        function (json) {
            tablePerfil.clear().draw();
            tablePerfil.ajax.reload();
            alert(json.message);
            clearProfile();
        });

    });
    $("#modificarperfilbtn").click(function () { 
        var auditory="Modifica Perfil";
        var descriptionProfile = $("#DescriptionProfile").val();
        var idLista = $("#listoption").val();
        
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_profile_pack_allowed set description='"+descriptionProfile+"',id_profilelist="+idLista+" where id="+idUpdate,
                        auditory: auditory
                    },
            function (json) {            
                tablePerfil.clear().draw();
                tablePerfil.ajax.reload();
                alert(json.message);                
            });
        
    });
    
    
    
    
    loadContentList();
    function loadContentList(){
    $("#listoption").empty();
    $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_profile_list"

            },
    function (json) {
        $("#listoption").append('<option value="-1">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#listoption").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
}


                
//    var tableCanal = $('#TABLECANAL').DataTable({
//        "ajax": {
//            "url": "TableList",
//            "type": "POST",
//            "data": function (d) {
//                d.id = 0;
//                d.tableParameter = "select * from source";
//            },
//            "complete": function (response) {
//                $('#message').hide();
//            }
//        },
//        "global": false,
//        "lengthMenu": [[4, -1], [4, 20, "All"]],
//        "dataType": "json",
//        "createdRow": function (row, data, dataIndex) {
//            if (data[2] == "1") {
//                $(row).addClass('important');
//            }
//        },
//        "columns": [
//            {"title": "ID"},
//            {"title": "DESCRIPTION"}
//        ],
//        "columnDefs": [{
//                "targets": 2,
//                "data": null,
//                "defaultContent": "<center><a href='#' id='eliminarCanal'>" +
//                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
//                        "</a></center>"
//            },
//            {
//                "targets": 3,
//                "data": null,
//                "defaultContent": "<center><a href='#' id='updateCanal'>" +
//                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
//                        "</a></center>"
//            }
//        ]
//
//    });
    $('#TABLECANAL tbody').on('click', '#eliminarCanal', function () {
         var auditory="Borrar Canal";

        var data = tableCanal.row($(this).parents('tr')).data();
        idUpdate = data[0];

        var option = confirm("¿Desea Eliminar el registro?");
        if (option == true) {
            $.post("TableDelete",
                    {
                        tableParameter: "delete from source where id=" + idUpdate,
                        auditory: auditory
                    },
            function (json) {
                tableCanal.clear().draw();
                tableCanal.ajax.reload();
                alert(json.message);
                clearChannel();
                loadContentSource();
            });
        } else {
            alert("Cancelado");
        }




    });
//    $('#TABLECANAL tbody').on('click', '#updateCanal', function () {
//
//        var data = tableCanal.row($(this).parents('tr')).data();
//        idUpdate = data[0];
//
//
//        var option = confirm("¿Desea Modificar el registro?");
//        if (option == true) {
//            $.post("SelectData",
//                    {
//                        tableParameter: "select * from source where id=" + idUpdate
//                    },
//            function (json) {
//                $("#DescriptionSource").val(json.Data1);
//                $("#canalmodal").modal({backdrop: 'static', keyboard: false});
//                $("#guardarcanalbtn").attr("disabled", true);
//                $("#modificarcanalbtn").attr("disabled", false);
//                
//            });
//        } else {
//            alert("Cancelado");
//        }
//
//
//
//
//    });
    $("#guardarcanalbtn").click(function () {
        var auditory="Crea Canal";
        var description = $("#DescriptionSource").val();
        var tableParameter = "insert into source(id,description,date_registered) values (SM_PROGRAM.SEQ_SOURCE.nextval," + "'" + description + "'" + ",sysdate)";

        $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory

                },
        function (json) {
            tableCanal.clear().draw();
            tableCanal.ajax.reload();
            alert(json.message);
            clearChannel();
        });

    });
    $("#modificarcanalbtn").click(function () { 
        var auditory="Modifica Canal";
        var DescriptionSource = $("#DescriptionSource").val();

        
        $.post("TableSave",
                    {
                        tableParameter: "update  source set description='"+DescriptionSource+"',date_registered=sysdate where id="+idUpdate,
                        auditory: auditory
                    },
            function (json) {            
                tableCanal.clear().draw();
                tableCanal.ajax.reload();
                alert(json.message);  
                loadContentSource();
            });
        
    });
    




    var tableServicio = $('#TABLESERVICIO').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",           
            "data": function (d) {
                d.id = 1;
                d.tableParameter = "select a.service_id, a.description,b.description as state,a.ini_date,a.end_date,c.id as id_profile,c.description as profile_description from mpm_service_pack a inner join mpm_service_pack_state b on a.pack_state = b.id_state inner join mpm_profile_list c on a.id_profilelist = c.id";
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[10, -1], [10, 100]],
        "dataType": "json",
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],
        "columnsDef": [
            {"width": "5%", "targets": 0},
            {"width": "40%", "targets": 1},
            {"width": "20%", "targets": 2},
            {"width": "10%", "targets": 3},
            {"width": "10%", "targets": 4},
            {"width": "5%", "targets": 5},
            {"width": "10%", "targets": 6}
        ],
        "columns": [
            {"title": "ID"},
            {"title": "DESCRIPTION"},
            {"title": "STATE"},
            {"title": "INIT_DATE"},
            {"title": "FINISH_DATE"},
            {"title": "ID LIST"},
            {"title": "LIST"}
        ],
        "columnDefs": [{
                "targets": 7,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarServicio' data-toggle='tooltip' data-placement='top' title='Modificar Servicio'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 8,
                "data": null,
                "defaultContent": "<center><a href='#' id='modificarServicio' data-toggle='tooltip' data-placement='top' title='Modificar Servicio'>" +
                        "<img  src='img/sms2.jpg' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 9,
                "data": null,
                "defaultContent": "<center><a href='#' id='crearpaqueteserviciobtn' data-toggle='tooltip' data-placement='top' title='Vincular Paquetes'>" +
                        "<img  src='img/lupa.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

    });
    
    var tableProducto = $('#TABLEPRODUCTO').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",           
            "data": function (d) {
                d.id = 1;
                d.tableParameter = "SELECT sp.service_id,sp.description description_service,cp.ID_PACK,cp.DESCRIPTION,cp.ID_TECNOMEN,cp.ACCOUNT_TYPE,cp.RECHARGE_POLICY,cp.EXPIRY_TIME,cp.UNITS,cp.EXPIRY_DAY,pr.VALUE, pr.ott_credit,ott_debit,text_source,text_keyword,sp.id_profilelist,sp.ini_date,sp.end_date,PPS.AUTO_RENEWAL,sps.description description_pkg,sps.channel,sc.description_channel,sc.description_act_comercial,pps.id product_service_id FROM MPM_SERVICE_PACK_RATE pr JOIN MPM_SERVICE_PACK sp ON sp.SERVICE_ID = pr.service"+
                                    " JOIN MPM_CONFIG_PACK cp  ON pr.pack = cp.ID_PACK  JOIN MPM_PRODUCTS_PER_SERVICE pps  ON pps.service = sp.SERVICE_ID AND pps.pack = cp.ID_PACK  JOIN MPM_SERVICE_PACK_SOURCE sps  ON sp.service_id = sps.service  JOIN MPM_SERVICE_CHANNEL sc  ON sps.channel = sc.id_channel";
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[10, -1], [10, 100]],
        "dataType": "json",
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],
        "columnsDef": [
            {"width": "5%", "targets": 0},
            {"width": "40%", "targets": 1},
            {"width": "20%", "targets": 2},
            {"width": "10%", "targets": 3},
            {"width": "10%", "targets": 4},
            {"width": "10%", "targets": 5},
            {"width": "10%", "targets": 6},
            {"width": "10%", "targets": 7},
            {"width": "40%", "targets": 8},
            {"width": "20%", "targets": 9},
            {"width": "10%", "targets": 10},
            {"width": "10%", "targets": 11},
            {"width": "10%", "targets": 12},
            {"width": "10%", "targets": 13},
            {"width": "10%", "targets": 14},
            {"width": "40%", "targets": 15},
            {"width": "20%", "targets": 16},
            {"width": "10%", "targets": 17},
            {"width": "10%", "targets": 18},
            {"width": "10%", "targets": 19},
            {"width": "10%", "targets": 20},
            {"width": "20%", "targets": 21},
            {"width": "10%", "targets": 22},
            {"width": "10%", "targets": 23}
        ],
        "columns": [
            {"title": "SERVICE_ID"},
            {"title": "DESCRIPTION_SERVICE"},
            {"title": "ID_PACK"},
            {"title": "DESCRIPTION"},
            {"title": "ID_TECNOMEN"},
            {"title": "ACCOUNT_TYPE"},
            {"title": "RECHARGE_POLICY"},
            {"title": "EXPIRY_TIME"},
            {"title": "UNITS"},
            {"title": "EXPIRY_DAY"},
            {"title": "VALUE"},
            {"title": "OTT_CREDIT"},
            {"title": "OTT_DEBIT"},
            {"title": "TEXT_SOURCE"},
            {"title": "TEXT_KEYWORD"},
            {"title": "ID_PROFILELIST"},
            {"title": "INI_DATE"},
            {"title": "END_DATE"},
            {"title": "AUTO_RENEWAL"},
            {"title": "DESCRIPTION_PKG"},
            {"title": "CHANNEL"},
            {"title": "DESCRIPTION_CHANNEL"},
            {"title": "DESCRIPTION_ACT_COMERCIAL"},
            {"title": "PRODUCT_SERVICE_ID"}         
        ]
    });
    
    var tableProductoSms = $('#TABLEPRODUCTOSMS').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",           
            "data": function (d) {
                d.id = 1;
                d.tableParameter = "SELECT sp.service_id, sp.description description_service, cp.id_pack, cp.description description_pack,tsms.id, tsms.description type_sms, ppssms.text_sms FROM MPM_PRODUCTS_PER_SERVICE pps JOIN MPM_CONFIG_PACK cp   ON pps.pack = cp.ID_PACK  JOIN MPM_SERVICE_PACK sp   ON  pps.service = sp.service_id  JOIN MPM_PRODUCTS_PER_SERVICE_SMS ppssms    ON ppssms.product_service_id = pps.id  JOIN mpm_TYPE_SMS tsms   on ppssms.type_sms = tsms.id order by sp.service_id desc";                                    
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": true,
        "lengthMenu": [[7, -1], [7, 100]],
        "dataType": "json",
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],
        "columnsDef": [
            {"width": "5%", "targets": 0},
            {"width": "40%", "targets": 1},
            {"width": "5%", "targets": 2},
            {"width": "10%", "targets": 3},
            {"width": "10%", "targets": 4},
            {"width": "10%", "targets": 5},
            {"width": "50%", "targets": 6}
        ],
        "columns": [
            {"title": "ID"},
            {"title": "DESCRIPTION_SERVICE"},
            {"title": "PACK"},
            {"title": "DESCRIPTION_PACK"},
            {"title": "TYPE"},
            {"title": "TYPE_SMS"},
            {"title": "TEXT_SMS"}
        ]
    });
    
    
    
    $('#TABLESERVICIO tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tableServicio.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    });
    
    $('#TABLEPRODUCTO tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tableProducto.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    });
    
    
      $('#TABLEPRODUCTOSMS tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tableProductoSms.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    });
    
    

    
    $("#form_guardarserviciobtn").submit(function(event){
	event.preventDefault(); //prevent default action 
	       
        var auditory="Crear Servicio";
        var descriptionService = $("#DescriptionService").val();
        var stateserviceoption = $("#stateserviceoption").val();
        var listserviceoption = $("#listserviceoption").val();
        var dateinitservice = $("#dateinitservicetxt").val();
        var datefinalservice = $("#datefinalservicetxt").val();


        var tableParameter = "insert into mpm_service_pack(service_id,description,pack_state,ini_date,end_date,id_profilelist) values ("
                + "SM_PROGRAM.SEQ_SERVICE_PACK_PLE.NEXTVAL" + "," + "'" + descriptionService + "'" + "," + stateserviceoption + "," + "to_date('" + dateinitservice + "','dd/mm/yyyy HH:MI:SS AM')" + "," + "to_date('" + datefinalservice + "','dd/mm/yyyy HH:MI:SS AM')" + "," + listserviceoption + ")";
        
        
          
        $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory

                },
                function (json) {
                    tableServicio.clear().draw();
                    tableProducto.clear().draw();
                    tableProductoSms.clear().draw();
                    tableServicio.ajax.reload();
                    tableProducto.ajax.reload();
                    tableProductoSms.ajax.reload();
                    alert(json.message);
                    clearService();
                });
	
    });
    
    $("#form_serviceAddPacck").submit(function(event){
	event.preventDefault(); //prevent default action 
	       
        var auditory="Subscripcion de un servicio";
        var msisdn = $("#msisdn").val();
        var keyword = $("#keyword").val();


          
        $.post(
                "TableSave",
                {
                    msisdn: msisdn,
                    keyword: keyword,
                    auditory: auditory

                },
                function (json) {                
                    alert(json.message);                   
                });
	
    });
    
    
    
    
    
    $('#TABLESERVICIO tbody').on('click', '#eliminarServicio', function () {
     
        var data = tableServicio.row($(this).parents('tr')).data();
        idUpdate = data[0];

        var option = confirm("¿Desea editar el registro?");
        if (option == true) {
            
            $.post("SelectData",
                    {
                        tableParameter: "select * from mpm_service_pack where service_id=" + idUpdate                        
                    },
            function (json) {
                

                
                $("#DescriptionService").val(json.Data1);
                $("#stateserviceoption").val(json.Data2);
                $("#listserviceoption").val(json.Data5);
                $("#serviciomodal").modal({backdrop: 'static', keyboard: false});
                
                var dateInit = getDateInput(json.Data3);
                var dateFinish = getDateInput(json.Data4);
                
                
                $("#dateinitservicetxt").val(dateInit);
                $("#datefinalservicetxt").val(dateFinish);
                
                
                $('#guardarserviciobtn').attr("disabled", true);
                $('#modificarserviciobtn').attr("disabled", false);
                
              //  $("#paquetemodal").modal({backdrop: 'static', keyboard: false});
              //  $("#guardarpaquetebtn").attr("disabled", true);
              //  $("#modificarpaquetebtn").attr("disabled", false);
                
            });
        } else {
            alert("Cancelado");
        }




    });    
    $('#TABLESERVICIO tbody').on('click', '#crearpaqueteserviciobtn', function () {
        var data = tableServicio.row($(this).parents('tr')).data();
        idService = data[0];
        descriptionService = data[1];
        idPackServiceTable=idService;
        
        $("#IdServicePackInput").val(idService);
        $("#DescriptionServicePackInput").val(descriptionService);
         tableCanalServicio.clear().draw();
         tableCanalServicio.ajax.reload();
        $("#paqueteserviciomodal").modal();
      
    });
    
    
    
    
    loadContentList2();
    function loadContentList2(){
       $("#listserviceoption").empty();
    $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_profile_list"

            },
    function (json) {
        $("#listserviceoption").append('<option selected disabled value="">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#listserviceoption").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
}
    
    loadContentPackState();
    function loadContentPackState(){
    $("#stateserviceoption").empty();
    $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_service_pack_state"

            },
    function (json) {
        $("#stateserviceoption").append('<option selected disabled value="">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#stateserviceoption").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    

                


    var tablePaquete = $('#TABLEPAQUETE').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",
            "data": function (d) {
                d.id = 0;
                d.tableParameter = "select a.id_pack,a.description,a.id_tecnomen as tecnomen,b.description as account,a.recharge_policy as policy,a.expiry_time,a.units,a.expiry_day from mpm_config_pack a inner join mpm_account_type b on a.account_type=b.id_account_type";
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[4, -1], [4, 20, "All"]],
        "dom": "Bfrtip",
        "buttons": [
            'csv', 'excel'
        ],
        "dataType": "json",
        "createdRow": function (row, data, dataIndex) {
            if (data[2] == "1") {
                $(row).addClass('important');
            }
        },
        "columns": [
            {"title": "ID"},
            {"title": "DESCRIPTION"},
            {"title": "TECNOMEN"},
            {"title": "ACCOUNT"},
            {"title": "POLICY"},
            {"title": "EXP.HOURS"},
            {"title": "UNITS"},
            {"title": "EXP.DAYS"}
        ],
        "columnDefs": [{
                "targets": 8,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarPaquete' data-toggle='tooltip' data-placement='top' title='Eliminar Paquete'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 9,
                "data": null,
                "defaultContent": "<center><a href='#' id='updatePaquete' data-toggle='tooltip' data-placement='top' title='Modificar Servicio'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

    });
    
    $('#TABLEPAQUETE tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Filtrar por ' + title + '" />');
    });
    tablePaquete.columns().every(function () {
        var that = this;
        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                        .search(this.value)
                        .draw();
            }
        });
    }); 
    
    
    $('#TABLEPAQUETE tbody').on('click', '#eliminarPaquete', function () {
        var auditory="Borrar Paquete";
        var data = tablePaquete.row($(this).parents('tr')).data();
        idUpdate = data[0];

        var option = confirm("¿Desea Eliminar el registro?");
        if (option == true) {
            $.post("TableDelete",
                    {
                        tableParameter: "delete mpm_config_pack where id_pack="+idUpdate,
                        auditory: auditory
                    },
            function (json) {
                tablePaquete.clear().draw();
                tablePaquete.ajax.reload();
                alert(json.message);
            });
        } else {
            alert("Cancelado");
        }




    });
    $('#TABLEPAQUETE tbody').on('click', '#updatePaquete', function () {
        var data = tablePaquete.row($(this).parents('tr')).data();
        idUpdate = data[0];


        var option = confirm("¿Desea Modificar el registro?");
        if (option == true) {
            $.post("SelectData",
                    {
                        tableParameter: "select * from mpm_config_pack where id_pack=" + idUpdate
                    },
            function (json) {
                $("#DescriptionPack").val(json.Data1);
                $("#TecnomenPack").val(json.Data2);
                $("#OptionPack").val(json.Data3);
                $("#PolicyPack").val(json.Data4);
                $("#expiryPackHours").val(json.Data5);
                $("#unitsPack").val(json.Data6);
                $("#OptionExpiryDay").val(json.Data7);
                
                $("#paquetemodal").modal({backdrop: 'static', keyboard: false});
                $("#guardarpaquetebtn").attr("disabled", true);
                $("#modificarpaquetebtn").attr("disabled", false);
                
            });
        } else {
            alert("Cancelado");
        }




    });
    
    
    
    $("#form_guardarpaquetebtn").submit(function(event){
        event.preventDefault(); //prevent default action 
        
      
        var auditory="Crea Paquete";
        var idPack = $("#IdPack").val();
        var DescriptionPack = $("#DescriptionPack").val();
        var TecnomenPack = $("#TecnomenPack").val();
        var OptionPack = $("#OptionPack").val();
        var PolicyPack = $("#PolicyPack").val();
        var expiryPackHours = $("#expiryPackHours").val();
        var expiryPackDays = $("#OptionExpiryDay").val();
        var unitsPack = $("#unitsPack").val();

        var tableParameter = "insert into mpm_config_pack(id_pack,description,id_tecnomen,account_type,recharge_policy,expiry_time,units,expiry_day) values (SM_PROGRAM.SEQ_PACK.nextval"+",'"+ DescriptionPack + "'" + "," + TecnomenPack + "," + OptionPack + "," + PolicyPack + "," + expiryPackHours + "," + unitsPack + "," + expiryPackDays + ")";

        $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory

                },
        function (json) {
            tablePackServ.clear().draw();
            tablePaquete.clear().draw();
            tablePackServLink2.clear().draw();
            tablePackServLink.clear().draw();  
            tableProducto.clear().draw();
            tableProductoSms.clear().draw();
            tablePaquete.ajax.reload();
            tablePackServLink2.ajax.reload();
            tablePackServLink.ajax.reload();
            tablePackServ.ajax.reload();
            tableProducto.ajax.reload();
            tableProductoSms.ajax.reload();
            alert(json.message);
            clearPack();
        });

    });
    $("#modificarpaquetebtn").click(function () { 
        var auditory="Modifica Paquete";
        var DescriptionPack = $("#DescriptionPack").val();
        var TecnomenPack = $("#TecnomenPack").val();
        var OptionPack = $("#OptionPack").val();
        var PolicyPack = $("#PolicyPack").val();
        var expiryPackHours = $("#expiryPackHours").val();
        var expiryPackDays = $("#OptionExpiryDay").val();
        var unitsPack = $("#unitsPack").val();
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_config_pack set description='"+DescriptionPack+"',id_tecnomen="+TecnomenPack+",account_type="+OptionPack+",recharge_policy="+PolicyPack+",expiry_time="+expiryPackHours+",units="+unitsPack+",expiry_day="+expiryPackDays+" where id_pack="+idUpdate,
                        auditory: auditory
                       
                    },
            function (json) {            
                tablePaquete.clear().draw();
                tablePackServ.clear().draw();
                tablePackServicePrice.clear().draw();
                tablePackServiceUnit.clear().draw();
                tableLista.clear().draw();
                tablePaquete.ajax.reload();
                tablePackServ.ajax.reload();
                tablePackServicePrice.ajax.reload();
                tablePackServiceUnit.ajax.reload();
            
                
                alert(json.message);            
            });
        
    });
    
    
    loadContentAccountType();
    function loadContentAccountType(){
    $("#OptionPack").empty();
    $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_account_type"

            },
    function (json) {
        $("#OptionPack").append('<option selected disabled value="">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#OptionPack").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    
    
    
        $("#modificarserviciobtn").click(function () { 
        var auditory="Modifica Servicio";
        var DescriptionService = $("#DescriptionService").val();
        var stateserviceoption = $("#stateserviceoption").val();
        var listserviceoption = $('#listserviceoption').val();
        var dateinitservicetxt = $('#dateinitservicetxt').val();
        var datefinalservicetxt = $('#datefinalservicetxt').val();
        
        
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_service_pack set description='"+DescriptionService+"',pack_state="+stateserviceoption+",id_profilelist="+listserviceoption+",ini_date=to_date('" + dateinitservicetxt + "','dd/mm/yyyy HH:MI:SS AM'),end_date=to_date('" + datefinalservicetxt + "','dd/mm/yyyy HH:MI:SS AM') where service_id="+idUpdate,
                        auditory: auditory                       
                    },
            function (json) {         
                tableServicio.clear().draw();
                tableServicio.ajax.reload();                               
                alert(json.message);            
            });
        
    });
    
   
    
    
    var tablePackServ = $('#TABLEPACKSERV').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",    
             "data": function (d) {
                d.id = 0;
                d.tableParameter = "select a.id_pack,a.description,a.id_tecnomen as tecnomen,b.description as account,a.recharge_policy as policy,a.expiry_time,a.units,a.expiry_day from mpm_config_pack a inner join mpm_account_type b on a.account_type=b.id_account_type";
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
            {"title": "DESCRIPTION"},
            {"title": "TECNOMEN"},
            {"title": "ACCOUNT"},
            {"title": "POLICY"},
            {"title": "HOURS"},
            {"title": "UNITS"},
            {"title": "DAYS"}
        ]

    });
    $('#TABLEPACKSERV tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Filtrar por '+title+'" />' );
            } );  
    tablePackServ.columns().every( function () {
            var that = this;
                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                        }
                } );
    } );    
    $("#seleccionpaquetebtn").click(function(){                    
            $("#servicepack").modal({backdrop: 'static', keyboard: false});
    });
    
    $('#servicepack tbody').on('click', 'tr', function () {    
        var data = tablePackServ.row(this).data();
        id = data[0];
        description = data[1];
        alert('Seleccionado Paquete '+id+" "+description);
          $("#IdPackInput").val(id);
          $("#DescriptionPackInput").val(description);      
          $('#servicepack').modal('toggle');

    } ); 
    loadContentSource();
    function loadContentSource(){
     $("#OptionChannel").empty();
       $.post(
            "GetOptionListAlternative",
            {
                tableParameter: "select * from mpm_service_channel"

            },
        function (json) {
        $("#OptionChannel").append('<option value="-1">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#OptionChannel").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
        
    $("#aditionalpackpricebtn").click(function(){                    
          $("#editpricemodal").modal({backdrop: 'static', keyboard: false});  
          $("#crearnewpackbtn").show();
          $("#tableLink").show();
          $("#modificareditpackbtn").hide();
          clearAditionalPrice();
    });
    $("#vincularPackBtn").click(function(){  
        
       
        $("#servicepack").modal({backdrop: 'static', keyboard: false});
    });
    
    
    var tableCanalServicio = $('#TABLECANALSERVICIO').DataTable({    
        "ajax": {
            "url": "TableList",
            "type": "POST",
            "data": function (d) {
                d.id = 0;
               // d.tableParameter = "select id_source as id,text_source,channel,rate_type,text_keyword,description from mpm_service_pack_source where service="+idPackServiceTable;                
                d.tableParameter = "select a.id_source as id,a.text_source,b.description_channel as channel,c.description as rate_type ,a.text_keyword,a.description from mpm_service_pack_source a inner join mpm_service_channel b on a.channel = b.id_channel inner join mpm_rate_type c on a.rate_type=c.rate_type where service="+idPackServiceTable;
            },
            "complete": function (response) {
                $('#message').hide();
            }
        },
        "global": false,
        "lengthMenu": [[3, -1], [3, "All"]],
        "dataType": "json",
        "createdRow": function (row, data, dataIndex) {
            if (data[2] == "1") {
                $(row).addClass('important');
            }
        },    
        "columns": [
            {"title": "ID"},
            {"title": "SOURCE"},
            {"title": "CHANNEL"},
            {"title": "RATE TYPE"},
            {"title": "TEXT KEYWORD"},
            {"title": "DESCRIPTION CHANNEL"}
        ],
        "columnDefs": [{
                "targets": 6,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarCanal'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 7,
                "data": null,
                "defaultContent": "<center><a href='#' id='agregarPackCanal'>" +
                        "<img  src='img/anadir.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

    });
    
    
    $('#TABLECANALSERVICIO tbody').on('click', '#eliminarCanal', function () {
        var auditory="Borrar Canal";
        var data = tableCanalServicio.row($(this).parents('tr')).data();
        idUpdate = data[0];
       

        var option = confirm("¿Desea Eliminar el registro?");
        if (option == true) {
            $.post("TableDelete",
                    {
                        tableParameter: "delete from mpm_service_pack_source where id_source=" + idUpdate,
                        auditory: auditory
                    },
            function (json) {
                tableCanalServicio.clear().draw();
                tableCanalServicio.ajax.reload();
                alert(json.message);
            });
        } else {
            alert("Cancelado");
        }




    });
    $('#TABLECANALSERVICIO tbody').on('click', '#agregarPackCanal', function () {
        
        var auditory="Agregar Pack adicional al Canal";
        var data = tableCanalServicio.row($(this).parents('tr')).data();
        idSource = data[0];

        var option = confirm("¿Desea Agregar paquete extra?");
        if (option == true) {     
            tablepackchannel.clear().draw();
            tablepackchannel.ajax.reload();
         $("#CHANNELADDPACKMODAL").modal({backdrop: 'static', keyboard: false});
        } else {
            alert("Cancelado");
        }




    });
    
    
    $("#seleccionpaquetecanalbtn").click(function () {
        
        var auditory="Crear Channel";
        var OptionChannel = $("#OptionChannel").val();//
        var RateTypeChannel = $("#RateTypeChannel").val();//
        var ChannelTextSource = $("#ChannelTextSource").val();
        var ChannelTextKeyword = $("#ChannelTextKeyword").val();
        var ChannelTextMessage = $("#ChannelTextMessage").val();   
        
        var idRecurrence=0;
        

        
        if ($('#idRecurrence').is(":checked")) {
            idRecurrence=1;
        }
        
        //alert("idPackServiceTable: "+idPackServiceTable+" ChannelTextSource: "+ChannelTextSource+" ChannelTextKeyword: "+ChannelTextKeyword+" ChannelTextMessage: "+ChannelTextMessage+" OptionChannel: "+OptionChannel+" RateTypeChanne: "+RateTypeChannel+" idRecurrence: "+idRecurrence);
        
        var tableParameter = "insert into mpm_service_pack_source(id_source,service,text_source,text_keyword,description,channel,rate_type,auto_renewal) values (SM_PROGRAM.SEQ_SOURCE_SERVICE.nextval," + idPackServiceTable +",'" + ChannelTextSource + "'," + "'" + ChannelTextKeyword + "',"+ "'" + ChannelTextMessage + "','"+OptionChannel+"',"+RateTypeChannel+","+idRecurrence+")";
        
        if (OptionChannel==-1 || RateTypeChannel==-1 || ChannelTextSource=="" || ChannelTextKeyword==""){
            
            alert("Falta información en los campos de asignación de canales para crear un canal nuevo.");
            
        }else{
        $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory

                },
        function (json) {
            tableCanalServicio.clear().draw();
            tableCanalServicio.ajax.reload();
            alert(json.message);
        });
            
            
        }
        
   

    });
    
    
    //Guardar paquete y precio vinculacion

    $("#form_guardarserviciopaquetebtn").submit(function(event){
	event.preventDefault(); //prevent default action 
        
        var auditory="Vinculando paquetes";
        var idService = null;
        var idPack = null;
        var dateinitservicepacktxt = null;
        var datefinalservicepacktxt = null;          
        var packPrice = null;
        var ottDebit = null;
        var ottCredit = null;     
        var RateTypePack = null;
        var account = null;
        var exchange = null;
        var rows = tableCanalServicio.rows().count();

        
        
        idService = $("#IdServicePackInput").val();
        idPack = $("#IdPackInput").val();
        dateinitservicepacktxt = $("#dateinitservicepacktxt").val();
        datefinalservicepacktxt = $("#datefinalservicepacktxt").val();  
        
        
         if($("#PackPrice").val()!=""){
        packPrice = $("#PackPrice").val();
        }
        
         if($("#Ottdebit").val()!=""){
        ottDebit = $("#Ottdebit").val();
        }
        
        if($("#Ottcredit").val()!=""){
        ottCredit = $("#Ottcredit").val(); 
        }
         if($("#RateTypePack").val()!=-1){
        RateTypePack = $("#RateTypePack").val();
        }
        
        if($("#Account").val()!=""){
           account = $("#Account").val();
        }
    
        exchange = $("#Exchange").val();
        
   
        //var dateinitprice = $("#dateinitpricepacktxt").val();
       // var datefinalprice = $("#dateinitpricepacktxt").val();
        
       if(idPack==""){
           alert("Debe vincular un paquete al servicio.");
       }else{
           
           if(rows==0){alert("Debe vincular un canal al servicio")}else{
               
               var insertPerService = "insert into mpm_products_per_service(id,service,pack,auto_renewal,ini_date,end_date,priority) values (SM_PROGRAM.SEQ_PRODUCTS_PER_SERVICE.nextval" + "," + idService + "," + idPack + ",0," + "to_date('" + dateinitservicepacktxt + "','dd/mm/yyyy HH:MI:SS AM')" + "," + "to_date('" + datefinalservicepacktxt + "','dd/mm/yyyy HH:MI:SS AM')" + ",null" + ")";
            var insertPerPrice = "insert into mpm_service_pack_rate(id_rate,service,ini_date,end_date,value,ott_credit,ott_debit,pack,account,exchange_rate,rate_type) values (SM_PROGRAM.SEQ_SERVICE_PACK_RATE.nextval," + idService + "," + "to_date('" + dateinitservicepacktxt + "','dd/mm/yyyy HH:MI:SS AM')" + "," + "to_date('" + datefinalservicepacktxt + "','dd/mm/yyyy HH:MI:SS AM')" + "," + packPrice + "," + ottCredit + "," + ottDebit + "," + idPack + "," + account + ",null," + RateTypePack + ")";


            $.post(
                    "TableSavePerService",
                    {
                        insertPerService: insertPerService,
                        insertPerPrice: insertPerPrice,
                        auditory: auditory

                    },
                    function (json) {
                        alert("Vinculación Paquete: " + json.messageService + " " + "Vinculación Precio Clear: " + json.messagePrice);
                        clearServicePack();
                    });   
               
           }
           
                    
           
       }
        
        

    });
    
    
    
     var tablePackServicePrice = $('#TABLEVINCULACIONPACKS').DataTable({
            "ajax": {
                "url": "TableList",
                "type": "POST",
                "data": function (d) {
                    d.id = 0;
                    d.tableParameter = "select b.id_rate,a.id_pack,a.description,a.id_tecnomen,b.ott_credit,b.ott_debit,b.value,b.ini_date as init_price,b.end_date as end_date from mpm_config_pack a inner join mpm_service_pack_rate b on a.id_pack = b.pack  where b.service="+idService+" order by b.id_rate desc";
                }
            },
            "global": false,
            "sDom": "lrtip",
            "lengthMenu": [[4, 5, 6, -1], [4, 5, 6, "All"]],
            "dataType": "json",
            "columns": [
                {"title": "ID_RATE"},
                {"title": "ID_PACK"},
                {"title": "DESCRIPTION"},
                {"title": "ID_TECNOMEN"},
                {"title": "OTT_CREDIT"},
                {"title": "OTT_DEBIT"},
                {"title": "VALUE"},
                {"title": "INIT_PRICE"},
                {"title": "END_DATE"}
            ],
        "columnDefs": [{
                "targets": 9,
                "data": null,
                "defaultContent": "<center><a href='#' id='modificarPackPerPack'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

        });
    $('#TABLEVINCULACIONPACKS tbody').on('click', '#modificarPackPerPack', function () {
         var data = tablePackServicePrice.row($(this).parents('tr')).data();
        idProductService = data[0];
        var idPack = data[1];
        var descriptionPack = data[2];
    
          
             $.post(
                "SelectData",
                {
                    tableParameter: "select * from mpm_service_pack_rate where id_rate="+idProductService
                },
        function (json) {
                    
                    
                    var dateStringInit = json.Data2;
                    var dateStringEnd = json.Data3;
                    var value = json.Data4;
                    var ottCredit = json.Data5;
                    var ottDebit = json.Data6;
                    var pack = json.Data7;
                    var account = json.Data8;
                    var exchangeRate = json.Data9;
                    var rateType = json.Data10;

                    //var dateObjectInit = new Date(dateStringInit);
                    //var dateObjectEnd = new Date(dateStringEnd);

                   // var monthInit = parseInt(dateObjectInit.getMonth()) + 1;
                   // var monthEnd = parseInt(dateObjectEnd.getMonth()) + 1;
                    
                    
                    var stringDateInit = getDateInput(dateStringInit);
                    var stringDateEnd = getDateInput(dateStringEnd);

                    //var stringDateInit = dateObjectInit.getDate() + "/" + monthInit + "/" + dateObjectInit.getFullYear() + " " + formatAMPM(dateObjectInit);
                    //var stringDateEnd = dateObjectEnd.getDate() + "/" + monthEnd + "/" + dateObjectEnd.getFullYear() + " " + formatAMPM(dateObjectEnd);
                    
                    $("#idPackLink").val(idPack);
                    $("#packDesciptionLink").val(descriptionPack);
                    $("#PackPriceEdit").val(value);
                    $("#OttdebitEdit").val(ottDebit);
                    $("#OttcreditEdit").val(ottCredit);
                    $("#AccountEdit").val(account);
                    $("#ExchangeEdit").val(exchangeRate);
                    
                    if(rateType==null || rateType==''){
                        document.getElementById("RateTypePackEdit").value = -1;
                    }else{
                        $("#RateTypePackEdit").val(rateType);
                    }
                    
                    
                                        
                    $("#dateiniteditpacktxt").val(stringDateInit);
                    $("#datefinaleditpacktxt").val(stringDateEnd);  
                    
                    
                });
                            
        
     
        $("#editpricemodal").modal({backdrop: 'static', keyboard: false});   
        $("#crearnewpackbtn").hide();
        $("#tableLink").hide();
        $("#modificareditpackbtn").show();
        });    
    $('#TABLEVINCULACIONPACKS tbody').on('click', '#agregarPackPerPackAditional', function () {
         var data = tablePackServicePrice.row($(this).parents('tr')).data();
        
        idPackService = data[1];
        
     
        $("#editpricemodal").modal({backdrop: 'static', keyboard: false});       
        });   
    
    
    
     $("#modificareditpackbtn").click(function () {   
        var auditory="Modificar paquete";
         
        var PackPriceEdit = null;       
        var OttdebitEdit = null;  
        var OttcreditEdit = null;  
        var AccountEdit = null; 
        var RateTypePackEdit = null;  
        var dateiniteditpacktxt = null;     
        var datefinaleditpacktxt = null; 
                
        if($("#PackPriceEdit").val()!=""){        
            PackPriceEdit = $("#PackPriceEdit").val();        
        }
        
        if($("#OttdebitEdit").val()!=""){  
        OttdebitEdit = $("#OttdebitEdit").val(); 
        }
        
        if($("#OttcreditEdit").val()!=""){  
        OttcreditEdit = $("#OttcreditEdit").val();  
        }
        
        if($("#AccountEdit").val()!=""){  
        AccountEdit = $("#AccountEdit").val();  
        }
        
        if($("#RateTypePackEdit").val()!=""){ 
        RateTypePackEdit = $("#RateTypePackEdit").val();  
        }
        
        dateiniteditpacktxt = $("#dateiniteditpacktxt").val();    
        datefinaleditpacktxt = $("#datefinaleditpacktxt").val(); 
         
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_service_pack_rate set ini_date=to_date('" + dateiniteditpacktxt + "','dd/mm/yyyy HH:MI:SS AM'),end_date=to_date('" + datefinaleditpacktxt + "','dd/mm/yyyy HH:MI:SS AM'),value="+PackPriceEdit+",ott_credit="+OttcreditEdit+",ott_debit="+OttdebitEdit+",account="+AccountEdit+",rate_type="+RateTypePackEdit+" where id_rate="+idProductService,
                        auditory: auditory
                       
                    },
            function (json) {            
                tablePackServicePrice.clear().draw();
                tablePackServicePrice.ajax.reload();
                alert(json.message);      
            });
        
     
                
        
        
        
       });   
       
       
    $("#form_crearnewpackbtn").submit(function(event){
	event.preventDefault(); //prevent default action 
        var auditory="Crear paquete adicional";
         
        var PackPriceEdit = null;       
        var OttdebitEdit = null;  
        var OttcreditEdit = null;  
        var AccountEdit = null; 
        var RateTypePackEdit = null;  
        var dateiniteditpacktxt = null;     
        var datefinaleditpacktxt = null; 
        var idPackSelection = null;
                
        if ($("#PackPriceEdit").val() != "") {
            PackPriceEdit = $("#PackPriceEdit").val();
        }

        if ($("#OttdebitEdit").val() != "") {
            OttdebitEdit = $("#OttdebitEdit").val();
        }

        if ($("#OttcreditEdit").val() != "") {
            OttcreditEdit = $("#OttcreditEdit").val();
        }

        if ($("#AccountEdit").val() != "") {
            AccountEdit = $("#AccountEdit").val();
        }

        if ($("#RateTypePackEdit").val() != "") {
            RateTypePackEdit = $("#RateTypePackEdit").val();
        }

        if ($("#idPackLink").val() != "") {
            idPackSelection = $("#idPackLink").val();
        }
        
        if($("#idPackLink").val()==""){
            alert("Selecccione un paquete en el listado.");
        }else{
              dateiniteditpacktxt = $("#dateiniteditpacktxt").val();    
        datefinaleditpacktxt = $("#datefinaleditpacktxt").val(); 
         
        $.post("TableSave",
                    {
                        tableParameter: "insert into mpm_service_pack_rate(id_rate,service,ini_date,end_date,value,ott_credit,ott_debit,pack,account,exchange_rate,rate_type) values (SM_PROGRAM.SEQ_SERVICE_PACK_RATE.nextval,"+idService+","+"to_date('" + dateiniteditpacktxt + "','dd/mm/yyyy HH:MI:SS AM')"+","+"to_date('" + datefinaleditpacktxt + "','dd/mm/yyyy HH:MI:SS AM')"+","+PackPriceEdit+","+OttcreditEdit+","+OttdebitEdit+","+idPackSelection+","+AccountEdit+",null,"+RateTypePackEdit+")",
                        auditory: auditory
                       
                    },
            function (json) {            
                tablePackServicePrice.clear().draw();
                tablePackServicePrice.ajax.reload();
                tableProductoSms.clear().draw();
                tableProductoSms.ajax.reload();
                alert(json.message);      
                clearAditionalPrice();
            });
        }
        
      
        
        
        
     });   
       
        
        
        
        
    var tablePackServiceUnit = $('#TABLEVINCULACIONPACKSPERSERVICE').DataTable({
            "ajax": {
                "url": "TableList",
                "type": "POST",
                "data": function (d) {
                    d.id = 0;
                    d.tableParameter = "select b.id,a.id_pack,a.description,b.ini_date as pack_init,b.end_date as end_price from mpm_config_pack a inner join mpm_products_per_service b on a.id_pack = b.pack  where b.service="+idService+" order by b.id desc";
                }
            },
            "global": false,
            "sDom": "lrtip",
            "lengthMenu": [[4, 5, 6, -1], [4, 5, 6, "All"]],
            "dataType": "json",
            "columns": [
                {"title": "ID"},
                {"title": "ID_PACK"},
                {"title": "DESCRIPTION"},                
                {"title": "PACK_INIT"},
                {"title": "PACK_END"}
            ],
        "columnDefs": [{
                "targets": 5,
                "data": null,
                "defaultContent": "<center><a href='#' id='modificarPackPerService'>" +
                        "<img  src='img/pencil.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },           
            {
                "targets": 6,
                "data": null,
                "defaultContent": "<center><a href='#' id='agregarNotificacion'>" +
                        "<img  src='img/sms2.jpg' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

        });
        
    $('#TABLEVINCULACIONPACKSPERSERVICE tbody').on('click', '#agregarNotificacion', function () {
         var data = tablePackServiceUnit.row($(this).parents('tr')).data();
        idProductService = data[0];
        tableNotification.clear().draw();
        tableNotification.ajax.reload();
        $("#NOTIFICACIONMODAL").modal({backdrop: 'static', keyboard: false});       
    });          
    var tableNotification = $('#TABLENOTIFICATION').DataTable({
         
            "ajax": {
                "url": "TableList",
                "type": "POST",
                "data": function (d) {
                    d.id = 0;
                    d.tableParameter = "select a.id_sms,a.TYPE_SMS,b.description,a.TEXT_SMS  from mpm_products_per_service_sms a  inner join mpm_type_sms b  on a.type_sms=b.id where product_service_id="+idProductService;
                }
            },
            "global": false,
            "sDom": "lrtip",
            "lengthMenu": [[4, 5, 6, -1], [4, 5, 6, "All"]],
            "dataType": "json",
            "columns": [
                {"title": "ID"},
                {"title": "TYPE_SMS"},
                {"title": "DESCRIPTION"},
                {"title": "MESSAGE"}
            ],
        "columnDefs": [{
                "targets": 4,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarNotificacion'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

        });        
    $('#TABLENOTIFICATION tbody').on('click', '#eliminarNotificacion', function () {
        var auditory="Borrar Notificacion";
        var data = tableNotification.row($(this).parents('tr')).data();
        idNotificationSms = data[0];
        
            var tableParameter = "delete from mpm_products_per_service_sms where id_sms=" + idNotificationSms;
             $.post(
                "TableDelete",
                {
                    tableParameter: tableParameter,
                    auditory: auditory
                },
        function (json) {
            alert("Notificación eliminada: "+json.message);
            tableNotification.clear().draw();
            tableNotification.ajax.reload();
            
        });
        
        
        
        
        
      
     $("#NOTIFICACIONMODAL").modal({backdrop: 'static', keyboard: false});
       
    });
    $('#TABLEVINCULACIONPACKSPERSERVICE tbody').on('click', '#modificarPackPerService', function () {
       var data = tablePackServiceUnit.row($(this).parents('tr')).data();
       idPerServiceEdit = data[0];
       $("#idPackLink2").val(data[1]);
       $("#packDesciptionLink2").val(data[2]);
       
       
             $.post(
                "SelectData",
                {
                    tableParameter: "select * from mpm_products_per_service where id="+idPerServiceEdit
                },
        function (json) {
              
              var renewalCheck = json.Data3;
              var dateStringInit = json.Data4;
              var dateStringEnd = json.Data5;
              
            
              
          
              
              var stringDateInit = getDateInput(dateStringInit);
              var stringDateEnd = getDateInput(dateStringEnd);  
                          

                            
              $("#datefinaleditservicetxt").val(stringDateEnd);
              $("#dateiniteditservicetxt").val(stringDateInit);    
              $("#tablePackList").hide();
              
              
            
        });      
      
     $("#editperservicemodal").modal({backdrop: 'static', keyboard: false});
     $("#modificareditserviciobtn").show();
     $("#crearnewpack2btn").hide();
    

       
    });     
   

    
    
    var tablePackServiceSms = $('#TABLEVINCULACIONSMS').DataTable({
            "ajax": {
                "url": "TableList",
                "type": "POST",
                "data": function (d) {
                    d.id = 0;
                    d.tableParameter = "select b.id,a.id_pack,a.description,b.auto_renewal,b.ini_date as pack_init,b.end_date as end_price from mpm_config_pack a inner join mpm_products_per_service b on a.id_pack = b.pack  where b.service="+idService+" order by b.id desc";
                }
            },
            "global": false,
            "sDom": "lrtip",
            "lengthMenu": [[4, 5, 6, -1], [4, 5, 6, "All"]],
            "dataType": "json",
            "columns": [
                {"title": "ID"},
                {"title": "ID_PACK"},
                {"title": "DESCRIPTION"},
                {"title": "RENEWAL"},
                {"title": "PACK_INIT"},
                {"title": "PACK_END"}
            ],
        "columnDefs": [{
                "targets": 6,
                "data": null,
                "defaultContent": "<center><a href='#' id='eliminarPackPerService'>" +
                        "<img  src='img/eliminar.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            },
            {
                "targets": 7,
                "data": null,
                "defaultContent": "<center><a href='#' id='agregarNotificacionSms'>" +
                        "<img  src='img/lupa.png' width='16' height='16'  border='0' />" +
                        "</a></center>"
            }
        ]

        });
    $('#TABLESERVICIO tbody').on('click', '#modificarServicio', function () {
        var data = tableServicio.row($(this).parents('tr')).data();
        idService = data[0];
        tablePackServiceSms.clear().draw();
        tablePackServiceSms.ajax.reload();
        $("#NOTIFICACIONPACKMODAL").modal({backdrop: 'static', keyboard: false});
    });
    $('#TABLEVINCULACIONSMS tbody').on('click', '#agregarNotificacionSms', function () {
        var data = tablePackServiceSms.row($(this).parents('tr')).data();
        idProductService = data[0];
        tableNotification.clear().draw();
        tableNotification.ajax.reload();
        $("#NOTIFICACIONMODAL").modal({backdrop: 'static', keyboard: false});
    });
    $("#form_guardarNotificacionbtn").submit(function (event) {
         event.preventDefault(); //prevent default action 
         var auditory="Crea Notificacion";
         var OptionNotificationType = $("#OptionNotificationType").val();
         var DescriptionNotification = $("#DescriptionNotification").val();
         
        var tableParameter = "insert into mpm_products_per_service_sms(id_sms,product_service_id,type_sms,text_sms) values (SM_PROGRAM.SEQ_PRODUCTS_PER_SERVICE_SMS.nextval,"+idProductService+","+OptionNotificationType+",'"+DescriptionNotification+"')";
             $.post(
                "TableSave",
                {
                    tableParameter: tableParameter,
                    auditory: auditory
                },
        function (json) {
            alert("Creacion de mensaje: "+json.message);
            tableNotification.clear().draw();
            tableProductoSms.clear().draw();
            tableNotification.ajax.reload();
            tableProductoSms.ajax.reload();
            loadContentTypeNotification();
            $('#DescriptionNotification').val('');

            
        });
        
        
        
       });
    loadContentTypeNotification();
    function loadContentTypeNotification(){
    $("#OptionNotificationType").empty();
    $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_type_sms"

            },
    function (json) {
        $("#OptionNotificationType").append('<option selected disabled value="">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#OptionNotificationType").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    
}
    
    
    
    var tablePackServLink = $('#TABLEPACKSERVLINK').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",    
             "data": function (d) {
                d.id = 0;
                d.tableParameter = "select a.id_pack,a.description,a.id_tecnomen as tecnomen,b.description as account,a.recharge_policy as policy,a.expiry_time,a.units,a.expiry_day from mpm_config_pack a inner join mpm_account_type b on a.account_type=b.id_account_type";
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
            {"title": "DESCRIPTION"},
            {"title": "TECNOMEN"},
            {"title": "ACCOUNT"},
            {"title": "POLICY"},
            {"title": "HOURS"},
            {"title": "UNITS"},
            {"title": "DAYS"}
        ]

    });
    $('#TABLEPACKSERVLINK tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Filtrar por '+title+'" />' );
            } );  
    tablePackServLink.columns().every( function () {
            var that = this;
                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                        }
                } );
    } ); 
     $('#TABLEPACKSERVLINK tbody').on('click', 'tr', function () {    
        var data = tablePackServLink.row(this).data();
        id = data[0];
        description = data[1];
        alert('Seleccionado Paquete '+id+" "+description);
          $("#idPackLink").val(id);
          $("#packDesciptionLink").val(description);           

    } ); 
    
    
    
    
     var tablePackServLink2 = $('#TABLEPACKSERVLINK2').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",    
             "data": function (d) {
                d.id = 0;
                d.tableParameter = "select a.id_pack,a.description,a.id_tecnomen as tecnomen,b.description as account,a.recharge_policy as policy,a.expiry_time,a.units,a.expiry_day from mpm_config_pack a inner join mpm_account_type b on a.account_type=b.id_account_type";
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
            {"title": "DESCRIPTION"},
            {"title": "TECNOMEN"},
            {"title": "ACCOUNT"},
            {"title": "POLICY"},
            {"title": "HOURS"},
            {"title": "UNITS"},
            {"title": "DAYS"}
        ]

    });
    $('#TABLEPACKSERVLINK2 tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Filtrar por '+title+'" />' );
            } );  
    tablePackServLink2.columns().every( function () {
            var that = this;
                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                        }
                } );
    } ); 
     $('#TABLEPACKSERVLINK2 tbody').on('click', 'tr', function () {    
        var data = tablePackServLink2.row(this).data();
        var id = data[0];
        var description = data[1];
        alert('Seleccionado Paquete '+id+" "+description);
          $("#idPackLink2").val(id);
          $("#packDesciptionLink2").val(description);           

    } ); 
    
     $("#aditionalpackbtn").click(function () {          
         $("#modificareditserviciobtn").hide();
         $("#editperservicemodal").modal({backdrop: 'static', keyboard: false});
         clearAditionalPack();
         $("#tablePackList").show();
         $("#crearnewpack2btn").show();
    });
    
     $("#modificareditserviciobtn").click(function () {
         var auditory="Modifica Servicio";
        var idEditRecurrence=0;
        
        if ($('#idRecurrenceEdit').is(":checked")) {
            idEditRecurrence = 1;
        } else {
            idEditRecurrence = 0;
        }
        
         var dateInitEdit = $("#dateiniteditservicetxt").val();
         var dateFinalEdit = $("#datefinaleditservicetxt").val();
         
         
        $.post("TableSave",
                    {
                        tableParameter: "update  mpm_products_per_service set ini_date=to_date('" + dateInitEdit + "','dd/mm/yyyy HH:MI:SS AM'),end_date=to_date('" + dateFinalEdit + "','dd/mm/yyyy HH:MI:SS AM') where id="+idPerServiceEdit,
                        auditory: auditory
                    },
            function (json) {            
                tablePackServiceUnit.clear().draw();
                tablePackServiceUnit.ajax.reload();
                alert(json.message);      
            });
        

    });
    
    
    $("#form_crearnewpack2btn").submit(function(event){
	event.preventDefault(); //prevent default action 
        
        
         var auditory="Inserta paquete adicional";
         
        var idPack=$("#idPackLink2").val();
        
        var idEditRecurrence=0;
        
        if ($('#idRecurrenceEdit').is(":checked")) {
            idEditRecurrence = 1;
        } else {
            idEditRecurrence = 0;
        }
        
         var dateInitNew = $("#dateiniteditservicetxt").val();
         var dateFinalNew = $("#datefinaleditservicetxt").val();
         
       
        if(idPack==""){
            alert("Seleccione un paquete para vincular");
        }else{
            $.post("TableSave",
                    {
                        tableParameter: "insert into mpm_products_per_service(id,service,pack,auto_renewal,ini_date,end_date,priority) values (SM_PROGRAM.SEQ_PRODUCTS_PER_SERVICE.nextval" + "," + idService + "," + idPack + ",0," + "to_date('" + dateInitNew + "','dd/mm/yyyy HH:MI:SS AM')" + "," + "to_date('" + dateFinalNew + "','dd/mm/yyyy HH:MI:SS AM')" + ",null" + ")",
                        auditory: auditory
                    },
                    function (json) {
                        tablePackServiceUnit.clear().draw();
                        tableProductoSms.clear().draw();
                        tablePackServiceUnit.ajax.reload();
                        tableProductoSms.ajax.reload();
                        alert(json.message);
                        clearAditionalPack();
                    });
        }
        
   
        

    });
    
    
    
    //lista de packs extras
    var tablepackchannel = $('#TABLEPACKCHANNEL').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",    
             "data": function (d) {
                d.id = 0;
                d.tableParameter = "select a.id,b.description,b.id_tecnomen,a.id_pack,a.ini_date,a.end_date,a.state from MPM_PRODUCTS_PER_SOURCE a inner join mpm_config_pack b on a.id_pack=b.id_pack where a.id_source="+idSource;
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
            {"title": "DESCRIPTION"},
            {"title": "TECNOMEN"},
            {"title": "ID_PACK"},
            {"title": "INI_DATE"},
            {"title": "END_DATE"},
            {"title": "STATE"}      
        ]

    });
    
        
    
       //agregar packs en channel
    var tableaddpackchannel = $('#TABLEADDPACKCHANNEL').DataTable({
        "ajax": {
            "url": "TableList",
            "type": "POST",    
             "data": function (d) {
                d.id = 0;
                d.tableParameter = "select a.id_pack,a.description,a.id_tecnomen as tecnomen,b.description as account,a.recharge_policy as policy,a.expiry_time,a.units,a.expiry_day from mpm_config_pack a inner join mpm_account_type b on a.account_type=b.id_account_type";
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
            {"title": "DESCRIPTION"},
            {"title": "TECNOMEN"},
            {"title": "ACCOUNT"},
            {"title": "POLICY"},
            {"title": "HOURS"},
            {"title": "UNITS"},
            {"title": "DAYS"}
        ]

    });
    
    $('#TABLEADDPACKCHANNEL tbody').on('click', 'tr', function () {    
        var data = tableaddpackchannel.row(this).data();
        id = data[0];
        description = data[1];

  
        var auditory = "Paquete extra insertado al canal";
        var dateinitpackchanneltxt = $("#dateinitpackchanneltxt").val();
        var datefinalpackchanneltxt = $("#datefinalpackchanneltxt").val();

        
        var option = confirm("¿Desea insertar el paquete extra? "+description);
        if (option == true) {           
          $.post("TableSave",
                    {
                        tableParameter: "Insert into MPM_PRODUCTS_PER_SOURCE (ID,ID_SOURCE,ID_PACK,INI_DATE,END_DATE,STATE) values (SM_PROGRAM.SEQ_PRODUCTS_PER_SOURCE.NEXTVAL,"+idSource+","+id+","+"to_date('" + dateinitpackchanneltxt + "','dd/mm/yyyy HH:MI:SS AM'),"+"to_date('" + datefinalpackchanneltxt + "','dd/mm/yyyy HH:MI:SS AM'),"+"1)",
                        auditory: auditory
                    },
            function (json) {
                tablepackchannel.clear().draw();
                tablepackchannel.ajax.reload();
                alert(json.message);
            });
        } else {
            alert("Cancelado");
        }

    } ); 
    
    
    

    
    
    
    
    loadContentRateTypePack();
    function loadContentRateTypePack(){
     $("#RateTypePack").empty();
       $.post(
            "GetOptionListService",
            {
                tableParameter: "select * from mpm_rate_type"

            },
        function (json) {
        $("#RateTypePack").append('<option value="-1">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#RateTypePack").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    
    
    
    
    loadContentAccount();
    function loadContentAccount(){
     $("#Account").empty();
       $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_discount_account"

            },
        function (json) {
        $("#Account").append('<option selected disabled value="">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#Account").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    
    loadContentAccountEdit();
    function loadContentAccountEdit(){
     $("#AccountEdit").empty();
       $.post(
            "GetOptionList",
            {
                tableParameter: "select * from mpm_discount_account"

            },
        function (json) {
        $("#AccountEdit").append('<option selected disabled value="">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#AccountEdit").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    
    loadContentRateTypeChannel();
    function loadContentRateTypeChannel(){
     $("#RateTypeChannel").empty();
       $.post(
            "GetOptionListService",
            {
                tableParameter: "select * from mpm_rate_type"

            },
        function (json) {
        $("#RateTypeChannel").append('<option value="-1">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#RateTypeChannel").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    
    loadContentRateTypeEdit();
    function loadContentRateTypeEdit(){
     $("#RateTypePackEdit").empty();
       $.post(
            "GetOptionListService",
            {
                tableParameter: "select * from mpm_rate_type"

            },
        function (json) {
        $("#RateTypePackEdit").append('<option value="-1">Seleccionar...</option>');
        $.each(json, function (key, value) {
            $.each(value, function (id, description) {
                $("#RateTypePackEdit").append('<option value="' + id + '">' + description + '</option>');
            });
        });
    });
    }
    
   
    
        
        
    $("#verserviciopaquetebtn").click(function () {
        idService = $("#IdServicePackInput").val();
        tablePackServicePrice.clear().draw();
        tablePackServicePrice.ajax.reload();
        tablePackServiceUnit.clear().draw();
        tablePackServiceUnit.ajax.reload();
        $("#servicepackprice").modal({backdrop: 'static', keyboard: false});

    });
    
    
    
    function clearServicePack(){
        
        $('#IdPackInput').val('');
        $('#DescriptionPackInput').val('');
        $('#dateinitservicepacktxt').val('');
        $('#datefinalservicepacktxt').val('');
        $('#PackPrice').val('');
        $('#Ottdebit').val('');
        $('#Ottcredit').val('');
        $('#dateinitpricepacktxt').val('');
        $('#datefinishpricepacktxt').val('');
         document.getElementById("OptionChannel").value =-1;
         document.getElementById("RateTypePack").value=-1;
        $('#ChannelTextKeyword').val('');
        $('#ChannelTextMessage').val('');
        $('#Account').val('');
        $('#Exchange').val('');        
    
       
        
    }
    
    function clearAccount(){
          $('#DescriptionAccount').val('');
          document.getElementById("status").value =-1;
          
        
    }
    
    function clearList(){
          $('#IdList').val('');
          $('#DescriptionList').val('');
          
        
    }
    
    function clearProfile(){
          $('#IdProfile').val('');
          $('#DescriptionProfile').val('');
          document.getElementById("listoption").value =-1;
          
        
    }
    
    function clearChannel(){
          $('#DescriptionSource').val('');
    }
    
    function clearAditionalPrice(){ 
        $('#idPackLink').val('');
        $('#packDesciptionLink').val('');
        $('#PackPriceEdit').val('');
        $('#OttdebitEdit').val('');
        $('#OttcreditEdit').val('');
        $('#AccountEdit').val('');
        document.getElementById("RateTypePackEdit").value = -1;
        $('#ExchangeEdit').val('');
        $('#dateiniteditpacktxt').val('');
        $('#datefinaleditpacktxt').val('');
    }
    
    function clearPack(){
        
        $('#DescriptionPack').val('');
        $('#TecnomenPack').val('');        
        document.getElementById("OptionPack").selectedIndex = "0"; 
        $('#PolicyPack').val('');
        $('#expiryPackHours').val('');
        $('#unitsPack').val('');
        document.getElementById("OptionExpiryDay").selectedIndex = "0";     
    }
    
    function clearService(){
        loadContentPackState();
        loadContentList2();
        $('#DescriptionService').val('');       
        $('#dateinitservicetxt').val('');
        $('#datefinalservicetxt').val('');
    }
    
    function clearAditionalPack(){
        $('#packDesciptionLink2').val('');
        $('#idPackLink2').val('');
        $('#dateiniteditservicetxt').val('');
        $('#datefinaleditservicetxt').val('');
        $("#idRecurrenceEdit").prop("checked", false);
    }
    
   $("#cancelAccount").click(function () {
         clearAccount();
    });
    
   $("#cancelList").click(function () {
         clearList();
    });
    
   $("#cancelProfile").click(function () {
         clearProfile();
    });
        
   $("#cancelChannel").click(function () {
         clearChannel();
    });
    
   $("#cancelServicePack").click(function () {
         clearServicePack();
    });
    
   $("#cancelPack").click(function () {
         clearPack();
    });
    
   $("#cancelService").click(function () {
        clearService();
    });
    
    function formatAMPM(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();
        var ampm = hours >= 12 ? 'pm' : 'am';
        hours = hours % 12;
        hours = hours ? hours : 12; // the hour '0' should be '12'
        minutes = minutes < 10 ? '0'+minutes : minutes;
        seconds = seconds < 10 ? '0'+seconds : seconds;
        var strTime = hours + ':' + minutes + ':' + seconds+ ' ' + ampm;
        return strTime;
}

function getDateInput(stringDate){   
    var dateObjectInit = new Date(stringDate);
    var monthInit = parseInt(dateObjectInit.getMonth()) + 1;
    var stringDateInit = dateObjectInit.getDate() + "/" + monthInit + "/" + dateObjectInit.getFullYear() + " " + formatAMPM(dateObjectInit);
    return stringDateInit;
}

   $("#btnSubmitListProfile").click(function (event) {
            
                    $(this).button('loading').delay(1000).queue(function() {
                            
                    //stop submit the form, we will post it manually.
                    event.preventDefault();

                    // Get form
                    var form = $('#fileUploadFormListProfile')[0];

                    // Create an FormData object 
                    var data = new FormData(form);

                    // If you want to add an extra field for the FormData
                    //data.append("id",$( "#Product" ).val());
                    data.append("id",0);

                    // disabled the submit button
                    $("#btnSubmitListProfile").prop("disabled", true);

                    $.ajax({
                        type: "POST",
                        enctype: 'multipart/form-data',
                        url: "UploadProfile",
                        data: data,
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 600000,
                        success: function (data) {   
                            $("#btnSubmitListProfile").button('reset');
                            $("#btnSubmitListProfile").dequeue();
                            alert('Registros con errores:  '+data.countInvalid);                            
                            $("#btnSubmitListProfile").prop("disabled", false);
                            tablePerfil.clear().draw();
                            tablePerfil.ajax.reload();
                            $("#fileListProfile").val('');
                   
                        },
                        error: function (e) {
                             alert('Error en carga de archivo');
                        }
                    });
               
                     //$(this).dequeue();  
                    }); 
              


            });

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
})




});