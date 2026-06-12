// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import '../Localization/LanguageConstants.dart';
import '../Utility/WidgetUtility.dart';

// ─── Loading Widgets ─────────────────────────────────────────────────────────

Widget LoadDialog(BuildContext context) {
  return const Center(
    child: SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: Color(0xFF1A1A2E),
      ),
    ),
  );
}

Widget ShowDialog(BuildContext context) {
  final label = getTranslated(context, 'PROCESSING') ?? 'ກຳລັງປະມວນຜົນ...';
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 8,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF1A1A2E),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

class DialogBuilder {
  DialogBuilder(this.context);
  final BuildContext context;

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ShowDialog(context),
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

// ─── Dialog Helpers ──────────────────────────────────────────────────────────

Future DialogSucessfull(
    BuildContext context,
    String title,
    String message,
    VoidCallback btnOkOnPress,
    ) async {
  final continueLabel = getTranslated(context, 'CONTINUE') ?? 'Continue';
  showDialog(
    context: context,
    builder: (_) => _AppDialog(
      iconWidget: const Icon(Icons.check_circle_rounded,
          color: Color(0xFF4CAF50), size: 56),
      title: title,
      message: message,
      actions: [
        _DialogButton(
            label: continueLabel,
            color: Colors.blue,
            onPressed: btnOkOnPress),
      ],
    ),
  );
}

Future DialogConfirm(
    BuildContext context,
    String title,
    String message,
    VoidCallback btnOkOnPress,
    ) async {
  final continueLabel = getTranslated(context, 'CONTINUE') ?? 'Continue';
  final cancelLabel = getTranslated(context, 'CANCEL') ?? 'Cancel';
  showDialog(
    context: context,
    builder: (_) => _AppDialog(
      iconWidget: const Icon(Icons.warning_amber_rounded,
          color: Color(0xFFFFC107), size: 56),
      title: title,
      message: message,
      actions: [
        _DialogButton(
            label: continueLabel,
            color: Colors.blue,
            onPressed: btnOkOnPress),
        _DialogButton(
            label: cancelLabel,
            color: Colors.red,
            onPressed: () => Navigator.pop(context)),
      ],
    ),
  );
}

Future DialogFail(
    BuildContext context,
    String title,
    String message,
    ) async {
  final continueLabel = getTranslated(context, 'CONTINUE') ?? 'Continue';
  showDialog(
    context: context,
    builder: (_) => _AppDialog(
      iconWidget: const Icon(Icons.cancel_rounded,
          color: Color(0xFFF44336), size: 56),
      title: title,
      message: message,
      actions: [
        _DialogButton(
            label: continueLabel,
            color: Colors.blue,
            onPressed: () => Navigator.pop(context)),
      ],
    ),
  );
}

Future DialogFailConfirm(
    BuildContext context,
    String title,
    String message,
    VoidCallback btnOkOnPress,
    ) async {
  final continueLabel = getTranslated(context, 'CONTINUE') ?? 'Continue';
  final cancelLabel = getTranslated(context, 'CANCEL') ?? 'Cancel';
  showDialog(
    context: context,
    builder: (_) => _AppDialog(
      iconWidget: const Icon(Icons.cancel_rounded,
          color: Color(0xFFF44336), size: 56),
      title: title,
      message: message,
      actions: [
        _DialogButton(
            label: continueLabel,
            color: Colors.blue,
            onPressed: btnOkOnPress),
        _DialogButton(
            label: cancelLabel,
            color: Colors.red,
            onPressed: () => Navigator.pop(context)),
      ],
    ),
  );
}

// ─── Reusable Dialog ─────────────────────────────────────────────────────────

class _AppDialog extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final String message;
  final List<Widget> actions;

  const _AppDialog({
    required this.iconWidget,
    required this.title,
    required this.message,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: 340,
        padding:
        const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            const SizedBox(height: 16),
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E)),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(message,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.5),
                textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: actions
                  .map((a) => Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6),
                  child: a))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _DialogButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 0,
        padding:
        const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w600)),
    );
  }
}