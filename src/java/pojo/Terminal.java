
package pojo;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;


public class Terminal {
    
    private static String ip;
    private static String name;
    private static String lastName;
    private static String setnenceSql;
    private static String action;
         
    
    public Terminal(HttpServletRequest request){
        HttpSession mySession = request.getSession();
        setnenceSql = String.valueOf(request.getParameter("tableParameter"));
        action = String.valueOf(request.getParameter("auditory"));
        ip = request.getRemoteAddr();
        name = (String) mySession.getAttribute("nombre");
        lastName = (String) mySession.getAttribute("apellido");
    }
    
     public Terminal(HttpServletRequest request,String sentence1,String sentence2){
        HttpSession mySession = request.getSession();
        setnenceSql = sentence1+"|"+sentence2;
        action = String.valueOf(request.getParameter("auditory"));
        ip = request.getRemoteAddr();
        name = (String) mySession.getAttribute("nombre");
        lastName = (String) mySession.getAttribute("apellido");
    }


 
    public String getSetnenceSql() {
        return setnenceSql;
    }

    public String getAction() {
        return action;
    }  


    public String getIp() {
        return ip;
    }

    
    public String getName() {
        return name;
    }

   
    public String getLastName() {
        return lastName;
    }
    
   
    
    
    
    
    
}
