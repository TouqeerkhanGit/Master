public class APICallout {
    public static void InsertApiData(){
        Http http = new Http();
 HttpRequest request = new HttpRequest();
 request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
 request.setMethod('GET');
 HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
 if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    string body = '{"results":[{"id":"55d66226726b611100aaf741", "cost":"5000", "lifespan":"120", "maintenanceperiod":"365", "name":"Generator 1000 kW", "quantity":"5", "replacement":"false", "sku":"100003"},'+
    '{"id":"55d66226726b611100aaf741", "cost":"5000", "lifespan":"120", "maintenanceperiod":"365", "name":"Generator 1000 kW", "quantity":"5", "replacement":"false", "sku":"100003"}]}';
   Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(body);
//get from JSON body Map the 'results' list element
   List<Object> resultslist = (List<Object>)results.get('results');
//iterate over the list of Maps
    list<Apitest__C> t2=new List<Apitest__c>();
     list<Apitest__C> t4=new List<Apitest__c>();
 for(Object mapa:resultslist ){
    Map<String,Object> tempMap = (Map<String,Object>)mapa;
    //this is how you will Access to any element inside the Map
    // here you can add any ligic to process the data

    string name=(String)tempMap.get('cost');   
    system.debug('id '+name);
    Apitest__C tnew= new Apitest__C(details__c=name);
    t2.add(tnew);
    
    }
    insert t2;
    
}
    //system.debug('check '+t4);
   // insert t4;

        
    }
}