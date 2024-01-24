import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:theme_app/Shared/core/utils/app_router.dart';
import 'package:theme_app/Shared/core/utils/cache_helper.dart';
import 'package:theme_app/Shared/style/themes.dart';
import 'package:theme_app/features/settings/presentation/blocs/localization/local_cubit.dart';
import 'package:theme_app/features/settings/presentation/blocs/localization/local_state.dart';
import 'package:theme_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalCubit(),
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          if(state is ChangeLocalState){
            return MaterialApp.router(
              locale: state.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Template',
            theme: AppThemes.dark,
          );
          }return const SizedBox();
        },
      ),
    );
  }
}
