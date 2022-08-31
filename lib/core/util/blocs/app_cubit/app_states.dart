abstract class AppStates {}

class InitState extends AppStates {}

class LoadingDailyWeather extends AppStates {}
class SuccessDailyWeather extends AppStates {}
class ErrorDailyWeather extends AppStates {}



class LoadingSearchDailyWeather extends AppStates {}
class SuccessSearchDailyWeather extends AppStates {}
class ErrorSearchDailyWeather extends AppStates {}



class LoadingDaysWeather extends AppStates {}
class SuccessDaysWeather extends AppStates {}
class ErrorDaysWeather extends AppStates {}



class LoadingSearchDaysWeather extends AppStates {}
class SuccessSearchDaysWeather extends AppStates {}
class ErrorSearchDaysWeather extends AppStates {}


class LoadingFavoriteWeather extends AppStates {}
class SuccessFavoriteWeather extends AppStates {}
class ErrorFavoriteWeather extends AppStates {}


class ClearSearchPage extends AppStates {}





