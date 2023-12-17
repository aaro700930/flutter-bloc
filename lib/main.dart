import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UsernameCubit>()),
        BlocProvider(create: (context) => getIt<RouterSimpleCubit>()),
        BlocProvider(create: (context) => getIt<CounterCubit>()),
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(create: (context) => getIt<GuestsBloc>()),
        BlocProvider(
          create: (context) => getIt<PokemonBloc>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

void main() {
  serviceLocatorInit();
  runApp(const BlocsProvider());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.read<RouterSimpleCubit>().state;
    final themeCubit = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: themeCubit.isDarkmode).getTheme(),
    );
  }
}
