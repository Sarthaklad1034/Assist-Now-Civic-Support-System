import 'package:flutter/material.dart';
import 'package:mobile_app/l10n/app_localizations_en.dart';

import '../l10n/app_localizations.dart';

class LocationTile extends StatelessWidget {
  final String? address;
  final bool loading;
  final VoidCallback onRefresh;

  const LocationTile({
    super.key,
    required this.address,
    required this.loading,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.location_on),
      title: Text(address ?? 'Location not set'),
      subtitle: Text(loading ? 'Fetching current location...' : AppLocalizations.of(context)!.currentLocation),
      trailing: IconButton(
        tooltip: 'Refresh location',
        onPressed: loading ? null : onRefresh,
        icon: loading ? const SizedBox(
          width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2),
        ) : const Icon(Icons.refresh),
      ),
    );
  }
}
