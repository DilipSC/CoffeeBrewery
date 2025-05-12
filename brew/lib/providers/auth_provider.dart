import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isAuthenticated = true;

  User? get user => _user;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // For demo purposes, accept any email/password
    if (email.isNotEmpty && password.isNotEmpty) {
      _user = User(
        id: '1',
        name: 'John Doe',
        email: email,
        phone: '+1 234 567 8900',
        address: '123 Coffee Street, Brew City',
        profileImage: 'https://randomuser.me/api/portraits/men/32.jpg',
      );
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signup(String name, String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _user = User(
        id: '1',
        name: name,
        email: email,
      );
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _user = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> updateProfile(User updatedUser) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    _user = updatedUser;
    notifyListeners();
  }
}
