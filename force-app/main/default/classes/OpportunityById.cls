public class OpportunityById {
 @AuraEnabled
    public static Opportunity OppById(Id Opp_Id) {
        if(Opp_Id != null ) {
            return [Select Name,Accountid,StageName,closedate,Type,LeadSource from opportunity where id= :Opp_Id];
       
        }
        else{
            return [Select Name,Accountid,StageName,closedate,Type,LeadSource from opportunity LIMIT 1];
           
        }     
    }

    @AuraEnabled
    public static OpportunityLineItem LineItem(Id line_id) {
        if(line_id != null ) {
            return [Select id,Description,UnitPrice,Quantity,TotalPrice from OpportunityLineItem where id= :line_id LIMIT 1];
        }
        else{
            return [Select id,Description,UnitPrice,Quantity,TotalPrice from OpportunityLineItem LIMIT 1];
        }     
    }
    
    
 @AuraEnabled
  public static void  saveOpport(Opportunity opp) {

        try{
            System.debug('SaveOppor::saveOpport::Opp'+opp);
            opportunity oppp=new opportunity();
            oppp.Name=opp.Name;
            oppp.StageName=opp.StageName;
            oppp.closedate=opp.closedate;
            oppp.Type=opp.Type;
            oppp.AccountId=opp.AccountId;
            if(Opp != null){
                Insert oppp;
                 System.debug('new1'+opp.Id);
                List<OpportunityLineItem> itemlist=new List<OpportunityLineItem>();
               
                List<OpportunityLineItem> lineitem=[Select id,Product2Id,PricebookEntryId,Description,UnitPrice,Quantity,TotalPrice from OpportunityLineItem where opportunityid= :opp.Id ];
                  System.debug('checklist'+lineitem);
                for(OpportunityLineItem lineitem1:lineitem){
                 OpportunityLineItem Insertlineitem=new OpportunityLineItem();  
                 Insertlineitem.OpportunityId=oppp.id;
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
            
        } catch (Exception ex){
            
        }
        
}
}