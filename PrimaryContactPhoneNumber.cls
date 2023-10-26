private class PrimaryContactPhoneNumber extends PhoneNumber {
    public override String getPhoneNumber(Id recordId) {
        return DataServiceManager.getPrimaryContactPhoneNumberByOppId(recordId);
    }
}