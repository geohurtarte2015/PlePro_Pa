package view.crud;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExecuteSql;
import org.json.JSONArray;
import org.json.JSONObject;



public class GetOptionList
  extends HttpServlet
{
  public GetOptionList() {}
  
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
    
    String sentence = String.valueOf(request.getParameter("tableParameter"));
    
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    
    ExecuteSql executeSql = new ExecuteSql();
    
    List<String[]> list = executeSql.selectSql(sentence);
    int size = list.size();
    
    JSONArray jsonArray = new JSONArray();
    for (int x = 0; x < size; x++) {
      JSONObject json = new JSONObject();
      String[] mainPack = (String[])list.get(x);
      json.put(mainPack[0], mainPack[1]);
      jsonArray.put(json);
    }
    response.setContentType("application/json");
    response.getWriter().write(jsonArray.toString());
  }
  

  public String getServletInfo()
  {
    return "Short description";
  }
}
