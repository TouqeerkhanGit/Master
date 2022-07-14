public class Opportunityclone {
    @AuraEnabled
    public static Opportunity OppById(Id Opp_Id) {
        if(Opp_Id != null ) {
            return [Select Id,Name,Accountid,StageName,closedate,Type,LeadSource from opportunity where id= :Opp_Id];
       
        }
        else{
            return [Select Id,Name,Accountid,StageName,closedate,Type,LeadSource from opportunity LIMIT 1];
           
        }     
    }
    
     @AuraEnabled
    public static void LineItem(Id OppId,Id newOpp) {
             List<OpportunityLineItem> itemlist=new List<OpportunityLineItem>();
             List<OpportunityLineItem> lineitem= [Select id,Description,UnitPrice,Quantity,TotalPrice from OpportunityLineItem where opportunityid= :OppId ];
             
               for(OpportunityLineItem lineitem1:lineitem){
                 OpportunityLineItem Insertlineitem=new OpportunityLineItem();  
                      Insertlineitem.OpportunityId=newOpp;
                          Insertlineitem.Product2Id=lineitem1.Product2Id;	
                    Insertlineitem.PricebookEntryId=lineitem1.PricebookEntryId;
                    Insertlineitem.Description=lineitem1.Description;
                    Insertlineitem.UnitPrice=lineitem1.UnitPrice;
                    Insertlineitem.Quantity=lineitem1.Quantity;
                   
                   itemlist.add(Insertlineitem); 
                    
                }
            
                System.debug('lineItem2:'+itemlist);
                insert itemlist;
    }

}