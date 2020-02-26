
package clientWebservice;


public class AddSubscriberHubClaro {

    public RepuestaInvokeParams guiSuscriberVideo(java.lang.String phone, clientWebservice.GuiParameter parameters) {
        clientWebservice.HubClaroVideo service = new clientWebservice.HubClaroVideo();
        clientWebservice.SprCore port = service.getSprCorePort();
        return port.guiSuscriberVideo(phone, parameters);
    }

   
    


    
    
    
}
