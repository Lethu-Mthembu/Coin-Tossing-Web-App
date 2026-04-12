<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Page Not Found</title>
        
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="card">

            <!-- 404 icon -->
            <div class="coin-wrap">
                <!-- change icon here -->
                <div class="coin" style="color: var(--text-light); font-size: 1rem;">404</div>
            </div>

            <!-- Page heading -->
            <h1>Page Not Found</h1>
            <div class="divider"></div>

            <!-- Error notice -->
            <div class="notice">
                The page you were looking for could not be found.
            </div>

            <p>You may have followed a broken link or your session may have expired.</p>

            <!-- Logout button  -->
            <a href="EndSessionServlet.do" class="btn">Back to Home</a>

        </div>

        <div class="footer">Coin Toss Web App</div>
    </body>
</html>
