package za.ac.tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.model.bl.CoinManagementSBLocal;


public class GuessEvaluationServlet extends HttpServlet {
    //reference injection
    @EJB CoinManagementSBLocal cl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //keep session alive
        HttpSession session = request.getSession();
        //get guess
        String guess = request.getParameter("guess");
        //get toss from the session
        String toss = (String)session.getAttribute("toss");
        //determine outcome
        String outcome = cl.determineOutcome(toss, guess);
        //update session
        updateSession(session, toss, guess, outcome);
        //attach the guess and the outcome to the request
        request.setAttribute("guess",guess);
        request.setAttribute("outcome",outcome);
        //go to the JSP
        RequestDispatcher disp = request.getRequestDispatcher("guess_outcome.jsp");
        disp.forward(request, response);         
    }

    private void updateSession(HttpSession session, String toss, String guess, String outcome) {
        //get the counters from the session
        Integer cnt = (Integer)session.getAttribute("cnt");
        Integer correctGuessesCnt = (Integer)session.getAttribute("correctGuessesCnt");
        Integer incorrectGuessesCnt = (Integer)session.getAttribute("incorrectGuessesCnt");
        List<String> outcomes = (List<String>)session.getAttribute("outcomes");
        List<String> guesses = (List<String>)session.getAttribute("guesses");
        List<String> tosses = (List<String>)session.getAttribute("tosses");
        //add outcome and guess to their respective lists
        outcomes.add(outcome);
        guesses.add(guess);
        tosses.add(toss);
        //store the list of tosses in the session
        session.setAttribute("tosses", tosses);
        session.setAttribute("guesses", guesses);
        session.setAttribute("outcomes", outcomes);
        //check the outcome
        if(outcome.equals("Correct")){
            //update the number of correct guesses
            correctGuessesCnt++;
        } else {
            //updaate the number of incorret guesses
            incorrectGuessesCnt++;
        }
        //update the counter tracking the number of games played
        cnt++;        
        //store the data on the session
        session.setAttribute("cnt", cnt);
        session.setAttribute("correctGuessesCnt", correctGuessesCnt);
        session.setAttribute("incorrectGuessesCnt", incorrectGuessesCnt);     
    }

}

