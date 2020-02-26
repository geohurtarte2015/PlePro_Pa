package view.crud;

import model.Auditory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ExecuteSql;
import org.json.JSONObject;
import pojo.Result;
import pojo.Terminal;



public class TableDelete
  extends HttpServlet
{
  public TableDelete() {}
  
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
    
   
    
    String id = String.valueOf(request.getParameter("id"));
    String sentence = String.valueOf(request.getParameter("tableParameter"));

        
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    ExecuteSql executeSql = new ExecuteSql();
    Result result = executeSql.deleteSql(sentence);
    
     //auditory  
    Terminal terminal = new Terminal(request);
    Auditory auditory = new Auditory();    
    auditory.insertSentence(terminal);
    //finish auditory

    
    JSONObject json = new JSONObject();
    json.put("code", result.getCodeError());
    json.put("message", result.getMessage());
    response.setContentType("application/json");
    response.getWriter().write(json.toString());
  }
  

  public String getServletInfo()
  {
    return "Short description";
  }
}
