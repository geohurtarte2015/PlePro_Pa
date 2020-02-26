
package view.crud;


import clientWebservice.AddPackResponse;
import clientWebservice.PackageCore_Service;
import com.webservice.GetWebservice;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import org.json.JSONObject;
import pojo.CodeErrorWebservice;

/**
 *
 * @author LENOVO
 */
public class GetServiceAddPack extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/172.16.168.143_7006/WS_PLE_BRIDGE_SV/PackageCore.wsdl")
    private PackageCore_Service service;


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
        
        String msisdn = String.valueOf(request.getParameter("msisdn"));
        String keyword = String.valueOf(request.getParameter("keyword"));
        
        AddPackResponse addPackresponse = new AddPackResponse();
        int val = addPackresponse.addPackageCorePle(msisdn, "GUI", keyword, "");
      
        CodeErrorWebservice codeErrorWebservice = new CodeErrorWebservice();
        
        String nameError = (String) codeErrorWebservice.getReponse().get(val);
        
        JSONObject json = new JSONObject();
        json.put("code", val);
        json.put("message", nameError);
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        
  
        
    }
    
    

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

 

}
