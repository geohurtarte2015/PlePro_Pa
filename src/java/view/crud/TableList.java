package view.crud;

import controller.GetJson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExecuteSql;




public class TableList
  extends HttpServlet
{
  public TableList() {}
  
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
    

    String id = String.valueOf(request.getParameter("id"));
    String sentence = String.valueOf(request.getParameter("tableParameter"));
    
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    
    ExecuteSql executeSql = new ExecuteSql();
    
    List<String[]> list = executeSql.selectSql(sentence);
    
    GetJson getJson = new GetJson();
    
    String json = getJson.getJsonDataTable(list);
    
    out.print(json);
  }
  

  public String getServletInfo()
  {
    return "Short description";
  }
}
