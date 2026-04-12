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


public class GetTossServlet extends HttpServlet {
    //inject a reference --> ask the container to get a refrence for you
    @EJB CoinManagementSBLocal cl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //keep session alive
        HttpSession session = request.getSession();
        //get toss
        String toss = cl.getToss();
        //update the session
        updateSession(session, toss);
        //go to a JSP
        RequestDispatcher disp = request.getRequestDispatcher("guess_toss.jsp");
        disp.forward(request, response);        
    }

    private void updateSession(HttpSession session, String toss) {
        //store the toss in the session
        session.setAttribute("toss", toss);
    }
}

