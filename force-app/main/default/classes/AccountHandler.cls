public class AccountHandler {
    public static void insertAccount(Integer value){
        Integer counter = 1;
        //创建一个列表以添加 accounts
        List<Account> addAccounts = new List<Account>();
        
        while(counter <= 3){
            //显示当前counter值
            System.debug('Counter Value before Incrementing ' + counter);
            
            //创建一个新 account
            Account store = new Account();
            store.Name = 'Acme Inc n ' + counter;
            store.AccountNumber = 'A000n' + counter;
            addAccounts.add(store);
            
            System.debug(addAccounts);
            
            //增加 counter ( counter + 1)
            counter = counter + 1;
            System.debug('Counter Value after incrementing ' + counter);
        }
        
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        
        //将所有帐户 accounts→插入列表中 list
        insert addAccounts;
    }
}