@isTest
Private class HelloWorldTest{
static testmethod void validateHelloworld(){

BooK__c b= new Book__c(Name='Kitten books',Price__c=100);
system.debug('Price of Book before insert:'+b.price__c);
insert b;
b=[Select Price__c from book__c where id=:b.Id];
system.debug('Price After trigger;'+b.price__c);

system.assertEquals(90,b.Price__c);


}

}