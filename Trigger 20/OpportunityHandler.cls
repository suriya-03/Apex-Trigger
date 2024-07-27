/*
 * Author		: N.Suriya Prakash
 * Created on	: 06.06.2024
 * Modified on	: 
 * Description	: Opportunity Handler Class
 */

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
                OpportunityHelperClass.updateStageOppLineItem(TriggerNew, TriggerOldMap); 
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