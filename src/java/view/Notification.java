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


public class Notification
  extends HttpServlet
{
  private static Configuration configuration =null;   
  public Notification() 
  {
          if(configuration==null){      
          configuration = new Configuration();          
      }  
  }
  
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
    
    String dateInit = String.valueOf(request.getParameter("dateinit"));
    String dateFinal = String.valueOf(request.getParameter("datefinish"));
    String msisdn = String.valueOf(request.getParameter("msisdn"));
    
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    
    String poolOfflineTrx = configuration.getPoolOffLineTrx();
    ExecuteSql executeSql = new ExecuteSql(poolOfflineTrx);

    
    List<String[]> listPacksMain = executeSql.selectSql("select source,message,status,date_registered \nfrom tb_sms_notification\nwhere phone=" + msisdn + " and date_registered between  TO_DATE('" + dateInit + "','DD-MM-YYYY HH:MI:SS PM') and TO_DATE('" + dateFinal + "','DD-MM-YYYY HH:MI:SS PM')");
    


    GetJson getJson = new GetJson();
    
    String json = getJson.getJsonDataTable(listPacksMain);
    out.print(json);
  }
  



  public String getServletInfo()
  {
    return "Short description";
  }
}
