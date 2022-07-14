public class ProductClone {
    @AuraEnabled
    public static Product2 ProductById(Id Prod_Id) {
        if(Prod_Id != null ) {
            return [select id,Name,Description,Family,ProductCode,QuantityUnitOfMeasure,StockKeepingUnit from Product2 where id= :Prod_Id];
       
        }
        else{
            return [select id,Name,Description,Family,ProductCode,QuantityUnitOfMeasure,StockKeepingUnit from Product2 LIMIT 1];
           
        }     
    }


}