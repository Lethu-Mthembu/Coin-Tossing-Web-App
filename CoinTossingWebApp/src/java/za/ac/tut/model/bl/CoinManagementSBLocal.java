package za.ac.tut.model.bl;

import javax.ejb.Local;

/**
 *
 * @author MemaniV
 */
@Local
public interface CoinManagementSBLocal {
    public String getToss();
    public String determineOutcome(String toss, String guess) throws InvalidGuessException;
}


