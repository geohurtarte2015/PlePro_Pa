
package view.crud;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExecuteSql;
import org.json.JSONObject;
import pojo.Result;

/**
 *
 * @author LENOVO
 */
public class TableUpdate extends HttpServlet {

 
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
        
        String sentence = String.valueOf(request.getParameter("tableParameter"));

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        ExecuteSql executeSql = new ExecuteSql();
        List<String[]> list = executeSql.selectSql(sentence);
        
        int size = list.get(0).length;
        
        JSONObject json = new JSONObject();
        
        for(int x=0;x<size;x++){
            json.put("Data"+x,list.get(0)[x]);
        }
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
