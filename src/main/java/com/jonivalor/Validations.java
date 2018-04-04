package com.jonivalor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;

public abstract class Validations {
	
    public static boolean personValidation(JSONObject person) {
		if(!person.has("dni") || !person.has("name") || !person.has("surname") 
			|| !person.has("birthday") || !person.has("nationality") || !person.has("contact_information")) {
			return false;
		} else {
			JSONObject contactInformation = new JSONObject();
			
			if(!contactInformationValidation(contactInformation)) {
                return false;
            } else {
                return true;
			}
		}
	}
	
	public static boolean contactInformationValidation (JSONObject contactInformation) {
            
		if(!contactInformation.has("mobile_phone") || !contactInformation.has("land_line") || !contactInformation.has("email")
		 || !contactInformation.has("address1") || !contactInformation.has("address2")) {
			return false;
		} else {
			return true;
		}
	}
}
