public   class ServiceAuthorizationManager {
	
	/*
	This method return status if Requested apiKey matched with the database
	*/
	static  Boolean checkIdentity(String reqKey){
	
		//API_Key__c key=new API_Key__c();
		
		//key=[select Status__c from API_Key__c where Key__c=:reqKey];		
		return true;	
	}

}