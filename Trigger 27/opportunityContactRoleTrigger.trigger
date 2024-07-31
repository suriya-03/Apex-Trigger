trigger opportunityContactRoleTrigger on OpportunityContactRole (After insert,After Delete) 
{
	OpportunityContactRoleHandler obj = new OpportunityContactRoleHandler();
    obj.doAction();
}