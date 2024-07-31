public class OpportunityContactRoleHandler 
{
	 List<OpportunityContactRole> triggerNew;
    List<OpportunityContactRole> triggerOld;
    Map<Id,OpportunityContactRole> triggerNewMap;
    Map<Id,OpportunityContactRole> triggerOldMap;
    
    public OpportunityContactRoleHandler()
    {
        triggerNew = (List<OpportunityContactRole>) Trigger.New;
        triggerOld = (List<OpportunityContactRole>) Trigger.Old;
        triggerNewMap = (Map<Id,OpportunityContactRole>) Trigger.NewMap;
        triggerOldMap = (Map<Id,OpportunityContactRole>) Trigger.OldMap;
    }
    
    public void doAction()
    {
        SWITCH ON Trigger.OperationType
        {
            WHEN BEFORE_INSERT
            {
                 
            }
            
            WHEN BEFORE_UPDATE
            {
                
            }
            
            WHEN BEFORE_DELETE
            {
                
            }
            WHEN AFTER_INSERT
            {
               OpportunityContactRoleHelper.countOfOpportunityContactRole(triggerNew);
            }
            
            WHEN AFTER_UPDATE
            {
               
            }
            
            WHEN AFTER_DELETE
            {
               OpportunityContactRoleHelper.countOfOpportunityContactRole(triggerOld); 
            }
            
            WHEN AFTER_UNDELETE
            {
               
            }
        }
    }
}