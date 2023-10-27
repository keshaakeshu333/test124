// 2. Build a basic lightning component that can query a list of 10 most recently created accounts and display it using a lightning app.
// step.2 we have to create a class object
public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getRecentAccounts() {
        return [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}
