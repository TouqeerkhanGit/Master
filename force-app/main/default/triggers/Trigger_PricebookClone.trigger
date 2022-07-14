trigger Trigger_PricebookClone on Product2 (After insert) {
    
    
    
    List<Product2> prod = new List<Product2>();
    List<PricebookEntry> Pricelist=new List<PricebookEntry>();
     for (Product2 prodnew : Trigger.new) {
        prod.add(prodnew);
    }
     System.debug('checkopp: ' + prod);
     for (Product2 proupdate : prod) {
         System.debug('checkoppId: ' + proupdate.Old_Id__c);
           if(proupdate.Old_Id__c!=null ){
     List<PricebookEntry> price= [select id,Pricebook2Id,UnitPrice,Product2Id,ProductCode,UseStandardPrice,IsActive from PricebookEntry where Product2Id= :proupdate.Old_Id__c ];
       System.debug('pricecheck: ' + price);
  
         if(price.size()>0){
       
          for(PricebookEntry priceold:price){
              
           PricebookEntry pricenew=new PricebookEntry(); 
                 System.debug('priceold: ' + priceold);
            
                   pricenew.Product2Id=proupdate.Id;
                    pricenew.Pricebook2Id=priceold.Pricebook2Id;	
                    pricenew.UnitPrice=priceold.UnitPrice;
                 //  pricenew.ProductCode=priceold.ProductCode;
                    pricenew.UseStandardPrice=priceold.UseStandardPrice;
                   pricenew.IsActive=priceold.IsActive;
                   
                   Pricelist.add(pricenew); 
                                      
              
              }
      }
             }
}
    insert Pricelist;

}