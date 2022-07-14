trigger Trigger_OpportunityProduct on Opportunity (after insert) {

    
    List<Opportunity> opp = new List<Opportunity>();
    List<OpportunityLineItem> itemlist=new List<OpportunityLineItem>();
     for (Opportunity oppnew : Trigger.new) {
        opp.add(oppnew);
    }
     System.debug('checkopp: ' + opp);
     for (Opportunity opppupdate : opp) {
         System.debug('checkoppId: ' + opppupdate.old_Id__C);
     List<OpportunityLineItem> lineitem= [Select id,Product2Id,PricebookEntryId,Description,UnitPrice,Quantity,TotalPrice from OpportunityLineItem where opportunityid= :opppupdate.old_Id__C ];
       System.debug('checklineitem: ' + lineitem);
  
         if(lineitem.size()>0){
         if(opppupdate.old_Id__C!=null ){
          for(OpportunityLineItem lineitemold:lineitem){
              
           OpportunityLineItem Insertlineitem=new OpportunityLineItem(); 
                 System.debug('checkline: ' + lineitemold);
            
                   Insertlineitem.OpportunityId=opppupdate.Id;
                    Insertlineitem.Product2Id=lineitemold.Product2Id;	
                    Insertlineitem.PricebookEntryId=lineitemold.PricebookEntryId;
                    Insertlineitem.Description=lineitemold.Description;
                    Insertlineitem.UnitPrice=lineitemold.UnitPrice;
                    Insertlineitem.Quantity=lineitemold.Quantity;
                   
                   itemlist.add(Insertlineitem); 
                                      
              
              }
      }
             }
}
    insert itemlist;
}