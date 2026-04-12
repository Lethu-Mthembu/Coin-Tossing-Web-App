<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Summary</title>
        
        <link rel="stylesheet" href="style.css">

        <!-- Extra styles  for the summary page — change widths here -->
        <style>
            /* Summary card is wider to fit the history table */
            .card { max-width: 700px; }  

            
            .history-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                font-size: 0.92rem;
            }
            .history-table th {
                font-size: 0.76rem;
                font-weight: 700;
                letter-spacing: 0.08em;
                text-transform: uppercase;
                color: var(--text-light);
                text-align: left;
                padding: 10px 14px;
                border-bottom: 2px solid var(--border);
            }
            .history-table td {
                padding: 11px 14px;
                border-bottom: 1px solid var(--border);
                color: var(--text-dark);
            }
            /* Alternating row tint — change opacity to adjust intensity */
            .history-table tr:nth-child(even) td {
                background: rgba(0,0,0,0.025);
            }
        </style>
    </head>
    <body>
        <%
            
            String compName = pageContext.getServletContext().getInitParameter("comp_name");
            // Get player name from session
            String name = (String)session.getAttribute("name");
            // Get counters from session 
            Integer cnt = (Integer)session.getAttribute("cnt");
            Integer correctGuessesCnt = (Integer)session.getAttribute("correctGuessesCnt");
            Integer incorrectGuessesCnt = (Integer)session.getAttribute("incorrectGuessesCnt");
            // Get history lists from session
            List<String> tosses = (List<String>)session.getAttribute("tosses");
            List<String> guesses = (List<String>)session.getAttribute("guesses");
            List<String> outcomes = (List<String>)session.getAttribute("outcomes");
        %>

        <div class="card">

            <!-- Page heading -->
            <h1>Game Summary</h1>
            <div class="divider"></div>

            <!-- Intro text -->
            <p>
                Here's how you did, <strong><%= name %></strong>.
                <strong><%= compName %></strong> keeps score.
            </p>

            <!-- Stats boxes — 3 metrics side by side -->
            <!-- change stat-box styles in style.css -->
            <div class="stats-row">
                <div class="stat-box">
                    <div class="stat-num"><%= cnt %></div>
                    <div class="stat-label">Played</div>
                </div>
                <div class="stat-box">
                    <!-- correct number is coloured green — change in style.css --correct -->
                    <div class="stat-num" style="color: var(--correct);"><%= correctGuessesCnt %></div>
                    <div class="stat-label">Correct</div>
                </div>
                <div class="stat-box">
                    <!-- wrong number is coloured red — change in style.css --wrong -->
                    <div class="stat-num" style="color: var(--wrong);"><%= incorrectGuessesCnt %></div>
                    <div class="stat-label">Wrong</div>
                </div>
            </div>

            <!-- Game history table -->
            <table class="history-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Toss</th>
                        <th>Guess</th>
                        <th>Outcome</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Loop through all rounds — change badge styles in style.css
                        for (int i = 0; i < cnt; i++) {
                            String toss = tosses.get(i);
                            String guess = guesses.get(i);
                            String outcome = outcomes.get(i);
                            // badge class based on outcome
                            String badgeClass = outcome.equals("Correct") ? "badge badge-correct" : "badge badge-wrong";
                    %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= toss %></td>
                        <td><%= guess %></td>
                        <td><span class="<%= badgeClass %>"><%= outcome %></span></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <!-- Navigation links -->
            <div class="nav-links" style="margin-top: 32px;">
                <a href="GetTossServlet.do" class="btn">Keep Playing</a>
                <a href="EndSessionServlet.do" class="btn btn-ghost">End Session</a>
            </div>

        </div>

        <div class="footer">Coin Toss Web App</div>
    </body>
</html>
