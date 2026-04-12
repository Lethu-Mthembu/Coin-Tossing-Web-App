# 🪙 Coin Toss Web App

A Java EE web application where players guess the outcome of a coin toss. Built with Servlets, EJBs, JSP, and a custom semi-formal frontend using CSS and vanilla JavaScript.
---

## 📸 Overview

The player enters their name, then repeatedly guesses whether a coin lands on **Heads** or **Tails**. The app tracks correct and incorrect guesses across the session and displays a full game history in the summary page.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Backend | Java EE, Servlets, EJB (Stateless Session Bean) |
| Frontend | JSP, HTML5, CSS3, Vanilla JavaScript |
| Server | GlassFish 4+ |
| Build Tool | Apache Ant (NetBeans) |
| Session Management | `HttpSession` |

---

## 📁 Project Structure

```
CoinTossingWebApp/
├── src/
│   └── java/
│       └── za/ac/tut/
│           ├── model/
│           │   └── bl/
│           │       ├── CoinManagementSB.java        # EJB — coin toss logic
│           │       ├── CoinManagementSBLocal.java   # EJB local interface
│           │       └── InvalidGuessException.java   # Custom exception
│           └── web/
│               ├── StartSessionServlet.java         # Initialises the session
│               ├── GetTossServlet.java              # Generates a coin toss
│               ├── GuessEvaluationServlet.java      # Evaluates the player's guess
│               └── EndSessionServlet.java           # Invalidates the session
├── web/
│   ├── WEB-INF/
│   │   └── web.xml                                 # Servlet mappings & error pages
│   ├── style.css                                   # Shared stylesheet (all colours/fonts here)
│   ├── index.html                                  # Welcome / landing page
│   ├── start_session.jsp                           # Name entry form
│   ├── start_game.jsp                              # Greeting page
│   ├── guess_toss.jsp                              # Guess input page
│   ├── guess_outcome.jsp                           # Round result page
│   ├── summary.jsp                                 # Full game history & stats
│   ├── invalid_guess.jsp                           # Error page for invalid input
│   └── file_not_found.jsp                          # 404 error page
```

---

## 🔁 Application Flow

```
index.html
    ↓
start_session.jsp  →  StartSessionServlet  →  start_game.jsp
                                                    ↓
                              GetTossServlet  ←  [Toss Again]
                                    ↓
                             guess_toss.jsp
                                    ↓
                         GuessEvaluationServlet
                            ↓               ↓
                    guess_outcome.jsp   invalid_guess.jsp
                            ↓
                       summary.jsp
                            ↓
                    EndSessionServlet  →  index.html
```

---

## ⚙️ Session Data

The following attributes are stored in the `HttpSession` throughout the game:

| Attribute | Type | Description |
|---|---|---|
| `name` | `String` | Player's name |
| `toss` | `String` | Current coin toss result |
| `cnt` | `Integer` | Total rounds played |
| `correctGuessesCnt` | `Integer` | Number of correct guesses |
| `incorrectGuessesCnt` | `Integer` | Number of incorrect guesses |
| `tosses` | `List<String>` | History of all toss results |
| `guesses` | `List<String>` | History of all player guesses |
| `outcomes` | `List<String>` | History of all outcomes |

---

## 🚨 Error Handling

Errors are handled via `web.xml` mappings:

| Error | Handler |
|---|---|
| `404 Not Found` | `file_not_found.jsp` |
| `InvalidGuessException` | `invalid_guess.jsp` |

`InvalidGuessException` is thrown by `CoinManagementSB` when the player submits anything other than `Heads` or `Tails` (case-insensitive).

---

## 🎨 Customisation

All visual customisation is done in `style.css`. The CSS variables at the top of the file control everything:

```css
:root {
    --bg:           #f2ede8;   /* page background */
    --surface:      #e8e1d9;   /* card background */
    --accent:       #6b7c6e;   /* button / highlight colour */
    --correct:      #5a7a5c;   /* correct guess colour */
    --wrong:        #8c4a3e;   /* wrong guess colour */
    --font-head:    'Playfair Display', serif;
    --font-body:    'Lato', sans-serif;
}
```

To change the computer's name, update `web.xml`:

```xml
<context-param>
    <param-name>comp_name</param-name>
    <param-value>Siri</param-value>  <!-- change this -->
</context-param>
```

---

## 🚀 Running the App

1. Open the project in **NetBeans**
2. Make sure **GlassFish Server** is configured
3. Right-click the project → **Clean and Build**
4. Right-click the project → **Run**
5. Navigate to `http://localhost:8080/CoinTossingWebApp/`

---

## 📝 Notes

- Session timeout is set to **30 minutes** in `web.xml`
- Guesses are **case-insensitive** — `heads`, `HEADS`, and `Heads` are all valid
- The computer name (`Siri` by default) is configured as a context parameter in `web.xml` and can be changed without touching any Java code
