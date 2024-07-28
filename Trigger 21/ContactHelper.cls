public with sharing class ContactHelper {
    public ContactHelper() {

    }

    public static void preventDeleteContact_ActiveAccount(List<Contact> oldListContact)
    {

        Map<Id,Contact> oldMap = new Map<Id,Contact> ();

        //Id --> Account Id
        //Contact --> Contact Record 
        
        for(Contact con : oldListContact)
        {
            if(con.accountId != NULL)
            {
                oldMap.put(con.accountId,con);
            }
        }

        //List<Contact> conList = [Select Id, Account.Active__c from Contact where Account.Active__c = 'No'];

        List<Account> accList = [Select Active__c from Account where Id IN : oldMap.keyset() AND 
        Active__c = 'No'];

        for(Account acc : accList)
        {
            if(acc.Active__c == 'No')
            {
                oldMap.get(acc.Id).addError('Unable to Delete the contact due to Inactive Account');
            }
        }
    }

    public static void SetPrimaryContact(List<Contact> newListContact)
    {

        Map<Id,Contact> mapContact = new Map<Id,Contact> ();

        for(Contact con : newListContact)
        {
            if(con.accountId != NULL)
            {
                
                mapContact.put(con.accountId, con);
            }
        }

        List<Account> accList = [Select Id,Name,(Select accountId, Primary_Contact__c From Contacts) From Account Where Id IN : mapContact.keyset()];
        for(Account rec : accList)
        {
            if(rec.contacts.isEmpty())
            {
                mapContact.get(rec.Id).Primary_Contact__c = true;
            }
        }

    }
}