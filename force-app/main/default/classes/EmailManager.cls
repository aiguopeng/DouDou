public class EmailManager {
//パブリックメソッド
    public static void sendMail(String address,String subject,String body) {
   // email messageオブジェクト新規作成
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[] {address}; 
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlaintextBody(body);
          //作成されたemil messageがsendEmilに渡す
          // Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
        //サポートメソッドを使用してresult検査に行う
         inspectResults(results);
         System.debug('test');
    }
   //サポートメソッド
    private static Boolean inspectResults(Messaging.SendEmailResult[]results){
        Boolean sendResult = true;
        
        
        for(Messaging.SendEmailResult res :results ){
            if(res.isSuccess()){
             System.debug('Email sent successfully');  
            }
            else{
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());    
            }
        }
             return sendResult;

    }
}