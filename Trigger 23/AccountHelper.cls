public with sharing class AccountHelper {
  

    public AccountHelper(){

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

}
