import 'package:fit_app/features/home/presentation/views/home_view.dart';
import 'package:fit_app/features/login/presentation/views/login_view.dart';
import 'package:fit_app/features/login/presentation/views/second_login_view.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/edit_view.dart';
import 'package:fit_app/features/splash/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/",builder: (context, state) => const Splash(),),
  GoRoute(path: "/loginView",builder: (context, state) => const LoginView(),),
  GoRoute(path: "/secondLoginView",builder: (context, state) => const SecondLoginView(),),
  GoRoute(path: "/homeView",builder: (context, state) => const HomeView(),),
  GoRoute(path: "/editView",builder: (context, state) => const EditView(),),

]);
