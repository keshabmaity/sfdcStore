Global class RestInputClass{
    Global   String APIkey='qqqqqqqqqqqqqqqqqqq';
    Global    Class WidgetInfo{
        Global     String name='';
        Global     String unit='';
        Global     String wid='';    
    }
    Global   Class AccountInfo{
        Global     String accountname='';
        Global     String Website='';
        Global     String Type='';
        Global     String AccountNumber='';
        Global     String aid='';    
    }
    Global   Class ContactInfo{
        Global     String firstname='';
        Global     String lastname='';
        Global     String email='';
        Global     String mobile='';
        Global     String cid=''; 
    }
    Global   List<ContactInfo>ContactInfoList=new  List<ContactInfo>();
    Global   List<AccountInfo>AccountInfoList=new  List<AccountInfo>();
    Global   List<WidgetInfo>WidgetInfoList=new  List<WidgetInfo>();
}