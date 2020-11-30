public class AccountUtils {
    public static List<Account> accountsByState(String st){
        List<Account> acctList = [select id,Name from Account where BillingState = :st];
        return acctList;
        
    }

}