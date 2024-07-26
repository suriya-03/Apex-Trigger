trigger ContactTrigger on Contact (before insert,before delete) 
{
    ContactHandler obj = new ContactHandler();
    obj.doAction();
}