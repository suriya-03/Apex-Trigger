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

    public static void preventDeleteContact(List<Account> OldList)
    {
        List<Contact> conList = new List<Contact> ();

        List<Contact> contactList = [Select Id,accountId From Contact Where accountId IN : OldList];

        if(!contactList.isEmpty())
        {
            for(Contact con : contactList)
            {
                Contact rec = new Contact();
                rec.accountId = NULL;
                rec.Id =con.Id;
                conList.add(rec);
            }
        }

        try
        {
            if(!conList.isEmpty())
            {
                update conList;
            }
        }

        catch(Exception e)
        {
            system.debug('Error :: ' + e.getMessage());
        }
       
    }

    public static void validAccountPhone(List<Account> newList)
    {

        for(Account acc : newList)
        {
            if(acc.phone == NULL || acc.Phone == '')
            {
                acc.addError('Enter the Phone number');
            }
        }
    }

    public static void createContactUnderAccount(List<Account> listNew)
    {
        Set<Id> ids = RecursionUtility.setOfIds(); 

        List<Contact> contactInsert = new List<Contact> ();

        List<Account> recordProcessed = new List<Account> ();

        for(Account recs : listNew)
        {
            if(!ids.contains(recs.Id))
            {
                ids.add(recs.Id);
                recordProcessed.add(recs.Id);
            }
        }

        for(Account acc : recordProcessed)
        {
            if(acc.Create_Contact__c == true)
            {
                contact con = new Contact();
                con.accountId = acc.Id;
                con.FirstName = acc.Name ;
                con.LastName =' Contact';
                con.phone = acc.phone;
                contactInsert.add(con);
            }
            
        }

        try{
            
            if(!contactInsert.isEmpty())
            {
                insert contactInsert;
            }
        }

        catch(Exception e)
        {
            system.debug('Error ::' + e.getMessage());
        }

    }

}