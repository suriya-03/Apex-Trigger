public with sharing class AccountHelper {
  

    public AccountHelper(){

    }
    

public static void validatationAccount(Map<Id,Account> oldaccMap)
{
		
	List<Account> accList = [Select Id, (Select StageName from Opportunities Where StageName = 'Closed Won') From Account where Id IN : oldaccMap.keyset()];
		
	for(Account acc : AccList)
	{
		if(acc.Opportunities.size() > 0)
		{
            
			oldaccMap.get(acc.Id).addError('Unable to Delete the Account due to Closed won opportunity associated');
                
		}
	}
	
}

}
