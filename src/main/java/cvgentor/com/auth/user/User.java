package cvgentor.com.auth.user;

public class User {

    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String address;
    private String telNo;
    private String age;
    private String gender;
    private Role role;

    public enum Gender {
        MALE, FEMALE, OTHER
    }

}
