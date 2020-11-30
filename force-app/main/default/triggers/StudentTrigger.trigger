trigger StudentTrigger on Student__c (after insert) {
    List<Grade__c> stugraList= new List<Grade__c>();
  	Grade__c stugra;
    Grade__c stugra1;
    Grade__c stugra2;
    Student__c stuNew;

    for( Student__c stu : trigger.new){
       stuNew = [ select id,Memberflag__c from Student__c where id= :stu.id];
       stuNew.Memberflag__c = true;
	   update stuNew;
            
         stugra = new Grade__c();
         stugra.Name ='第1学期';
         stugra.Chinese__c=0;
         stugra.Math__c=0;
         stugra.English__c=0;
         stugra.GradeToStudent__c=stu.id;
         stugraList.add(stugra);
        
        stugra1 = new Grade__c();
         stugra1.Name ='第2学期';
         stugra1.Chinese__c=0;
         stugra1.Math__c=0;
         stugra1.English__c=0;
         stugra1.GradeToStudent__c=stu.id;
         stugraList.add(stugra1);
        
        stugra2 = new Grade__c();
         stugra2.Name ='第3学期';
         stugra2.Chinese__c=0;
         stugra2.Math__c=0;
         stugra2.English__c=0;
         stugra2.GradeToStudent__c=stu.id;
         stugraList.add(stugra2);
        system.debug('mydebug' +stuNew);
    }
		upsert stugraList;
}