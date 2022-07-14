public class APICallout2 {
    Public static void insertData(){
        
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
    List<Object> animals = (List<Object>) results.get('animals');
    System.debug('Received the following animals:');
      list<Apitest__C> t2=new List<Apitest__c>();
    for (Object animal: animals) {
       
        System.debug(animal);
    
    string name=(String)animal;  

    Apitest__C tnew= new Apitest__C(details__c=name);
    t2.add(tnew);
    
    }
    insert t2;
    
}
    //system.debug('check '+t4);
   // insert t4;

    }

}