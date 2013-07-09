Global class IdeasSample implements Messaging.inboundEmailHandler{

     Global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,  Messaging.InboundEnvelope env ) {
     
         Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
         
         // Create the new Idea from the incoming email
                createIdea(email.subject, email.plainTextBody, env.fromAddress);
            
         // Set the result to true, no need to send an email back to the user
         // with an error message
         result.success = true;
         // Return the result for the Apex Email Service
         return result;
    }
             
    public static void sendEmail(String s, List<Idea> myIdea) {
    
     // Send an email back to the from email address of who created the idea
     String[] toAddresses = new String[] {s};
    
     // new instance of a single email message
     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
       mail.setToAddresses(toAddresses);
       mail.setReplyTo('keshab.maity@extentor.com');
       mail.setSenderDisplayName('Salesforce Ideas!');
       mail.setSubject('New Idea['+myIdea[0].Id+'] created - '+ myIdea[0].Title);
       mail.setBccSender(false);
       mail.setUseSignature(false);
       mail.setPlainTextBody('Your Idea: ' + myIdea[0].Title +' has been created \n Check out your new idea \n\n To watch you idea in salesforce.com click on this link \n https://na1-blitz04.soma.salesforce.com/ideas/viewIdea.apexp?id='+myIdea[0].Id);
     // Send the email
     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }  
   
    public static Idea[] createIdea(String IdeaTitle, String ideaBody, String fromEmail) {
    
         // instance of a new Idea
         Idea[] newIdea = new Idea[0];
        
         // create a new Idea
         newIdea.add(new Idea(Body = ideaBody,
                        Title = IdeaTitle,CommunityId='09a90000000csp8AAA'));
        System.debug('-------'+newIdea);
        try{
        
          insert newIdea;
          }catch(Exception e){
          System.debug(e);
          }
                
          sendEmail(fromEmail,newIdea); 
        
          return newIdea;    
    }    

}