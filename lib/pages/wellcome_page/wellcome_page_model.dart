import '/comp/empty_list/empty_list_widget.dart';
import '/comp/nav_bar/nav_bar_widget.dart';
import '/comp/perfil/perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'wellcome_page_widget.dart' show WellcomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WellcomePageModel extends FlutterFlowModel<WellcomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Perfil component.
  late PerfilModel perfilModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    perfilModel = createModel(context, () => PerfilModel());
    navBarModel = createModel(context, () => NavBarModel());
    emptyListModel = createModel(context, () => EmptyListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    perfilModel.dispose();
    navBarModel.dispose();
    emptyListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
