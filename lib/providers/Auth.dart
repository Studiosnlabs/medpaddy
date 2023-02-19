import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medpaddy/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _tokenExpiryDate;
  String? _userId;
  Timer? _authTimer;

  bool get isAuth{
    return token !=null;
  }

  String get token{
    if(_token !=null && _tokenExpiryDate!=null && _tokenExpiryDate!.isAfter(DateTime.now())){
      return _token!;
    }

    return 'no token';
  }

  String get userid{
    return _userId!;
  }

  Future<void> signup(String phoneNumber, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDzNG9Txb-KgqanypyYtPpAltbVAB8NOYA');

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': phoneNumber,
            'password': password,
            'returnSecureToken': true,
          }),
          headers: {"Content-Type": "application/json"});

      print(json.decode(response.body));


      final decodedResponse = json.decode(response.body);
      if (decodedResponse['error'] != null) {
        throw HttpExceptions(decodedResponse['error']['message']);
      }

      _token=decodedResponse['idToken'];
      _userId=decodedResponse['localId'];
      _tokenExpiryDate=DateTime.now().add(Duration(seconds: int.parse(decodedResponse['expiresIn'])));
      notifyListeners();
      autoLogout();

      final prefs= await SharedPreferences.getInstance();

      final userData=json.encode(({
        'token':_token,
        'userId':_userId,
        'tokenExpiryDate':_tokenExpiryDate!.toIso8601String()
      }));

      prefs.setString('userData', userData);


    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String phoneNumber, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDzNG9Txb-KgqanypyYtPpAltbVAB8NOYA');

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': phoneNumber,
            'password': password,
            'returnSecureToken': true,
          }),
          headers: {"Content-Type": "application/json"});

      print(json.decode(response.body));

      final decodedResponse = json.decode(response.body);
      if (decodedResponse['error'] != null) {
        throw HttpExceptions(decodedResponse['error']['message']);
      }
      _token=decodedResponse['idToken'];
      _userId=decodedResponse['localId'];
      _tokenExpiryDate=DateTime.now().add(Duration(seconds: int.parse(decodedResponse['expiresIn'])));
      notifyListeners();


      final prefs= await SharedPreferences.getInstance();

      final userData=json.encode(({
        'token':_token,
        'userId':_userId,
        'tokenExpiryDate':_tokenExpiryDate!.toIso8601String()
      }));

      prefs.setString('userData', userData);

      autoLogout();

    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async{

    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    String userPref=prefs.getString('userData')!;
    final extractedUserData=jsonDecode(userPref) as Map<String,dynamic> ;
    final tokenExpiryDate=DateTime.parse(extractedUserData['tokenExpiryDate']);

    if(tokenExpiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token=extractedUserData['token'];
    _userId=extractedUserData['userId'];
    _tokenExpiryDate=tokenExpiryDate;
    notifyListeners();
    autoLogout();
    return true;
  }

  void logout() {
    _token=null;
    _userId=null;
    _tokenExpiryDate=null;

    if(_authTimer !=null){
      _authTimer?.cancel();
      _authTimer=null;
    }


    notifyListeners();

    SharedPreferences.getInstance().then((pref) => {
      // pref.remove('userData')
      pref.clear()
    });
  }


  void autoLogout(){
    if(_authTimer!=null){
      _authTimer?.cancel();
    }
    final timeToExpiry=_tokenExpiryDate?.difference(DateTime.now()).inSeconds;
    _authTimer= Timer(Duration(seconds: timeToExpiry!),logout);
  }

}
