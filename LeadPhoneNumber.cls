private class LeadPhoneNumber extends PhoneNumber {
    public override String getPhoneNumber(Id recordId) {
        return DataServiceManager.getLeadPhoneNumberByLeadId(recordId);
    }
}