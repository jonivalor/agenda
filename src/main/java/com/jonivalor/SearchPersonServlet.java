package com.jonivalor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import org.json.*;

@WebServlet("/agenda/search/person")
public class SearchPersonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		response.setContentType("application/json; charset=UTF-8");

		PGConnector pgConnector = new PGConnector ("127.0.0.1" , "agenda") ;

		JSONObject surname = new JSONObject(request.getParameter("surname"));

    if(!surname.has("surname")) {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
		try {
			String queryString = "SELECT webapi_person_search_by_surname ('" + surname.toString() + "')";

			pgConnector.execute("jvalor", "jvalor1234", queryString);

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
