public  class ProfileLoginController {
public string FindSession { get;set;}


        Static String userSession=null;
       public String UserId {get;set;}
       public String UserPassword {get;set;}
       public String apiSessionId {get;set;} 
       
       
       public ProfileLoginController (){

       }
           public boolean getCheckSession() { 
        boolean flg=(HoldSession.userSessionKey==null?false:true);
        System.debug('---------------flg  '+flg);
        return flg ;
    }

        public PageReference doLogout() {
            userSession=null;
            HoldSession.userSessionKey=null;
            return null;
        }
       public void apiSession(){
           System.debug('---------------------apiSessionId '+apiSessionId );  
       }
       public PageReference login(){
           PageReference pr=ApexPages.CurrentPage();
              User_Login__c userLog=new User_Login__c();
              try{
                  userLog=[select id,Contact__r.FirstName,Contact__r.LastName from User_Login__c where UserName__c=:UserId  AND CurrentPassword__c=:UserPassword limit 1];
                  if( userLog<>null && userLog.id<>null){
                      System.debug('---------------------Login Successful'+userLog);
                      userSession=apiSessionId ;
                      HoldSession.userSessionKey= apiSessionId ;
                      pr=Page.SiteHome;//+'?s='+apiSessionId ;
                      pr=new PageReference ('/apex/SiteHome?s='+apiSessionId);
                      System.debug('---------------------url '+pr);
                  }
                  else 
                       System.debug('---------------------Login Fail');                       
               }
               catch(Exception e){
                   System.debug('---------------------Exception');
               }
               System.debug('---------------------apiSessionId '+HoldSession.userSessionKey);
               if(HoldSession.userSessionKey==null){
                   pr=new pagereference('/apex/TrailSiteLogin');
                   System.debug('---------------------Null Session returning to Home');
               }
              return pr;
       }
       
}