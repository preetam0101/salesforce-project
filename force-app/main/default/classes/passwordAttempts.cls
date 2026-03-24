public class passwordAttempts {
    
    public static String correctPassword = 'mission';
    public static Integer attemptCount = 0;

    public static String enterPassword(String inputPassword){
        
        if(inputPassword != correctPassword){
            attemptCount++;
            return 'failed';
        }
        else{
            return 'success';
        }
    }
}