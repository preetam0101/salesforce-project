@isTest
public class passwordAttemptsTest {

    @isTest
    static void testCorrectPassword() {
        
        // GIVEN
        passwordAttempts.attemptCount = 0;

        // WHEN
        String result = passwordAttempts.enterPassword('mission');

        // THEN
        System.assertEquals('success', result);
        System.assertEquals(0, passwordAttempts.attemptCount);
    }

    @isTest
    static void testWrongPassword() {

        // GIVEN
        passwordAttempts.attemptCount = 0;

        // WHEN
        String result = passwordAttempts.enterPassword('wrong');

        // THEN
        System.assertEquals('failed', result);
        System.assertEquals(1, passwordAttempts.attemptCount);
    }
}
/*
Test Method
     ↓
Call enterPassword('mission')
     ↓
Password matches
     ↓
Return "success"
     ↓
Store in result
     ↓
assertEquals('success', result)
     ↓
TEST PASSED ✅
*/