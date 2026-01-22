import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'blank_model.dart';
export 'blank_model.dart';

class BlankWidget extends StatefulWidget {
  const BlankWidget({super.key});

  @override
  State<BlankWidget> createState() => _BlankWidgetState();
}

class _BlankWidgetState extends State<BlankWidget> {
  late BlankModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Color(0x33000000),
            offset: Offset(2.0, 2.0),
            spreadRadius: 4.0,
          ),
        ],

        borderRadius: BorderRadius.circular(24.0),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Image.asset(
          'assets/images/1_copy.png',
          width: 300.0,
          height: 300.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
