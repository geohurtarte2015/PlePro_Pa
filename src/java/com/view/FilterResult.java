
package com.view;

import com.model.DaoObject;
import com.model.DriverConnection;
import controller.GetJson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FilterResult extends HttpServlet {
    
    DriverConnection driver =null;


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
        
        
        String dateInit = "";
        String dateFinish = "";
        String focalizado = "";
        String status = "";
        String marcacion = "";
        String sentence="";
        String marcacionOption=
        
        dateInit = String.valueOf(request.getParameter("dateinit"));
        dateFinish = String.valueOf(request.getParameter("datefinish"));
        focalizado = String.valueOf(request.getParameter("focus"));
        status = String.valueOf(request.getParameter("status"));
        marcacion = String.valueOf(request.getParameter("dial"));
        marcacionOption = String.valueOf(request.getParameter("dialOption"));
        
          
        
        String focusSql = "focalizado = "+focalizado+" and";
        String statusSql = "status = '"+status+"' and";
        String statusSql2 = "status = '"+status+"'";
      
        
        if(Integer.parseInt(focalizado)==0){focusSql="";}
        
        if(status.equals("0")){statusSql="";statusSql2="";}
 
                  
        
        if(dateInit.trim().isEmpty() || dateFinish.trim().isEmpty()){  
            
            if(statusSql2.isEmpty()){focusSql = "focalizado = "+focalizado;}
            sentence = "select * from pos_catalog.tb_pos_phone_focalizado where\n"
                    + focusSql + " \n"
                    + statusSql2 ;
              
        }else{            
            sentence = "select * from pos_catalog.tb_pos_phone_focalizado where\n"
                    + focusSql + " \n"
                    + statusSql + " \n"
                    + "end_date between to_date('" + dateInit + "','DD-MM-YYYY HH:MI:SS PM') \n"
                    + "and to_date('" + dateFinish + "','DD-MM-YYYY HH:MI:SS PM')";        
            }
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        DaoObject daoObject = new DaoObject();
        List<String[]> list = daoObject.selectSql(sentence);
        
        GetJson getJson = new GetJson();

        String json = getJson.getJsonDataTable(list);

        out.print(json);
        
     
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
