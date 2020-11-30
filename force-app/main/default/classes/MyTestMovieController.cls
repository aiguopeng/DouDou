public class MyTestMovieController {
  //初始化
    @AuraEnabled
    public static List<Movie__c> GetAll(){ 
        List<Movie__c> movieList = new List<Movie__c>();
        movieList = [select ShowTime__c,ToStar__c,Theme__c,Name__c,Director__c,Name from Movie__c limit 50];
        return movieList;
    }
}