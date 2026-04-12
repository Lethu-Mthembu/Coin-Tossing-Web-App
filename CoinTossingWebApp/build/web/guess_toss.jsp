<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Make Your Guess</title>
        
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            // Read computer name from web.xml context params
            String compName = pageContext.getServletContext().getInitParameter("comp_name");
            // Get player name from session
            String name = (String)session.getAttribute("name");
        %>

        <div class="card">

            
            <div class="coin-wrap">
                <div class="coin">?</div>  <!-- shows ? because toss is hidden -->
            </div>

            
            <h1>Make Your Guess</h1>
            <div class="divider"></div>

            <!-- Instruction text -->
            <p>
                <strong><%= compName %></strong> has tossed the coin, <strong><%= name %></strong>.
                Type <em>Heads</em> or <em>Tails</em> below.
            </p>

            
            <div class="notice">
                💡 Valid guesses are <strong>Heads</strong> or <strong>Tails</strong> only.
            </div>

            <form action="GuessEvaluationServlet.do" method="POST">

                <label for="guess">Your Guess</label>
                <input
                    type="text"
                    id="guess"
                    name="guess"
                    placeholder="Heads or Tails"
                    autocomplete="off"
                    required
                />

                <button type="submit" class="btn">Submit Guess</button>

            </form>

            
            <a href="summary.jsp" class="btn btn-ghost">View Summary</a>
            <a href="EndSessionServlet.do" class="btn btn-ghost">End Session</a>

        </div>

        <div class="footer">Coin Toss Web App</div>
    </body>
</html>
