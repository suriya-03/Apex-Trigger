public with sharing class ContactHandler {

    List<Contact> triggerNew;
    List<Contact> triggerOld;
    Map<Id,Contact> triggerNewMap;
    Map<Id,Contact> triggerOldMap;

    public ContactHandler() 
    {
        triggerNew =  (List<Contact>) Trigger.New;
        triggerOld= (List<Contact>) Trigger.Old;
        triggerNewMap = (Map<Id,Contact>) Trigger.NewMap;
        triggerOldMap = (Map<Id,Contact>) Trigger.OldMap;
    }

    public void doAction()
    {
        SWITCH ON Trigger.Operationtype
        {
            WHEN BEFORE_INSERT
            {
                ContactHelper.SetPrimaryContact(triggerNew);
            }
        }
    }
}
