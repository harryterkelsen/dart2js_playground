// Copyright (c) 2017, het. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:dart2js_playground/compile_service/compile_service.dart';
import 'package:dart2js_playground/src/initial_values.dart';



@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  providers: const [CompileService],
)
class AppComponent {
  final CompileService compileService;

  String code = initialCode;

  String output = initialOutput;

  bool compiling = false;

  AppComponent(this.compileService);

  Future<Null> compile() async {
    compiling = true;
    output = await compileService.compile(code);
    compiling = false;
  }
}
