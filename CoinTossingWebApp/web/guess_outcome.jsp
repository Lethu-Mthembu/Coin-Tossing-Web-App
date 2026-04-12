<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Outcome</title>
        
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
           
            String compName = pageContext.getServletContext().getInitParameter("comp_name");
            
            String name = (String) session.getAttribute("name");
             
            String toss = (String) session.getAttribute("toss");
            
            String guess = (String) request.getAttribute("guess");
            String outcome = (String) request.getAttribute("outcome");

            // Determine badge class based on outcome 
            String badgeClass = outcome.equals("Correct") ? "badge badge-correct" : "badge badge-wrong";

            String coinIcon = toss.equals("Heads") ? "H" : "T";
        %>

        <div class="card">

            <!-- Animated coin showing the actual toss result -->
            <div class="coin-wrap">
                <div class="coin"><%= coinIcon%></div>
            </div>


            <h1>The Result</h1>
            <div class="divider"></div>


            <p>
                Here's how it went, <strong><%= name%></strong>.
            </p>


            <table class="result-table">
                <tr>
                    <td>Toss</td>
                    <td><%= toss%></td>
                </tr>
                <tr>
                    <td>Your Guess</td>
                    <td><%= guess%></td>
                </tr>
                <tr>
                    <td>Outcome</td>
                    <!-- Badge colour changes based on correct/wrong — see style.css -->
                    <td><span class="<%= badgeClass%>"><%= outcome%></span></td>
                </tr>
            </table>

            <!-- Navigation links -->
            <div class="nav-links">

                <a href="GetTossServlet.do" class="btn">Toss Again</a>

                <a href="summary.jsp" class="btn btn-ghost">View Summary</a>

                <a href="EndSessionServlet.do" class="btn btn-ghost">End Session</a>
            </div>

        </div>

        <div class="footer">Coin Toss Web App</div>
    </body>
</html>
