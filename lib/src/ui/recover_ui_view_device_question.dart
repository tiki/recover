/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import '../widgets/recover_ui_btn_elevated.dart';
import '../widgets/recover_ui_btn_text.dart';
import '../widgets/recover_ui_title.dart';

class RecoverUiViewDeviceQuestion extends StatelessWidget {

  static const String _title = 'Are you logged into another device in your possession?';
  static const String _opt1Txt = 'Yes';
  static const String _opt2Txt = 'No';

  late final String _email;
  late final RecoverService _service;

  @override
  Widget build(BuildContext context) {
    this._service = Provider.of<RecoverService>(context);
    this._email = _service.model.email!;
    return Container(
      height: MediaQuery.of(context).size.height/2,
      padding: EdgeInsets.only(top: 70, left: 20, right:20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal:20), child: RecoverUiTitle(_title)),
          Padding(padding: EdgeInsets.only(bottom:40)),
          RecoverUiBtnElevated(
              text: _opt1Txt,
              callback: () => _service.controller.goToOpenQrCode()),
          Padding(padding: EdgeInsets.only(bottom:30)),
          RecoverUiBtnText(
              text: _opt2Txt,
              callback: () => _service.controller.goToBackupRecoverFlow()),
        ],
      )
    );
  }
}
