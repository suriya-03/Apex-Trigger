public class OpportunityContactRoleHelper 
{
   
	public static void countOfOpportunityContactRole(List<OpportunityContactRole> oppList)
    {
        Set<id> oppIds = new Set<id> ();
        for(opportunityContactRole oppRoles : oppList)
        {
            if(oppRoles.opportunityId != NULL)
            {
                oppIds.add(oppRoles.OpportunityId);
            }
        }
        
        List<opportunity> oppLists = [Select Name, Decision_Maker_Count__c, owner.Email, (Select opportunityId from opportunityContactRoles)
                                    From opportunity Where id IN : oppIds];
        
        for(Opportunity opp : oppLists)
        {
            if(opp.opportunityContactRoles.size()>0)
            {
                opp.Decision_Maker_Count__c = opp.opportunityContactRoles.size();
            }
            
            else
            {
		opp.Decision_Maker_Count__c = 0;
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage ();
                message.subject = 'Assign Contact Role ' + opp.Name;
                message.HtmlBody = 'This opportunity does not have contact role. Kindly assign contact role for this opportunity' + opp.Name + 'and the record Id is ' + opp.Id;
                message.toAddresses = new String[] {opp.Owner.Email};
                    
                    Messaging.SingleEmailMessage[] emailMessages = new List<Messaging.SingleEmailMessage> {message};
                        
                        Messaging.SendEmailResult[] result = Messaging.SendEmail(emailMessages);
                
                if(result[0].success)
                {
                    system.debug('The email was sent successfully');
                   
                }
                
                else
                    
                {
                    system.debug('Error in sending email : ' + result[0].errors[0].message);
                    
                }
            }
        }
        
        try
        {
            update oppLists;
        }
        catch(Exception e)
        {
            system.debug('Error ' + e.getMessage());
        }
        
    }
}
