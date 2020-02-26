/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view.crud;

import clientWebservice.AddPackResponse;
import clientWebservice.AddSubscriberHubClaro;
import clientWebservice.RepuestaInvokeParams;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import pojo.CodeErrorWebservice;

/**
 *
 * @author LENOVO
 */
public class GetServiceAddSubscriberHubClaro extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RepuestaInvokeParams responseParams = null;
        String phone = String.valueOf(request.getParameter("msisdn"));
        String email = String.valueOf(request.getParameter("email"));
        String name = String.valueOf(request.getParameter("name"));
        String lastName = String.valueOf(request.getParameter("lastName"));
        String channel = String.valueOf(request.getParameter("OptionChannel"));
        String codeArea = "502";
        String productId = String.valueOf(request.getParameter("OptionProduct"));
        
        
        
        AddSubscriberHubClaro addSubscriberHubClaro = new AddSubscriberHubClaro();
        
        clientWebservice.GuiParameter parameters = new clientWebservice.GuiParameter();
        parameters.setName(name);
        parameters.setLastName(lastName);
        parameters.setChannel(Integer.parseInt(channel));
        parameters.setCodeArea(codeArea);
        parameters.setEmail(email);
        parameters.setProductId(productId);


      
    
   
         responseParams = addSubscriberHubClaro.guiSuscriberVideo(phone, parameters);
        
        //AddPackResponse addPackresponse = new AddPackResponse();
        //int val = addPackresponse.addPackageCorePle(msisdn, "GUI", keyword, "");
      
    
        
        JSONObject json = new JSONObject();
        json.put("code", responseParams.getStatus());
        json.put("message", String.valueOf(responseParams.getDescription()));
        json.put("type", responseParams.getTipo());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
