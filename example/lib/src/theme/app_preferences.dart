import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Theme mode used by the interactive example.
final appThemeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

/// Text direction used by the interactive example (language switch demo).
final appDirectionProvider =
    StateProvider<TextDirection>((ref) => TextDirection.ltr);
