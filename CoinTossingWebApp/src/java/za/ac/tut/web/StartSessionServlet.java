package za.ac.tut.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class StartSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //start the session
        HttpSession session = request.getSession(true);
        //get user name
        String name = request.getParameter("name");
        //initialize session
        initializeSession(session, name);
        //go to a JSP
        RequestDispatcher disp = request.getRequestDispatcher("start_game.jsp");
        disp.forward(request, response);
    }

    private void initializeSession(HttpSession session, String name) {
        //declare variables
        Integer cnt = 0, correctGuessesCnt = 0, incorrectGuessesCnt = 0;
        List<String> guesses = new ArrayList<>();
        List<String> tosses = new ArrayList<>();
        List<String> outcomes = new ArrayList<>();
        //store variables in a session
        session.setAttribute("name", name);
        session.setAttribute("cnt", cnt);
        session.setAttribute("correctGuessesCnt", correctGuessesCnt);
        session.setAttribute("incorrectGuessesCnt", incorrectGuessesCnt);
        session.setAttribute("guesses", guesses);
        session.setAttribute("tosses", tosses);
        session.setAttribute("outcomes", outcomes);
    }

}
