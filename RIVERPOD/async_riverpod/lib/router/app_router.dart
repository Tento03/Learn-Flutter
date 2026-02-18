import 'package:async_riverpod/home_page.dart';
import 'package:async_riverpod/ui/CreatePage.dart';
import 'package:async_riverpod/ui/GetAllPage.dart';
import 'package:async_riverpod/ui/GetDetailPage.dart';
import 'package:async_riverpod/ui/UpdatePage.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => HomePage()),
    GoRoute(path: "/get-all", builder: (context, state) => GetAllPage()),
    GoRoute(
      path: "/detail/:id",
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return GetDetailPage(id: id);
      },
    ),
    GoRoute(path: "/create", builder: (context, state) => CreatePage()),
    GoRoute(
      path: "/update/:id",
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return UpdatePage(id: id);
      },
    ),
  ],
);
