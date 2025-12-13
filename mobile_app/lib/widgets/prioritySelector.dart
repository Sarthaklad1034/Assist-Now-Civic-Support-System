// lib/ui/widgets/priority_selector.dart
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/issueModel.dart';
import '../widgets/prioritySelector.dart';

class PrioritySelector extends StatelessWidget {
  final IssuePriority value;
  final ValueChanged<IssuePriority> onChanged;

  const PrioritySelector({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: ChoiceChip(
            label:  Text(AppLocalizations.of(context)!.low),
            selected: value == IssuePriority.low,
            onSelected: (sel) => onChanged(IssuePriority.low),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ChoiceChip(
            label:  Text(AppLocalizations.of(context)!.medium),
            selected: value == IssuePriority.medium,
            onSelected: (sel) => onChanged(IssuePriority.medium),
          ),
        ),
        Expanded(
          child: ChoiceChip(
            label:  Text(AppLocalizations.of(context)!.high ),
            selected: value == IssuePriority.high,
            onSelected: (sel) => onChanged(IssuePriority.high),
          ),
        ),
      ],
    );
  }
}
