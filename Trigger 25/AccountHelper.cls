public with sharing class AccountHelper {
  

    public AccountHelper(){

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
