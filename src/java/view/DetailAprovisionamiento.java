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





public class DetailAprovisionamiento
  extends HttpServlet
{
  private Configuration configuration = null;
  public DetailAprovisionamiento() {}
  
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
    


    List<String[]> listPacksDetails = executeSql.selectSql("select a.id_tr_service, a.phone,c.description,a.result_code as code_status,d.description as status,a.result_code_ws,a.registered_date\nfrom mpm_transaction_packs a\ninner join sm_catalog.mpm_products_per_service b\non a.product_service_id = b.id\ninner join sm_catalog.mpm_config_pack c\non b.pack = c.id_pack\ninner join sm_catalog.mpm_transaction_result_code d\non a.result_code=d.ID \nwhere id_tr_service=" + id + "\nand phone="+msisdn+" order by id_tr_service desc");
    









    GetJson getJson = new GetJson();
    
    String json = getJson.getJsonDataTable(listPacksDetails);
    
    out.print(json);
  }
  


  public String getServletInfo()
  {
    return "Short description";
  }
}
