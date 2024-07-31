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

    public static void checkAccountBillingAddress(List<Opportunity> newLists)
    {
        Map<Id,Opportunity> mapOpp = new Map<Id,Opportunity> ();

        for(Opportunity rec : newLists)
        {
            if(rec.accountId != NULL)
            {
                mapOpp.put(rec.accountId, rec);
            }
        }

        List<Account> accountList = [Select Id,BillingStreet, BillingCity,BillingState,BillingCountry,
        BillingPostalCode FROM Account Where Id IN : mapOpp.keyset()];

        for(Account acc : accountList)
        {
            if(acc.BillingStreet == NULL && acc.BillingCity == NULL &&  acc.BillingCountry == NULL &&
            acc.BillingState == NULL && acc.BillingPostalCode == NULL)
            {
                mapOpp.get(acc.Id).addError('Enter the Billing Address in related Account before create the opportunity');
            }
        }
    }
}