package za.ac.tut.model.bl;

import javax.ejb.Stateless;


@Stateless
public class CoinManagementSB implements CoinManagementSBLocal {

    @Override
    public String getToss() {
        //declare an array with coin sides
        String[] coinSides = {"Heads", "Tails"};
        //randomly generate the value  0 or 1
        int index = (int)Math.floor(Math.random()*2);
        //return a coin side at the randomly generated index
        return coinSides[index];
    }

    @Override
    public String determineOutcome(String toss, String guess) throws InvalidGuessException {
        if(isGuessValid(guess)){
            if(guess.equalsIgnoreCase(toss)){
                return "Correct";
            } else {
                return "Wrong";
            }
        } else {
            throw new InvalidGuessException(guess + " is invalid.");
        }
    }

    private boolean isGuessValid(String guess) {
        return (guess.compareToIgnoreCase("Heads")==0) || (guess.compareToIgnoreCase("Tails")==0);
    }

}



