package za.ac.tut.model.bl;

import javax.ejb.EJBException;

public class InvalidGuessException extends EJBException {
    public InvalidGuessException(String errMsg){
        super(errMsg);
    }
}

