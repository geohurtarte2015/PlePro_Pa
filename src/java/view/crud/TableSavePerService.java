package view.crud;

import model.Auditory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExecuteSql;
import org.json.JSONObject;
import pojo.Result;
import pojo.Terminal;



public class TableSavePerService
  extends HttpServlet
{
  public TableSavePerService() {}
  
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {}
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);    

    String insertPerService = String.valueOf(request.getParameter("insertPerService"));
    String insertPerPrice = String.valueOf(request.getParameter("insertPerPrice"));
    
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    ExecuteSql executeSql = new ExecuteSql();
    Result result1 = executeSql.insertSql(insertPerService);
    Result result2 = executeSql.insertSql(insertPerPrice);    
    
    //auditory  
    Terminal terminal = new Terminal(request,insertPerService,insertPerPrice);
    Auditory auditory = new Auditory();    
    auditory.insertSentence(terminal);
    //finish auditory
    
    
    
    JSONObject json = new JSONObject();
    json.put("codeService", result1.getCodeError());
    json.put("messageService", result1.getMessage());
    json.put("codePrice", result2.getCodeError());
    json.put("messagePrice", result2.getMessage());
    
    response.setContentType("application/json");
    response.getWriter().write(json.toString());
  }
  



  public String getServletInfo()
  {
    return "Short description";
  }
}
