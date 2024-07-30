
# Apex-Trigger
## Salesforce Apex Trigger Scenario's Practice

Suppose a company wants to automatically create a contact for each new or update accounts that meets certain criteria. Specifically, they want to create a contact only when 'Create_Contact__c
is checked on the Account record. the first name should be same as the account name, and the last name should be "Contact". Finally the contact should be associated with the account and inherit
the account's phone number

##### Trigger On  : Account
##### Event       : After Insert & After update
##### DML         : Insert
