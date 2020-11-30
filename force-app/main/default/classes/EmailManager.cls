public class EmailManager {
    // パブリックメソッド
    public void sendMail(String address, String subject, String body) {
        // 電子メールメッセージオブジェクトを作成する
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // 将此电子邮件传递到内置的sendEmail方法
        // メッセージングクラスの
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
        
        // 调用辅助方法检查返回的结果
        inspectResults(results);
    }
    
    // 辅助方法
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        // sendEmail返回结果对象数组。
        // 遍历列表以检查结果。 
        // 在此类中，这些方法仅发送一封电子邮件。
        // 因此，我们应该只有一个结果。
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('电子邮件发送成功');
            }
            else {
                sendResult = false;
                System.debug('发生以下错误: ' + res.getErrors());                 
            }
        }
        
        return sendResult;
    }
}