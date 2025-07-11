import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusUtils {
  static String localizedStatus(BuildContext context, String status) {
    final l10n = AppLocalizations.of(context)!;
    return switch (status.toLowerCase()) {
      'active' => l10n.statusActive,
      'finished' => l10n.statusFinished,
      'rejected' => l10n.statusRejected,
      _ => status,
    };
  }

  static Color statusColor(String status) {
    return switch (status.toLowerCase()) {
      'active' => Colors.green,
      'finished' => Colors.blue,
      'rejected' => Colors.red,
      _ => Colors.black,
    };
  }
}
