// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class EmptyListPlaceholder extends StatefulWidget {
  const EmptyListPlaceholder({
    Key? key,
    this.width,
    this.height,
    this.title,
    this.description,
    required this.showIcon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? title;
  final String? description;
  final bool showIcon;

  @override
  State<EmptyListPlaceholder> createState() => _EmptyListPlaceholderState();
}

class _EmptyListPlaceholderState extends State<EmptyListPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.showIcon)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Icon(
                Icons.inbox_outlined,
                size: 64.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
          Text(
            widget.title ?? 'No items found',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.copyWith(
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          if (widget.description != null && widget.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.description!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
