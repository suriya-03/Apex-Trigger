trigger AccountTrigger on Account (before insert) {

    AccountHandler obj = new AccountHandler();
    obj.doAction();

}
