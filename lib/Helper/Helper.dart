
import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static String userName = '';
  static int userId ;
  static String userEmail = '';
  static String userPhone = '';
  static String userAvatar= '';
  static String token='';
  static String userType='';
  static bool is_verified=false;
  static bool is_active=false;
  static String dialCode;
  static String wallet_balance;
  static String confirmation_code;
  static bool is_loggedIn=false;



  static String sharedPreferencesUserLoggedInKey = 'IsLoggedIn';
  static String sharedPreferencesUsernameInKey = 'Username';
  static String sharedPreferencesUserIdInKey = 'UserId';
  static String sharedPreferencesUserEmailInKey = 'UserEmail';
  static String sharedPreferencesUserPhoneInKey = 'UserPhone';
  static String sharedPreferencesUserAvatarInKey = 'UserAvatar';
  static String sharedPreferencesUserTokenInKey = 'UserToken';
  static String sharedPreferencesUserTypeInKey = 'UserType';
  static String sharedPreferencesIsVerifiedInKey = 'IsVerified';
  static String sharedPreferencesIsActiveInKey = 'IsActive';
  static String sharedPreferencesDialCodeInKey = 'DialCode';
  static String sharedPreferencesConfirmationCodeInKey = 'ConfirmationCode';
  static String sharedPreferencesNationalitiesInKey = 'Nationalities';
  static String sharedPreferencesPaymentMethodsInKey = 'PaymentMethods';
  static String sharedPreferencesWalletBalanceInKey = 'WalletBalance';


  static Future<bool> saveUserLoggedInSharedPreferences(bool isLoggedIn)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setBool(sharedPreferencesUserLoggedInKey,isLoggedIn );
  }
  static Future<bool> getUserLoggedInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserLoggedInKey);
  }

  // is_verified key
  static Future<bool> saveUserIsVerifiedInSharedPreferences(bool isVerified)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setBool(sharedPreferencesIsVerifiedInKey,isVerified);
  }

  static Future<bool> getUserIsVerifiedInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesIsVerifiedInKey);
  }

  // is_active key
  static Future<bool> saveUserIsActiveInSharedPreferences(bool isActive)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setBool(sharedPreferencesIsActiveInKey,isActive);
  }

  static Future<bool> getUserIsActiveInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesIsActiveInKey);
  }

  // user_id
  static Future<bool> saveUserIdInSharedPreferences(int userId)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setInt(sharedPreferencesUserIdInKey,userId);
  }

  static Future<int> getUserIdInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserIdInKey);
  }

  // DialCode key
  static Future<bool> saveDialCodeInSharedPreferences(String dialCode)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesDialCodeInKey,dialCode);
  }

  static Future<String> getDialCodeInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesDialCodeInKey);
  }

  // wallet_balance key
  static Future<bool> saveWalletBalanceInSharedPreferences(String balance)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesWalletBalanceInKey,balance);
  }

  static Future<String> getWalletBalanceInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesWalletBalanceInKey);
  }

 // Confirmation code key
  static Future<bool> saveConfirmationCodeInSharedPreferences(String code)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesConfirmationCodeInKey,code);
  }

  static Future<String> getConfirmationCodeInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesConfirmationCodeInKey);
  }

  // user_token
  static Future<bool> saveUserTokenInSharedPreferences(String token)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserTokenInKey,token);
  }

  static Future<String> getUserTokenInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserTokenInKey);
  }


  // user_name
  static Future<bool> saveUsernameInSharedPreferences(String username)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUsernameInKey,username );
  }

  static Future<String> getUsernameInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUsernameInKey );
  }

  // user_email
  static Future<bool> saveUserEmailInSharedPreferences(String username)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserEmailInKey,username );
  }

  static Future<String> getUserEmailInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserEmailInKey );
  }

  // user_phone
  static Future<bool> saveUserPhoneInSharedPreferences(String userPhone)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserPhoneInKey,userPhone );
  }

  static Future<String> getUserPhoneInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserPhoneInKey );
  }


  // user_avatar
  static Future<bool> saveUserAvatarInSharedPreferences(String userAvatar)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserAvatarInKey,userAvatar );
  }

  static Future<String> getUserAvatarInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserAvatarInKey );
  }

  // UserType key
  static Future<bool> saveUserTypeInSharedPreferences(String userType)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserTypeInKey,userType);
  }

  static Future<String> getUserTypeInSharedPreferences()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

    return await prefs.get(sharedPreferencesUserTypeInKey);
  }


}