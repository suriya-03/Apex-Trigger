public with sharing class AccountHandler {
    List<Account> triggerNew;
    List<Account> triggerOld;
    Map<Id,Account> triggerNewMap;
    Map<Id,Account> triggerOldMap;

    public AccountHandler() 
    {
        triggerNew = (List<Account>) Trigger.New;
        triggerOld = (List<Account>) Trigger.Old;
        triggerNewMap = (Map<Id,Account>) Trigger.NewMap;
        triggerOldMap = (Map<Id,Account>) Trigger.OldMap;
    }

    public void doAction()
    {
        SWITCH ON Trigger.Operationtype
        {
            WHEN AFTER_UPDATE
            {
                AccountHelper.updateContactOwner(triggerNew,triggerOldMap);
            }
        }
    }
}
