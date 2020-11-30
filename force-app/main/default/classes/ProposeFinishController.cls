public with sharing class ProposeFinishController {
    // 提案
    public List<Propose__c> proposeList {get; set;}
    public ProposeFinishController() {
        
    }
    public Pagereference init() {
        try{
            String id = ApexPages.currentPage().getParameters().get('id');
            proposeList = new List<Propose__c>();
            proposeList = ProposeDao.getProposeRecById (id);
            if (proposeList.size() == 0) {
                Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR, 'URL不正です'));
                return null;
            }

        }catch(Exception e) {
            ApexPages.Message msg;
            msg = new ApexPages.Message(
                           ApexPages.Severity.ERROR, 'システムエラーが発生しました。' + e.getMessage() + ']'
            );
            ApexPages.addmessage(msg);
        }
        return null;
    }
}