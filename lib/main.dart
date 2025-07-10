import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_insurance_contract/bloc/combined_bloc.dart';
import 'package:flutter_insurance_contract/cubit/locale_cubit.dart';
import 'package:flutter_insurance_contract/l10n/l10n.dart';
import 'package:flutter_insurance_contract/view/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'api/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(),
        ),
        BlocProvider(
          create: (_) =>
              CombinedBloc(ApiService())..add(const FetchCombinedData()),
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, stateLocale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            supportedLocales: L10n.all,
            locale: stateLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
