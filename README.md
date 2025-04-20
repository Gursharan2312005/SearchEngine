# Futuristic Search Engine

A Java-based web application using Servlets and JSP to fetch live search results from DuckDuckGo. Features a dark, futuristic UI with glassmorphism, neon-glow effects, and smooth animations.

## Prerequisites
- Java 8 or higher
- Apache Tomcat 8.5+ (or compatible)
- Apache Maven 3.x

## 1. Install Maven on Windows

1. Download Maven:
   - Go to https://maven.apache.org/download.cgi
   - Download the **Binary zip archive** (e.g., `apache-maven-3.9.6-bin.zip`).
2. Extract ZIP:
   - Right-click and **Extract All...** to `C:\apache-maven-3.9.6`.
3. Add to PATH:
   - Open **System Properties** > **Environment Variables**.
   - Under **System variables**, select `Path` > **Edit...** > **New**.
   - Paste `C:\apache-maven-3.9.6\bin`.
   - Click **OK** to save.
4. Verify:
   - Open a new Command Prompt.
   - Run:
     ```shell
     mvn -version
     ```
   - You should see Maven version output.

## 2. Build the Project

In the project root (`e:/Search Engine`):

```shell
mvn clean package
```

- Generates `target/SearchEngine.war`.

## 3. Deploy to Tomcat

1. Copy `target/SearchEngine.war` to Tomcat's `webapps` folder.
2. Start Tomcat (`bin/startup.bat`).
3. Open browser at:
   ```
   http://localhost:8080/SearchEngine/
   ```

## 4. Usage

- On the home page, enter a query and submit.
- View live results with futuristic UI.

## 5. Troubleshooting

- **`mvn` not recognized**: Ensure PATH is set and you opened a new terminal.
- **Compilation errors**: Verify `org.json` dependency in `pom.xml`.
- **Servlet errors**: Check `WEB-INF/web.xml` and Tomcat logs.

---

Feel free to customize or extend this README as needed.
