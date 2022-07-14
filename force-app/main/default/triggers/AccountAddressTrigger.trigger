trigger AccountAddressTrigger on Account (before insert) {
 for(account acc:trigger.new){
        If(acc.Match_Billing_Address__c==true){
            acc.BillingPostalCode=acc.ShippingPostalCode;
            
        }
    }
}