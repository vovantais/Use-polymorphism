//!BAD
function getPhoneNumber(phoneType: string): number {
  const MOBILE_PHONE: string = "mobile";
  const CITY_PHONE: string = "city";
  const INTERNATIONAL_PHONE: string = "international";
  const CORPORATE_PHONE: string = "corporate";

  switch (phoneType) {
    case MOBILE_PHONE:
      return 45523433;
    case CITY_PHONE:
      return 123523;
    case INTERNATIONAL_PHONE:
      return 2341243523;
    case CORPORATE_PHONE:
      return 9871525;
    default:
      throw new Error("Invalid phone type");
  }
}
const phoneNumber: number = getPhoneNumber("city");
console.log("Phone Number: ", phoneNumber);

//* GOOD
abstract class Phone {
  abstract getPhone(): number;
}

class MobilePhone extends Phone {
  getPhone(): number {
    return 45523433;
  }
}

class CityPhone extends Phone {
  getPhone(): number {
    return 123523;
  }
}

class InternationalPhone extends Phone {
  getPhone(): number {
    return 2341243523;
  }
}

class CorporatePhone extends Phone {
  getPhone(): number {
    return 9871525;
  }
}

class PhoneNumberResolver {
  static getPhoneNumber(phone: Phone): number {
    return phone.getPhone();
  }
}

console.log("Phone Number: ", PhoneNumberResolver.getPhoneNumber(new CityPhone()));
