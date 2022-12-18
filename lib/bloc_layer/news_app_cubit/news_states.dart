abstract class NewsAppStates{}
class InitialState extends NewsAppStates{}
class NavBarState extends NewsAppStates{}

class GetBusinessDataLoading extends NewsAppStates{}
class GetBusinessDataSuccess extends NewsAppStates{}
class GetBusinessDataError extends NewsAppStates{
  final String error;

  GetBusinessDataError(this.error);
}

class GetSportsDataLoading extends NewsAppStates{}
class GetSportsDataSuccess extends NewsAppStates{}
class GetSportsDataError extends NewsAppStates{
  final String error;

  GetSportsDataError(this.error);
}

class GetScienceDataLoading extends NewsAppStates{}
class GetScienceDataSuccess extends NewsAppStates{}
class GetScienceDataError extends NewsAppStates{
  final String error;

  GetScienceDataError(this.error);
}

class GetSearchDataLoading extends NewsAppStates{}
class GetSearchDataSuccess extends NewsAppStates{}
class GetSearchDataError extends NewsAppStates{
  final String error;

  GetSearchDataError(this.error);
}

class ThemModeState extends NewsAppStates{}

