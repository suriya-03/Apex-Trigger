/*
 * Author		: N.Suriya Prakash
 * Created on	: 06.06.2024
 * Modified on	: 
 * Description	: Opportunity Trigger 
 */


trigger OpportunityTrigger on Opportunity (after update) 
{
	OpportunityHandler obj = new OpportunityHandler();
    obj.doAction();
}