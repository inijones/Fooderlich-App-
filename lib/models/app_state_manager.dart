import 'dart:async';
import 'package:flutter/material.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  // 3
  bool _loggedIn = false;
  // 4
  bool _onboardingComplete = false;
  // 5
  int _selectedTab = FooderlichTab.explore;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  // TODO: Add initializeApp
  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      // 8
      _initialized = true;
      // 9
      notifyListeners();
    });
  }

  // TODO: Add login
  void login(String username, String password) {
    // 10
    _loggedIn = true;
    // 11
    notifyListeners();
  }

  // TODO: Add completeOnboarding
  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  // TODO: Add goToTab
  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  // TODO: Add goToRecipes
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  // TODO: Add logout
  void logout() {
    // 12
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;
    // 13
    initializeApp();
    // 14
    notifyListeners();
  }
}