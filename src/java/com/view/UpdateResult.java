/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.view;

import com.model.DaoObject;
import com.model.DriverConnection;
import com.webservice.GetWebservice;
import configuration.Configuration;
import controller.GetJson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Auditory;
import model.ExecuteSql;
import org.json.JSONObject;
import pojo.Result;
import pojo.Terminal;
import pojo.Result;

/**
 *
 * @author LENOVO
 */
public class UpdateResult extends HttpServlet {
    
   private Configuration configuration=null;
   DriverConnection driver =null;

   public UpdateResult(){
              if(configuration==null){
            configuration = new Configuration();
        }
        
   
   
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
         
        
      
        String dateFinish = "";
        String focalizado = "";
        String status = "";
        String sentence="";
        String data="";
        String focalizadoTxt="";
       String marcacion="0";
 
       String [] arraySentences = null;
       
         //Response webservice and parse response
           GetWebservice webservice = new GetWebservice();
           String responseWebservice = webservice.doPost(configuration.getUrlPos1());  
           String responseWebservice2 = webservice.doPost(configuration.getUrlPos2());  
           String[] parseResponse = responseWebservice.replaceAll("\\<.*?>"," ").trim().split(" ");
           String[] parseResponse2 = responseWebservice2.replaceAll("\\<.*?>"," ").trim().split(" ");
           String responseHttp = parseResponse[0];
           String responseHttp2 = parseResponse2[0];
       
    
        dateFinish = String.valueOf(request.getParameter("datefinish"));
        focalizado = String.valueOf(request.getParameter("focus"));
        focalizadoTxt = String.valueOf(request.getParameter("focusTxt"));
        status = String.valueOf(request.getParameter("status"));
        data =  request.getParameter("dataJson");
        
        
        //valores focalizado y marcacion
        if(Integer.parseInt(focalizado)!=0){
        String[] valFocalizado = focalizadoTxt.split("\\|"); 
        marcacion=valFocalizado[2];
         }
        
        
        //crea un arrayList del resultado
        ArrayList<String []> result = new  ArrayList<>();        
        String dataRecive = data.replace("[","");
        String dataRecive2 = dataRecive.replace("\"","");
        String[] array = dataRecive2.split("]");    
        int sizeArray = array.length;        
        for(int i=0;i<sizeArray;i++){
             result.add(array[i].split(","));
        }
        
      

        int size = result.size();
        
        arraySentences = new String[size];
        
        for(int i=0;i<size;i++){
            String id = result.get(i)[0];
            
            
            
            
        
        
        
        //armado sentencias de variables condicionales  
        String dialSql = "marcacion = "+marcacion+",";
        String focusSql = "focalizado = "+focalizado+",";
        String statusSql = "status = '"+status+"'";
        
        String dialSql2 = ",marcacion = "+marcacion;
        String focusSql2 = ",focalizado = "+focalizado;
        String statusSql2 = ",status = '"+status+"'";
        
        //en caso no se cumpla diferentes escenarios condicionales para formar la sentencia sql
        if ((status.equals("0"))) {
             focusSql = "focalizado = " + focalizado + ",";
             dialSql = "marcacion = " + marcacion ;
             statusSql="";
                if (focalizado.equals("0")) {
                    dialSql = "marcacion = " + marcacion;
                }
        }

        
        //vaciar variables condicionales que no se usaran, por ser parametros vacios 
        if(Integer.parseInt(focalizado)==0){focusSql="";}
        if(Integer.parseInt(marcacion)==0){dialSql="";}
        
        if(Integer.parseInt(focalizado)==0){focusSql2="";}
        if(Integer.parseInt(marcacion)==0){dialSql2="";}
        if(status.equals("0")){statusSql2="";}
             
        
        if(dateFinish.trim().isEmpty()){  
            sentence = "update pos_catalog.tb_pos_phone_focalizado set \n"
                    + focusSql + " \n"
                    + dialSql + " \n"
                    + statusSql + " \n"
                    + "where id="+id;
              
        }else{            
            sentence = "update pos_catalog.tb_pos_phone_focalizado set end_date=to_date('"+dateFinish+"','DD-MM-YYYY HH:MI:SS PM')\n"
                       + focusSql2 + " \n"
                       + dialSql2 + " \n"
                       + statusSql2 + " \n"
                       + "where id="+id;       
            }
        
        
            arraySentences[i]=sentence;
        }
        
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        DaoObject daoObject = new DaoObject();
           


        Result responseUpdate = daoObject.insertSql(arraySentences);
    
    
    //auditory  
    //Terminal terminal = new Terminal(request);
    //Auditory auditory = new Auditory();    
    //auditory.insertSentence(terminal);
    //finish auditory
        
        JSONObject json = new JSONObject();
        json.put("code", responseUpdate.getCodeError());
        json.put("message", responseUpdate.getMessage());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        
     
        
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
