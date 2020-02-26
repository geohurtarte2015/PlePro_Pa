
package model;

import model.ExecuteSql;
import pojo.Result;
import pojo.Terminal;


public class Auditory {
    
    public void insertSentence(Terminal terminal){
            String audity = terminal.getAction();
            String sentence = terminal.getSetnenceSql();
            String audityNew = sentence.replace("\'","\"");
            String sentenceAudity = "insert into mpm_history_update(id,ip,query,user_ple,description,date_ple)"
            + " values (sm_program.seq_history_ple.nextval,'"+terminal.getIp()+"','"+audityNew+"','"+terminal.getName()+"_"+terminal.getLastName()+"','"+audity+"',sysdate)";
            ExecuteSql executeSqlAudity = new ExecuteSql();
            Result audityResult = executeSqlAudity.insertSql(sentenceAudity);   
    }
    
}
