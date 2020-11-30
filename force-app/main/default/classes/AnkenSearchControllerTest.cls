@isTest
public with sharing class AnkenSearchControllerTest {
     static testMethod void test_init_01(){
            AnkenSearchController ankenobj = new AnkenSearchController();
            Employee__c employee = new Employee__c(name='chenlei',FirstName__c='dd',Birthday__c=Date.newInstance(1988,12,12),Phone__c='12344567',JoinDate__c=Date.newInstance(1988,12,12));           
           insert Employee;
            system.Test.startTest();
         	PageReference pageRef = page.AnkenSearch;
          	system.Test.setCurrentPage(pageRef);
         ApexPages.currentPage().getParameters().put('id',Employee.id);
         ankenobj.init();
         system.Test.startTest();
         system.assertEquals(false,ankenobj.isSystemErrorFlg);
            
        }    
    
}