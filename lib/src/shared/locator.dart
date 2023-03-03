part of '../../stuck_my_money.dart';

final _getIt = GetIt.instance;
final theme = _getIt<UITheme>();
final user = _getIt<User>();

void setupLocator() {
  _getIt.registerSingleton<UITheme>(UITheme());
  _getIt.registerSingleton<User>(User.dummy);
}

class UITheme {
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;
  set changeThemeMode(ThemeMode themeMode) => _themeMode = themeMode;

  ThemeData themeLight = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: Colors.white,
  );
  ThemeData themeDark = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: Colors.black,
  );
}
