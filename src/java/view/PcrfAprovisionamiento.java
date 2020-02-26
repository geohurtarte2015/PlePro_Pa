package view;

import configuration.Configuration;
import controller.GetJson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExecuteSql;






public class PcrfAprovisionamiento
  extends HttpServlet
{
  private Configuration configuration = null;
  public PcrfAprovisionamiento() {}
  
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType("text/html;charset=UTF-8");
  }
  


  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
    
    configuration = new Configuration();
    String poolOffLineTrx = configuration.getPoolOffLineTrx();
    

    String id = String.valueOf(request.getParameter("id"));
    String msisdn = String.valueOf(request.getParameter("msisdn"));
    
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    
    ExecuteSql executeSql = new ExecuteSql(poolOffLineTrx);
    






    List<String[]> listPacksDetails = executeSql.selectSql("select id_tr_service,phone,slot,name_pack,date_alert50,date_alert80,date_alert100,date_registered\nfrom mpm_transaction_slots \nwhere id_tr_service=" + id + " and phone="+msisdn+" order by 1 desc\n");
    



    GetJson getJson = new GetJson();
    
    String json = getJson.getJsonDataTable(listPacksDetails);
    
    out.print(json);
  }
  


  public String getServletInfo()
  {
    return "Short description";
  }
}
