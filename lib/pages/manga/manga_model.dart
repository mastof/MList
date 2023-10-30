import '/comp/empty_list/empty_list_widget.dart';
import '/comp/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'manga_widget.dart' show MangaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MangaModel extends FlutterFlowModel<MangaWidget> {
  ///  Local state fields for this page.

  bool search = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emptyListModel = createModel(context, () => EmptyListModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emptyListModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
