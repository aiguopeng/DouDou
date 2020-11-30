public class AccountUtility {
    public static void viewAnnualRevenue () {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        String fullname; 
        for(Account acc : accountsList) {
        fullname = acc.Name + ' : ' + acc.AnnualRevenue;
            system.debug(fullname);
        }
    }
}