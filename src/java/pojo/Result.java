package pojo;

import java.util.ArrayList;

public class Result
{
  private String codeError;
  private String message;
  private ArrayList<String[]> data;
  
  public Result() {}
  
  public String getCodeError()
  {
    return codeError;
  }
  
  public void setCodeError(String codeError)
  {
    this.codeError = codeError;
    int code = Integer.valueOf(codeError).intValue();
    
    switch (code) {
    case 2292: 
      message = "Registration cannot be deleted, because it has dependents.";
      break;
    case 1002: 
      message = "Succefull";
    }
  }
  
  public String getMessage()
  {
    return message;
  }
  
  public void setMessage(String message)
  {
    this.message = message;
  }
  
  public ArrayList<String[]> getData()
  {
    return data;
  }
  
  public void setData(ArrayList<String[]> data)
  {
    this.data = data;
  }
}
