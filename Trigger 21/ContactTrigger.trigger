trigger ContactTrigger on Contact (before insert,before delete, after insert) 
{
    ContactHandler obj = new ContactHandler();
    obj.doAction();
}