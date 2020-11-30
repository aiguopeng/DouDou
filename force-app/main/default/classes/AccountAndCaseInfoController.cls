public class AccountAndCaseInfoController {
    public List<Student__c> studentList{get;set;}
     public List<Grade__c> studentGradeList{get;set;}
      public void init(){
        String StuId =System.currentPageReference().getParameters().get('StuId');
         system.debug('------------'+ StuId);
          
        		studentList = [select id,
                ID__c,
                Name,
                PromisePerson__r.name,
                MathAve__c,
                EnglishAve__c,
                ChineseAve__c from Student__c where id = 'a072v0000192n7aAAA'];
       		 stuid= studentList[0].id;
          
        studentGradeList=[select 
                          Math__c,
                          English__c,
                          Chinese__c from Grade__c where GradeToStudent__c = 'a072v0000192n7aAAA'];
        	
          }
    }