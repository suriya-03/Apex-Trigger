public class OpportunityHandler 
{
    List<Opportunity> triggerNew;
    List<Opportunity> triggerOld;
    Map<Id,Opportunity> triggerNewMap;
    Map<Id,Opportunity> triggerOldMap;
    
    public OpportunityHandler()
    {
        triggerNew = (List<Opportunity>) Trigger.New;
        triggerOld = (List<Opportunity>) Trigger.Old;
        triggerNewMap = (Map<Id,Opportunity>) Trigger.NewMap;
        triggerOldMap = (Map<Id,Opportunity>) Trigger.OldMap;
    }
    
    public void doAction()
    {
        SWITCH ON Trigger.OperationType
        {
            WHEN BEFORE_INSERT
            {
                OpportunityHelper.checkAccountBillingAddress(triggerNew);
                 
            }
            
            WHEN BEFORE_UPDATE
            {
                
            }
            
            WHEN BEFORE_DELETE
            {
                
            }
            WHEN AFTER_INSERT
            {
             
            }
            
            WHEN AFTER_UPDATE
            {

            }
            
            WHEN AFTER_DELETE
            {
                
            }
            
            WHEN AFTER_UNDELETE
            {
                
            }
        }
    }
}
