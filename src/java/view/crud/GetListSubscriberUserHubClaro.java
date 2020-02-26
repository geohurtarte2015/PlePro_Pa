/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view.crud;

import com.pojo.Response;
import com.pojo.ResultQueryUserResponse;
import com.webservice.RequestJson;
import controller.GetJson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExecuteSql;

/**
 *
 * @author LENOVO
 */
public class GetListSubscriberUserHubClaro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        
        String msisdn="";
        String email="";
            
        String valor = String.valueOf(request.getParameter("valor"));
        String option = String.valueOf(request.getParameter("option"));
        
        if (option.contains("0")){
            msisdn=valor;
        }else{
            email=valor;
        }
        
        
    
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
          RequestJson requestJson = new RequestJson();
        ResultQueryUserResponse responseQueryUserResponse = new ResultQueryUserResponse();

        
        responseQueryUserResponse = requestJson.queryUserOtt("http://172.16.68.235:8312/hubOTT/internal/rest/queryUserOTT", "GT", "AMCOOTT_GT", email, msisdn);
        
        String description = responseQueryUserResponse.getResponse().getDescription();
        int code = responseQueryUserResponse.getResponse().getCode();
        ArrayList<String[]> responseList = responseQueryUserResponse.getUserResponse();

    
    GetJson getJson = new GetJson();
    
    String json = getJson.getJsonDataTable(responseList);
    
    out.print(json);
        

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
