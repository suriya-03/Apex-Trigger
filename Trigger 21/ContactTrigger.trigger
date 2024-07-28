trigger ContactTrigger on Contact (before insert) 
{
    ContactHandler obj = new ContactHandler();
    obj.doAction();
}
