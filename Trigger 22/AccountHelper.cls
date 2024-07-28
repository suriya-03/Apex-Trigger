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

    public static void validatationAccount(Map<Id,Account> oldaccMap)
	{
		
		List<Account> accList = [Select Id, (Select StageName from Opportunities Where 
                                StageName = 'Closed Won') From Account where Id IN : oldaccMap.keyset()];
		
		for(Account acc : AccList)
		{
			if(acc.Opportunities.size() > 0)
			{
            
				oldaccMap.get(acc.Id).addError('Unable to Delete the Account due to Closed won opportunity associated');
                
			}
		}
	
	}

}