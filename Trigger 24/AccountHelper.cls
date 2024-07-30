public with sharing class AccountHelper {
  

    public AccountHelper(){

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

}
