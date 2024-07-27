trigger AccountTrigger on Account (before insert,after update) {

    AccountHandler obj = new AccountHandler();
    obj.doAction();

}