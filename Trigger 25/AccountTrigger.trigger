trigger AccountTrigger on Account (before insert,before delete,after insert,after update) {

    AccountHandler obj = new AccountHandler();
    obj.doAction();

}