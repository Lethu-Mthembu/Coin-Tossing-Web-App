<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Toss — Start Session</title>
        
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="card">

            
            <h1>Who Are You?</h1>
            <div class="divider"></div>

           
            <p>Enter your name below to begin your session.</p>

           
            <form action="StartSessionServlet.do" method="POST">

               
                <label for="name">Your Name</label>
                <input
                    type="text"
                    id="name"
                    name="name"
                    placeholder="e.g. Letoo"
                    required
                    autocomplete="off"
                />

                
                <button type="submit" class="btn">Let's Go</button>

            </form>

            
            <a href="index.html" class="btn btn-ghost">← Back to Home</a>

        </div>

        <div class="footer">Coin Toss Web App</div>

        <!-- Simple JS: prevent empty name submission -->
        <script>
            document.querySelector('form').addEventListener('submit', function(e) {
                var name = document.getElementById('name').value.trim();
                if (!name) {
                    e.preventDefault();
                    document.getElementById('name').style.borderColor = '#8c4a3e';
                    document.getElementById('name').focus();
                }
            });
        </script>
    </body>
</html>
