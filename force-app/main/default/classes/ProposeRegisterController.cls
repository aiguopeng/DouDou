public with sharing class ProposeRegisterController {
    // 提案
    public Propose__c propose {get; set;}
    public List<Employee__c> employeeList {get; set;}
    public List<Anken__c> ankenList {get; set;}
    // URLエラーフラグ
    public Boolean isURLErrorFlg {get; set;}
    // システムエラーフラグ
    public Boolean isSystemErrorFlg {get; set;}
    // 新規作成フラグ
    public Boolean isNewFlg {get; set;}
    // 開始時間必須入力チェックフラグ
    public Boolean startDayInputFlg {get; set;}
    // 契約期間必須入力チェックフラグ
    public Boolean contractPeriodInputFlg {get; set;}
    // 提案単価必須入力チェックフラグ
    public Boolean monthPriceInputFlg {get; set;}
    // 社員salesforceId
    private String employeeSFID = '';
    // 案件salesforceId
    private String ankenSFID = ''; 


    public ProposeRegisterController() {
    }

    /*
    * 機能 ：初期化
    * @param ：なし
    * @return：なし
    */
    public pageReference init() {
        try{
            this.employeeSFID = ApexPages.currentPage().getParameters().get('employeeSFIDid');
            this.ankenSFID = ApexPages.currentPage().getParameters().get('ankenSFIDid');
            this.isSystemErrorFlg = false;
            this.isURLErrorFlg = false;
            // 入力チェックフラグの初期化
            inputFlgInit();
            this.propose = new Propose__c();
            
            employeeList = new List<Employee__c>();
            ankenList = new List<Anken__c>();

            employeeList = EmployeeDao.getEmployeeRecById (this.employeeSFID);
            ankenList = AnkenDao.getAnkenListById(this.ankenSFID);
            if (employeeList.size() == 0 || ankenList.size() == 0) {
                this.isURLErrorFlg = true;
                Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR, 'URL不正です'));
                return null;
            }

        }catch(Exception e) {
            ApexPages.Message msg;
            msg = new ApexPages.Message(
                           ApexPages.Severity.ERROR, 'システムエラーが発生しました。' + e.getMessage() + ']'
            );
            ApexPages.addmessage(msg);
            this.isSystemErrorFlg = true;
        }
        return null;
    }

    /*
    * 機能 ：保存ボタン
    * @param ：なし
    * @return：なし
    */
    public pageReference doSave() {
       Savepoint sp = Database.setSavepoint();
        try{
            // 入力チェック
            if (inputCheck()) return null;
            this.propose.Employee__c = employeeList[0].Id;
            this.propose.Anken__c = ankenList[0].Id;
            this.propose.Account__c = ankenList[0].Account__c;
            // データ保存処理
            insert this.propose;

        }catch(Exception e) {
            ApexPages.Message msg;
            msg = new ApexPages.Message(
                           ApexPages.Severity.ERROR, 'システムエラーが発生しました。' + e.getMessage() + ']'
            );
            ApexPages.addmessage(msg);
            Database.rollback(sp);
            this.isSystemErrorFlg = true;
            return null;
        }

        pageReference pageRef = Page.ProposeFinish;
        pageRef.getParameters().put('id', this.propose.Id);
        return pageRef;
    }

    /*
    * 機能 ：入力チェックフラグの初期化
    * @param ：なし
    * @return：なし
    */
    public void inputFlgInit() {
        this.startDayInputFlg = false;
        this.contractPeriodInputFlg = false;
        this.monthPriceInputFlg = false;
    }

    /*
    * 機能 ：入力チェック
    * @param ：なし
    * @return：なし
    */
    private Boolean inputCheck() {
        Boolean errorFlg = false;

        // 入力チェックフラグの初期化
        inputFlgInit();
        // 開始時間
        if (propose.StartDay__c == null) {
             this.startDayInputFlg = true;
             errorFlg = true;
        }
        // 契約期間
        if (String.isBlank(propose.ContractPeriod__c)) {
             this.contractPeriodInputFlg = true;
             errorFlg = true;
        }
        // 提案単価
        if (propose.MonthPrice__c == null) {
             this.monthPriceInputFlg = true;
             errorFlg = true;
        }

        return errorFlg;
    }

}