public class DataServiceManager {

    public static Id getLeadPhoneNumberByLeadId() {
        return [SELECT Id, Phone FROM Lead WHERE Id =: recordId];
    }

    public static Id getPrimaryContactPhoneNumberByOppId(Id recordId) {
        return [SELECT Id, Phone FROM Contact WHERE Id =: recordId];
    }
}