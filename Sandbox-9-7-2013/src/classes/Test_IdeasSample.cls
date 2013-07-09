@isTest
class Test_IdeasSample{

     static testMethod void myTestMethod() {
    
       // Create a new email, envelope object and Attachment
       Messaging.InboundEmail email = new Messaging.InboundEmail();
       Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
    
       email.subject = 'Improve performance on the new Formular 1 racecar';
       env.fromAddress = 'keshab.maity@extentor.com';
       email.fromAddress = env.fromAddress; // Without this you will get a de-reference null object error
    
       // call the class and test it with the data in the testMethod
       IdeasSample ideaTestObj = new IdeasSample();
       ideaTestObj.handleInboundEmail(email, env );                      
      } 

}