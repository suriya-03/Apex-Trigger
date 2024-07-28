public with sharing class ContactHelper {
    public ContactHelper() {

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
