public with sharing class OpportunityHelper {
    public OpportunityHelper() {

    } 

    public static void updateAccountRating(List<Opportunity> newList)
    {
        Set<Id> ids = RecursionUtility.setOfIds;
        
        List<Opportunity> recordProcessed = new List<Opportunity> ();

        Set<Id> accountIds = new Set<Id> ();

        for(Opportunity opp : newList)
        {
            if(!ids.contains(opp.Id))
            {
                ids.add(opp.Id);
                recordProcessed.add(opp);
            }
        }

        for(Opportunity opp : recordProcessed)
        {
            if(opp.StageName == 'Closed Won' && opp.accountId != NULL)
            {
                accountIds.add(opp.accountId);
            }
        }

        List<Account> accountList = [Select Id,Rating from Account where Id IN : accountIds];

        
        for(Account acc : accountList)
        {
            
            acc.Rating = 'Hot';
        }

        try{
            update accountList;
        }
        catch(Exception e)
        {
            system.debug('Error :: ' + e.getMessage());
        }
    }
}