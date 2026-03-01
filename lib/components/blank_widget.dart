import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
            offset: Offset(
              2.0,
              2.0,
            ),
            spreadRadius: 4.0,
          )
        ],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Builder(
        builder: (context) => InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('BLANK_COMP_Container_s36v4d8m_ON_TAP');
            logFirebaseEvent('EmptyListPlaceholder_alert_dialog');
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: BlankWidget(),
                );
              },
            );
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: custom_widgets.EmptyListPlaceholder(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              showIcon: true,
            ),
          ),
        ),
      ),
    );
  }
}
