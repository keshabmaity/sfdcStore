public class ShowController {
    public List<Contact> contactList{get;set;}
    public List<Contact> getreturnContact(){
      contactList=new List<Contact> ();
        try{
            contactList=[select id, FirstName,LastName,BirthDate,phone from Contact];
        }
        catch(Exception e){
        }
        return contactList;
    }
    public Contact getDetailContact(){
        String cid=ApexPages.currentPage().getParameters().get('id');

      Contact  cont=new Contact ();
        try{
            cont=[SELECT AccountId,Birthdate,Department,Description,Email,Fax,FirstName,HomePhone,Id,LastName,MailingCity,MailingCountry,MailingState,MobilePhone,Name,Phone,Salutation,Title FROM Contact where id=:cid];
        }
        catch(Exception e){
        }
        return cont;
    }
 
 
}