<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Welcome</title>
        
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
           
            String compName = pageContext.getServletContext().getInitParameter("comp_name");
            
            String name = (String)session.getAttribute("name");
        %>

        <div class="card">

            <!-- Animated coin -->
            <div class="coin-wrap">
                <div class="coin">⊙</div>
            </div>

            
            <h1>Hello, <%= name %>!</h1>
            <div class="divider"></div>

            
            <p>
                My name is <strong><%= compName %></strong>, your playing companion for today.
                I'll toss a coin and you guess whether it lands on Heads or Tails.
                Think you can beat me?
            </p>

           
            <a href="GetTossServlet.do" class="btn">Toss the Coin</a>

            
            <a href="EndSessionServlet.do" class="btn btn-ghost">End Session</a>

        </div>

        <div class="footer">Coin Toss Web App</div>
    </body>
</html>
