package lesson1;

public class Student {

    private String am;
    private String firstName;
    private String lastName;

    /**
     * Constructor
     * 
     * @param am
     * @param firstName
     * @param lastName
     */
    public Student(String am, String firstName, String lastName) {
        this.am = am;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    /* Setterd & Getters */
 
    public void setAm(String am) {
        this.am = am;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAm() {
        return am;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
}
