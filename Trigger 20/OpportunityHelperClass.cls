/*
 * Author		: N.Suriya Prakash
 * Created on	: 06.06.2024
 * Modified on	: 
 * Description	: Opportunity Helper Class. 
 */

public class OpportunityHelperClass 
{
    
    public static void updateStageOppLineItem(List<Opportunity> oppList, Map<Id,Opportunity> oppOldMap)
    {
        Set<Id> ids = RecursionUtility.setOfIds;

        List<Opportunity> recordProcessed = new List<Opportunity> ();

        Map<Id,String> oppMap = new Map<Id,String> ();
        
        for(Opportunity opp : oppList)
        {
            if(!ids.contains(opp.Id))
            {
                ids.add(opp.Id);
                recordProcessed.add(opp);
            }
            
        }

        for(Opportunity oppRec : recordProcessed)
        {
           
            if(oppRec.StageName != oppOldMap.get(oppRec.Id).StageName)
            {
                if(oppRec.StageName == 'Closed Won')
                {
                    oppMap.put(oppRec.Id, oppRec.StageName);
                }
            }
        }
        
        List<OpportunityLineItem> oppLineItemList = [SELECT opportunityId,Stage__c FROM OpportunityLineItem
                                                     WHERE opportunityId IN : oppMap.keyset()];
        if(oppLineItemList.size()>0)
        {
            for(OpportunityLineItem rec : oppLineItemList)
            {
                rec.stage__c = 'Closed';
            }
        }
        
        try
        {
            update oppLineItemList;
        }
        
        catch(exception e)
        {
            system.debug('Error ' + e.getMessage());
        }
        
    }
    
}