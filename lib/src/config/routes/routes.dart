
import 'import.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/pagina1': (context) => const Pagina1(),
    '/pagina2': (context) => const Pagina2(),
    '/pagina3': (context) => Pagina3(),
  };
}

