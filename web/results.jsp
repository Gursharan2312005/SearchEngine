<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map" %>
<%
    String query = (String) request.getAttribute("query");
    List<Map<String, String>> results = (List<Map<String, String>>) request.getAttribute("results");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dragos Search - Results for <%= query != null ? query : "" %></title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body class="dark-theme">
    <div class="container glassmorphism">
        <h1 class="neon-glow">Dragos Search Results for "<%= query %>"</h1>
        <a href="index.jsp" class="search-btn back-btn">← Back</a>
        <div class="results-grid">
            <% if (results != null && !results.isEmpty()) { %>
                <% for (Map<String, String> result : results) { %>
                    <div class="result-card">
                        <a href="<%= result.get("url") %>" target="_blank" class="result-title neon-glow">
                            <%= result.get("title") %>
                        </a>
                        <p class="result-snippet"><%= result.get("snippet") %></p>
                        <a href="<%= result.get("url") %>" target="_blank" class="result-link">Visit ↗</a>
                    </div>
                <% } %>
            <% } else { %>
                <div class="no-results">No results found. Try a different query!</div>
            <% } %>
        </div>
        <div class="contact-info">
            <p>Contact Developer:</p>
            <p>📱 Phone: 7650076914</p>
            <p>📧 Email: gursharansinghsood2005@gmail.com</p>
            <p>📸 Instagram: gursharansinghsood</p>
        </div>
    </div>
    <script src="js/animations.js"></script>
</body>
</html>
