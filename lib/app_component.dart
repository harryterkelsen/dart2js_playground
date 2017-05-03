// Copyright (c) 2017, het. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:dart2js_playground/src/compile_service.dart';
import 'package:dart2js_playground/src/example_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  providers: const [CompileService, ExampleService],
)
class AppComponent implements OnInit {
  final CompileService compileService;
  Map<String, String> examples;

  String code;
  String output;

  bool compiling = false;

  @ViewChild('alert')
  ElementRef alert;

  AppComponent(this.compileService, ExampleService exampleService) {
    examples = exampleService.examples;
    code = examples['Greeter'];
  }

  @override
  Future<Null> ngOnInit() async {
    await compile();
  }

  Future<Null> compile() async {
    compiling = true;
    var result = await compileService.compile(code);
    if (result == null) {
      output = '';
      alert.nativeElement.classes.remove('hidden');
    } else {
      output = result;
      alert.nativeElement.classes.add('hidden');
    }
    compiling = false;
  }

  Future<Null> selectExample(String example) async {
    code = examples[example];
    await compile();
  }
}
