/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientWebservice;

/**
 *
 * @author LENOVO
 */
public class AddPackResponse {

    public int addPackageCorePle(java.lang.String phone, java.lang.String source, java.lang.String keyword, java.lang.String parameters) {
        clientWebservice.PackageCore_Service service = new clientWebservice.PackageCore_Service();
        clientWebservice.PackageCore port = service.getPackageCorePort();
        return port.addPackageCorePle(phone, source, keyword, parameters);
    }
    
}
