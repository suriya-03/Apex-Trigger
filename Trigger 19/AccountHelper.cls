public with sharing class AccountHelper {
  

    public AccountHelper(){

    }
    
    public static void updateContactOwner(List<Account> accList)
    {
        Set<Id> ids = RecursionUtility.setOfIds;
        Map<Id,String> recordProcessed = new Map<Id,string> ();

        for(Account accRec : accList)
        {
            if(!ids.contains(accRec.Id))
            {
                ids.add(accRec.Id);
                recordProcessed.put(accRec.Id, accRec.ownerId);
            }
        }

        List<Contact> contactList = [Select ownerId, accountId FROM Contact Where accountId = : recordProcessed.keyset()  WITH USER_MODE];

        List<Contact> contactToUpdate = new List<Contact> ();
        
        for(Contact con : contactList)
        {
            Contact rec = new Contact();
            rec.ownerId = recordProcessed.get(con.accountId);
            contactToUpdate.add(rec);

        }

        try {
            
            if(!contactToUpdate.isEmpty())
            {
                update as user contactToUpdate;
            }
        } 
        catch (Exception e) 
        {
            system.debug('Exception ' + e.getMessage());
        }

     }

    


}