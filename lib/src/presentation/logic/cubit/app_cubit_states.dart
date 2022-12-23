abstract class AppStates {}

class AppInit extends AppStates {}

class BottomNavigator extends AppStates {}

class LodaingGetNews extends AppStates {}

class GetNewsSuccess extends AppStates {}

class GetNewsErorr extends AppStates {
  final String error;

  GetNewsErorr(this.error);
}

class LodaingGetSportsNews extends AppStates {}

class GetSportsNewsSuccess extends AppStates {}

class GetSportsNewsErorr extends AppStates {
  final String error;

  GetSportsNewsErorr(this.error);
}

class LodaingGetScienceNews extends AppStates {}

class GetScienceNewsSuccess extends AppStates {}

class GetScienceNewsErorr extends AppStates {
  final String error;

  GetScienceNewsErorr(this.error);
}

class LodaingGetSearchNews extends AppStates {}

class GetSearchNewsSuccess extends AppStates {}

class GetSearchNewsErorr extends AppStates {
  final String error;

  GetSearchNewsErorr(this.error);
}

class ChangeModeTheme extends AppStates {}
