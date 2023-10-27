// 1. Create a field on Account named "Number of Contacts". Populate this field with the number of contacts related to an account. 

trigger UpdateNumberOfContacts on Contact (after insert, after update, after delete) {
    Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
    
    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Contact contact : Trigger.new) {
            if (contact.AccountId != null) {
                accountsToUpdate.put(contact.AccountId, new Account(Id = contact.AccountId));
            }
        }
    }
    
    if (Trigger.isDelete) {
        for (Contact contact : Trigger.old) {
            if (contact.AccountId != null) {
                accountsToUpdate.put(contact.AccountId, new Account(Id = contact.AccountId));
            }
        }
    }
    
    List<Account> updatedAccounts = new List<Account>();
    
    for (Account account : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountsToUpdate.keySet()]) {
        account.Number_of_Contacts__c = account.Contacts.size();
        updatedAccounts.add(account);
    }
    
    update updatedAccounts;
}
