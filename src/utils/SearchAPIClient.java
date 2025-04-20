package utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

public class SearchAPIClient {
    public static List<Map<String, String>> searchDuckDuckGo(String query) {
        List<Map<String, String>> results = new ArrayList<>();
        try {
            String apiUrl = "https://api.duckduckgo.com/?q=" + java.net.URLEncoder.encode(query, "UTF-8") + "&format=json&no_redirect=1&no_html=1";
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }
            in.close();
            con.disconnect();

            JSONObject json = new JSONObject(content.toString());
            JSONArray relatedTopics = json.getJSONArray("RelatedTopics");
            for (int i = 0; i < relatedTopics.length(); i++) {
                JSONObject topicObj = relatedTopics.getJSONObject(i);
                if (topicObj.has("Text") && topicObj.has("FirstURL")) {
                    Map<String, String> result = new HashMap<>();
                    result.put("title", topicObj.getString("Text"));
                    result.put("url", topicObj.getString("FirstURL"));
                    result.put("snippet", topicObj.getString("Text"));
                    results.add(result);
                } else if (topicObj.has("Topics")) {
                    JSONArray subTopics = topicObj.getJSONArray("Topics");
                    for (int j = 0; j < subTopics.length(); j++) {
                        JSONObject subTopic = subTopics.getJSONObject(j);
                        if (subTopic.has("Text") && subTopic.has("FirstURL")) {
                            Map<String, String> result = new HashMap<>();
                            result.put("title", subTopic.getString("Text"));
                            result.put("url", subTopic.getString("FirstURL"));
                            result.put("snippet", subTopic.getString("Text"));
                            results.add(result);
                        }
                    }
                }
            }
        } catch (Exception e) {
            // Handle error (log or return empty)
        }
        return results;
    }
}
