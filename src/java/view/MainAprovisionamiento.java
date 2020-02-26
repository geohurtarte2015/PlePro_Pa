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





public class MainAprovisionamiento
  extends HttpServlet
{
  private Configuration configuration = null;
  public MainAprovisionamiento() {}
  
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
    
    String dateInit = String.valueOf(request.getParameter("dateinit"));
    String dateFinal = String.valueOf(request.getParameter("datefinish"));
    String msisdn = String.valueOf(request.getParameter("msisdn"));
    
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    
    ExecuteSql executeSql = new ExecuteSql(poolOffLineTrx);
    
    List<String[]> listPacksMain = executeSql.selectSql("select a.id_tr_service as id_trx_service,d.channel as channel,f.description_act_comercial as channel_description,a.phone,a.text_keyword as keyword,b.description as status,a.service_id as service,c.description as SERVICE_DESCRIPTION,a.registered_date as registered\n" +
        "from mpm_transaction_service a \n" +
        "inner join sm_catalog.mpm_transaction_result_code b\n" +
        "on a.result_code = b.ID \n" +
        "inner join sm_catalog.mpm_service_pack c\n" +
        "on a.service_id = c.service_id\n" +
        "inner join SM_CATALOG.mpm_service_pack_source d\n" +
        "on a.text_source = d.text_source and a.text_keyword = d.text_keyword\n" +
        "inner join SM_CATALOG.mpm_service_channel f\n" +
        "on d.channel = f.id_channel\n" +
        "where phone=" + msisdn + " and registered_date between TO_DATE('" + dateInit + "','DD-MM-YYYY HH:MI:SS PM') and TO_DATE('" + dateFinal + "','DD-MM-YYYY HH:MI:SS PM')\n" +
        "order by id_tr_service desc");

    








    GetJson getJson = new GetJson();
    
    String json = getJson.getJsonDataTable(listPacksMain);
    out.print(json);
  }
  



  public String getServletInfo()
  {
    return "Short description";
  }
}
