trigger AccountTrigger on Account (before delete) {

    AccountHandler obj = new AccountHandler();
    obj.doAction();

}
