import 'dart:io';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class PhotoUploader extends StatelessWidget {
  final File? photo;
  final VoidCallback onPickCamera;
  final VoidCallback onPickGallery;
  final VoidCallback? onRemove;

  const PhotoUploader({
    super.key,
    required this.photo,
    required this.onPickCamera,
    required this.onPickGallery,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.dividerColor),
            ),
            child: Stack(
              children: [
                if (photo != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(photo!, fit: BoxFit.cover, width: double.infinity),
                  )
                else
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.tapToAddPhoto,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  // ✅ Fixed with conditional operator
                  child: (photo != null && onRemove != null)
                      ? IconButton(
                    tooltip: 'Remove',
                    onPressed: onRemove,
                    icon: const Icon(Icons.close),
                  )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPickCamera,
                icon: const Icon(Icons.camera_alt),
                label:  Text(AppLocalizations.of(context)!.camera),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPickGallery,
                icon: const Icon(Icons.photo_library),
                label: Text(AppLocalizations.of(context)!.gallery),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
