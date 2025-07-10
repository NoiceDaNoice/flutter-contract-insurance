import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/combined_bloc.dart';
import '../cubit/locale_cubit.dart';
import '../widget/list_view_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              final isEN = locale.languageCode == 'en';
              return IconButton(
                icon: const Icon(Icons.language),
                tooltip: isEN ? l10n.changeToBahasa : l10n.changeToEnglish,
                onPressed: () {
                  context.read<LocaleCubit>().switchLocale(
                        isEN
                            ? const Locale('id', 'ID')
                            : const Locale('en', 'US'),
                      );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<CombinedBloc, CombinedState>(
        builder: (context, state) {
          final ascending = state is CombinedLoaded ? state.ascending : true;
          return FloatingActionButton(
            tooltip: ascending ? l10n.sortDesc : l10n.sortAsc,
            onPressed: () {
              context.read<CombinedBloc>().add(SortCombinedData(!ascending));
            },
            child: Icon(ascending ? Icons.arrow_downward : Icons.arrow_upward),
          );
        },
      ),
      body: BlocBuilder<CombinedBloc, CombinedState>(
        builder: (context, state) {
          if (state is CombinedLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CombinedError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is CombinedLoaded) {
            final items = state.items;
            return ListViewData(
              items: items,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
