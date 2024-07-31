
# Apex-Trigger
## Salesforce Apex Trigger Scenario's Practice

 If the Opportunity has related Contact records where the Role is 'Decision Maker', update a custom field Decision_Maker_Count__c on the Opportunity to reflect the count of such contacts.
 If there are no 'Decision Maker' contacts, send an email notification to the Opportunity Owner indicating that no decision makers are linked to the opportunity.


##### Trigger On  : Opportunity Contact Role
##### Event       : After Insert and After Delete
##### DML         : update
