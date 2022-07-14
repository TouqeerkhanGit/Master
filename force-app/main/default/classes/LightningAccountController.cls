// Apex class
global class LightningAccountController {
    @AuraEnabled global static Account[] getAccountList() {
        return [SELECT Name FROM Account LIMIT 10];
    }
}