trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        // Call a utility method from another class
        EmailManager obj = new EmailManager();
        obj.sendMail('944027442@qq.com', 'Trailhead Trigger Tutorial', 
                    recordCount + ' 插入新建取引責任者.');
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}