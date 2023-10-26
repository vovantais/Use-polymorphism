public class DataService {
    private static Map<String, Type> phoneNumberMap = new Map<String, Type> {
        'Contact' => PrimaryContactPhoneNumber.class,
        'Lead' => LeadPhoneNumber.class
    };

    public static String getPhoneNumberByRecordIdUsePolymorphism(Id recordId) {
        String sObjectType = recordId.getSobjectType().getDescribe().getName();
        Type phoneNumberType = phoneNumberMap.get(sObjectType);

        if (recordId == null || sObjectType == null || phoneNumberType == null) {
            return '';
        }

        PhoneNumber phoneNumber = (PhoneNumber) phoneNumberType.newInstance();
        return phoneNumber.getPhoneNumber(recordId);
    }


    public static String getPhoneNumberByRecordIdUseSwitchOperation(Id recordId) {
        if (recordId != null) {
            String sObjectType = recordId.getSobjectType().getDescribe().getName();

            switch on sObjectType {
                when 'Opportunity' {
                    return DataServiceManager.getPrimaryContactPhoneNumberByOppId(recordId);
                }
                when 'Lead' {
                    return DataServiceManager.getLeadPhoneNumberByLeadId(recordId);
                }
                when else {
                    return null;
                }
            }
        }

        return null;
    }
}
