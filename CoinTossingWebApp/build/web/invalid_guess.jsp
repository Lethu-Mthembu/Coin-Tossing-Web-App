<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Invalid Guess</title>
       
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="card">

            <!-- Error icon -->
            <div class="coin-wrap">
                <!-- icon here — ✕ represents an invalid input -->
                <div class="coin" style="color: var(--wrong); border-color: var(--wrong);">✕</div>
            </div>

            
            <h1>Invalid Guess</h1>
            <div class="divider"></div>

            
            <div class="notice">
                Your guess was not valid. Only <strong>Heads</strong> or <strong>Tails</strong> are accepted.
            </div>

            <p>Please try again with a valid guess.</p>

            <!-- Try again button  -->
            <a href="guess_toss.jsp" class="btn">Try Again</a>

            
            <a href="EndSessionServlet.do" class="btn btn-ghost">End Session</a>

        </div>

        <div class="footer">Coin Toss Web App</div>
    </body>
</html>
