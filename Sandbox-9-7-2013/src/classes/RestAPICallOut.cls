/*
    @Author: Keshab 
    @Date:04/07/13
    @Description: Test Rest API By sending Request 
*/
global  class RestAPICallOut {
/*
    Wrapper Class hold data which returned in Response.
*/
    Class Widget{
        String name;
        String id;
        String Unit;
    }

    // Variable Used in UI to show Information
    public String resBody{get;set;}
    public Integer resStatus{get;set;}
    public String resStatusCode{get;set;}
    
    
    //Service URL    
    String URL='https://resttrail-developer-edition.ap1.force.com/services/apexrest/Widgets';
    String key='extr13t532ehebsghstytdwt362328';
    String id='a009000000ExaiNAAR';
    String URL1='https://resttrail-developer-edition.ap1.force.com/services/apexrest/Rest_API_Extentor';
    //String URL2='https://ap1.salesforce.com/services/data/v27.0/sobjects/Account/ -H "Content-Type: application/json"  -H "Authorization: Bearer token" -H "X-PrettyPrint:1"';
    //String URL2='https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=3MVG9Y6d_Btp4xp6WtwY.PZMwi9mr2e12Utk9gWxKJTGEoLp.XtoObP7zjsmbMr2TwbtU6z.8_6rYkOCaPVTj&redirect_uri=https://c.cs5.visual.force.com/RestTest/oauth/callOutPage_callback';    
    String URL2='https://login.salesforce.com/services/oauth2/authorize?response_type=token&client_id=3MVG9Y6d_Btp4xp6WtwY.PZMwi59fGCqeuIjdfLg.j.p4k9L0zX.zdSwhxr0v74l3W5_xKVomTQV_RAQCKcaT&redirect_uri=https://test.salesforce.com/services/oauth2/success&state=mystate';
    Public String JSONString{get;set;}
    //Method Test REST PUT callout
    public RestInputClass  preparedData(RestInputClass  input){
        return input    ;
    }
    public void makePUTCallOutAuth2(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL2);
        req.setMethod('POST');        
        req.setHeader('Content-Type', 'application/json');

       
       // String abodyJSON='{"NewName":"Fourth Widget","grant_type":"authorization_code","client_id":"3MVG9Y6d_Btp4xp6WtwY.PZMwi5koZO2KbbL2MKs.wiOEBN8Q_BuymnEcFx8D8OhR9kQJVhO.5gzErtPoTqwz","client_secret":"4912555546776388411","username":"keshab.maity@57demo.com.devee","password":"Pa22wordkE62HTrXYZwDCRpvjUl0moanF"}'; 
        String abodyJSON='{"NewName":"Fourth Widget"}';
    
        req.setBody(abodyJSON);  

        req.setTimeout(60000);
        try{
            // callout
            HttpResponse res = h.send(req);
            System.debug(JSONString+ ':::Status-------------'+res.getStatus());
            System.debug('StatusCode-------------'+res.getStatusCode());
            resStatusCode=res.getStatus();
            resStatus=res.getStatusCode();
            System.debug(res.getBody());
            resBody=res.getBody();
            //JSONString =(String ) JSON.serializePretty(res); 
            SYstem.debug('----------------------------'+res.getHeaderKeys());
            SYstem.debug('----------------------------'+res.getHeader('Date'));
            List<String> Keys=new List<String>();
            Keys=res.getHeaderKeys();
            For(String str:Keys){
                If(str<>null)
                    System.debug(str+'----------------------------'+res.getHeader(str));
            }
            
            

        }
        catch(Exception e){
            System.debug(e);
        }    
    }    
    
    public void makePUTCallOut1(){
        // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();



        
        req.setEndpoint(URL1);
       // req.setMethod('PUT');        
        req.setMethod('GET');   
        req.setHeader('Content-Type', 'application/json');
        // RestInputClass1 input=new RestInputClass1();
        RestInputClass input=new RestInputClass();
        input= preparedData(input);
        
        // Additinal Part May be Delete
        URL1=URL1 + '?paramdata='+input;
        req.setEndpoint(URL1);
       
        // String abodyJSON='{"Id":"a009000000ExMzR","NewName":"Fourth Widget","NewUnit":"100"}';    
        JSONString =(String ) JSON.serializePretty(input); 

    
        System.debug('--------JSONString -----'+JSONString ); 
        /// req.setBody(JSONString );  
        
        String abodyJSON='{"message":"-----------------------"}';   


        //req.setBody(abodyJSON);  
       // req.setBody(JSONString);  

        
        req.setTimeout(60000);
        try{
            // callout
            HttpResponse res = h.send(req);
            System.debug(JSONString+ ':::Status-------------'+res.getStatus());
            System.debug('StatusCode-------------'+res.getStatusCode());
            resStatusCode=res.getStatus();
            resStatus=res.getStatusCode();
            System.debug(res.getBody());
            resBody=res.getBody();
            // RestOutputClass1 output=(RestOutputClass1)JSON.deserializeStrict(res.getBody(),RestOutputClass1.class);
            RestOutputClass output=(RestOutputClass)JSON.deserializeStrict(res.getBody(),RestOutputClass.class);
            System.debug('++++++++++++++++++++++++++='+output);
            // resBody=(String ) JSON.serializePretty(output); 
            // parse coordinates from response
            JSONParser parser = JSON.createParser(res.getBody());
            System.debug('--------------------------'+parser );
        }
        catch(Exception e){
            System.debug(e);
        }    
    }    
      //   Method Test REST PUT callout
   public void makePUTCallOut(){
      // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();


        req.setEndpoint(URL+'?apikey='+key);
        req.setMethod('PUT');        
        req.setHeader('Content-Type', 'application/json');
        String abodyJSON='{"Id":"a009000000ExMzR","NewName":"Fourth Widget","NewUnit":"100"}';           
        req.setBody(abodyJSON);
        req.setTimeout(60000);
        try{
            // callout
            HttpResponse res = h.send(req);
            System.debug('Status-------------'+res.getStatus());
            System.debug('StatusCode-------------'+res.getStatusCode());
            resStatusCode=res.getStatus();
            resStatus=res.getStatusCode();
            System.debug(res.getBody());
            resBody=res.getBody();
            // parse coordinates from response
            JSONParser parser = JSON.createParser(res.getBody());
            System.debug('--------------------------'+parser );

        }
        catch(Exception e){
            System.debug(e);
        }
    
    }
     //   Method Test REST DELETE callout
   public void makeDELETECallOut(){
      // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint(URL+'?apikey='+key+'&Id='+id);
        req.setMethod('DELETE');        
        req.setHeader('Content-Type', 'application/json');
        // String abodyJSON='{"Name":"6th Widget"}';           
        // req.setBody(abodyJSON);
        req.setTimeout(60000);
        try{
            // callout
            HttpResponse res = h.send(req);
            System.debug('Status-------------'+res.getStatus());
            System.debug('StatusCode-------------'+res.getStatusCode());
            System.debug(res.getBody());
            resStatusCode=res.getStatus();
            resStatus=res.getStatusCode();
             resBody=res.getBody();
            // parse coordinates from response
            JSONParser parser = JSON.createParser(res.getBody());
            System.debug('--------------------------'+parser );

        }
        catch(Exception e){
            System.debug(e);
        }
    
    }
    //   Method Test REST POST callout    
    public void makePOSTCallOut(){
      // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();



        req.setEndpoint(URL+'?apikey='+key);
        req.setMethod('POST');        
        req.setHeader('Content-Type', 'application/json');
        String abodyJSON='{"Name":"6th Widget"}';           
        req.setBody(abodyJSON);
        req.setTimeout(60000);
        try{
            // callout
            HttpResponse res = h.send(req);
            System.debug('Status-------------'+res.getStatus());
            System.debug('StatusCode-------------'+res.getStatusCode());
            System.debug(res.getBody());
             resBody=res.getBody();
            resStatusCode=res.getStatus();
            resStatus=res.getStatusCode();
            // parse coordinates from response
            JSONParser parser = JSON.createParser(res.getBody());
            System.debug('--------------------------'+parser );

        }
        catch(Exception e){
            System.debug(e);
        }
    
    }
    //   Method Test REST GET callout
    public void makeCallOut(){
      // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();

            req.setEndpoint(URL+'?apikey='+key);
            req.setMethod('GET');
            req.setTimeout(60000);

            req.setHeader('Content-Type', 'application/json');
            try{
                // callout
                HttpResponse res = h.send(req);

                 System.debug('Status-------------'+res.getStatus());
                 System.debug('StatusCode-------------'+res.getStatusCode());


                System.debug(res.getBody());
                resBody=res.getBody();
                resStatusCode=res.getStatus();
                resStatus=res.getStatusCode();
                // parse coordinates from response
                JSONParser parser = JSON.createParser(res.getBody());

                Widget  wid=new Widget(); 
                List<Widget> WidgetList =new  List<Widget>();
                while (parser.nextToken() != null) {
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) ){
                   
                        if(parser.getText()=='attributes'){
                              if(wid.name!=null)
                                  WidgetList.add(wid);
                              wid=new Widget(); 
                              parser.nextValue(); 
                        }else if( parser.getText()=='Name' ||  parser.getText()=='Unit__c' ||  parser.getText()=='Id'){
                   
                            String fieldName = parser.getCurrentName();
                            parser.nextValue();
                            String nextValue=parser.getText();
                           // System.debug(fieldName +'------'+nextValue);
                           
                            if(fieldName =='Name')           wid.name=nextValue;
                            else if(fieldName =='Unit__c')   wid.unit=nextValue;
                            else if(fieldName =='Id')        wid.id=nextValue;                            
                        }
                    }
                }
                 if(wid.name!=null)
                      WidgetList.add(wid);
                      
                      System.debug('Number OF Record  Received '+WidgetList.size()+'    '+WidgetList);                
            } 
            catch (Exception e) {
                System.debug(e);
            }
    }
}