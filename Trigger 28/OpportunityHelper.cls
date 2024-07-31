public with sharing class OpportunityHelper {
    public OpportunityHelper() {

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
