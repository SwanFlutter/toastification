import 'package:example/src/features/home/controllers/toast_detail.dart';
import 'package:example/src/features/home/views/ui_states/toast_code_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_view/flutter_code_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Code previewer widget that uses flutter_code_view package
class CodePreviewer extends ConsumerWidget {
  const CodePreviewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toastDetail = ref.watch(toastDetailControllerProvider);
    final code = ToastCodeFormatter.format(toastDetail);
    final size = MediaQuery.of(context).size;

    return FlutterCodeView(
      source: code,
      themeType: ThemeType.dark,
      autoDetection: true,
      height: 300,
      width: size.width * 0.35,
      borderColor: Colors.grey.shade400,
    );
  }
}

/// Highlight Flutter Widget
/// This is a wrapper around FlutterCodeView for backward compatibility
class CodeViewer extends StatelessWidget {
  const CodeViewer({
    super.key,
    required this.source,
    this.language,
    this.theme = const {},
    this.padding = EdgeInsets.zero,
    this.textStyle,
    this.tabSize = 8,
  });

  /// The original code to be highlighted
  final String source;

  final int tabSize;

  /// Highlight language
  final String? language;

  /// Highlight theme
  final Map<String, TextStyle> theme;

  /// Padding
  final EdgeInsetsGeometry padding;

  /// Text styles
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FlutterCodeView(
      source: source,
      themeType: ThemeType.rainbow,
      autoDetection: true,
      borderColor: Colors.grey.shade400,
    );
  }
}

const defaultTheme = {
  'root': TextStyle(
    color: Color(0xff333333),
    backgroundColor: Color(0xfff8f8f8),
  ),
  'comment': TextStyle(color: Color(0xff999988), fontStyle: FontStyle.italic),
  'quote': TextStyle(color: Color(0xff999988), fontStyle: FontStyle.italic),
  'keyword': TextStyle(color: Color(0xff008080), fontWeight: FontWeight.bold),
  'selector-tag': TextStyle(
    color: Color(0xff333333),
    fontWeight: FontWeight.bold,
  ),
  'subst': TextStyle(color: Color(0xff333333), fontWeight: FontWeight.normal),
  'number': TextStyle(color: Color(0xff008080)),
  'literal': TextStyle(color: Color(0xff008080)),
  'variable': TextStyle(color: Color(0xff008080)),
  'template-variable': TextStyle(color: Color(0xff008080)),
  'string': TextStyle(color: Color(0xffdd1144)),
  'doctag': TextStyle(color: Color(0xffdd1144)),
  'title': TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
  'section': TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
  'selector-id': TextStyle(
    color: Color(0xff990000),
    fontWeight: FontWeight.bold,
  ),
  'type': TextStyle(color: Color(0xff445588), fontWeight: FontWeight.bold),
  'tag': TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
  'name': TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
  'attribute': TextStyle(
    color: Color(0xff000080),
    fontWeight: FontWeight.normal,
  ),
  'regexp': TextStyle(color: Color(0xff009926)),
  'link': TextStyle(color: Color(0xff009926)),
  'symbol': TextStyle(color: Color(0xff990073)),
  'bullet': TextStyle(color: Color(0xff990073)),
  'built_in': TextStyle(color: Color(0xff0086b3)),
  'builtin-name': TextStyle(color: Color(0xff0086b3)),
  'meta': TextStyle(color: Color(0xff999999), fontWeight: FontWeight.bold),
  'deletion': TextStyle(backgroundColor: Color(0xffffdddd)),
  'addition': TextStyle(backgroundColor: Color(0xffddffdd)),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
  'strong': TextStyle(fontWeight: FontWeight.bold),
};
