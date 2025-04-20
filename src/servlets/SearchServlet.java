package servlets;

import utils.SearchAPIClient;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("q");
        if (query != null && !query.trim().isEmpty()) {
            List<Map<String, String>> results = SearchAPIClient.searchDuckDuckGo(query);
            request.setAttribute("results", results);
            request.setAttribute("query", query);
        }
        request.getRequestDispatcher("/results.jsp").forward(request, response);
    }
}
