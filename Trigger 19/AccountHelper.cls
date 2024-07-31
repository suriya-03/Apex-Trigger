public with sharing class AccountHelper {
  

    public AccountHelper(){

    }
    
    public static void updateContactOwner(List<Account> accList, Map<Id,Account> oldMapList)
    {
        Set<Id> ids = RecursionUtility.setOfIds;
        Map<Id,String> recordProcessed = new Map<Id,string> ();

        for(Account accRec : accList)
        {
            if(!ids.contains(accRec.Id))
            {
                if(accRec.ownerId != oldMapList.get(accRec.Id).ownerId)
                {
                    ids.add(accRec.Id);
                    recordProcessed.put(accRec.Id, accRec.ownerId);
                }
               
            }
        }

        List<Contact> contactList = [Select Id,ownerId, accountId FROM Contact Where accountId = : recordProcessed.keyset()  WITH USER_MODE];
        
        for(Contact con : contactList)
        {
            con.ownerId = recordProcessed.get(con.accountId);
        }

     try {

            update as user contactList;

        } 
        catch (Exception e) 
        {
            system.debug('Exception ' + e.getMessage());
        }
}
