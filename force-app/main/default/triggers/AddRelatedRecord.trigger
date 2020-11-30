trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    // このトリガーで取引先に関連する商談を取得します
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
    
    // アカウント(取引先)に商談がない場合は、取引先ごとに商談を追加します.
    // 各取引先を繰り返し処理します。
    for(Account a : Trigger.New) {
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        // 取引先にすでに関連する商談があるかどうかを確認します。
        if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
            // そうでない場合は、デフォルトの商談を追加します
            oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=a.Id));
        }           
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}