import 'package:flutter_error_handling_core/flutter_error_handling_core.dart'
    as core;
import 'package:flutter_error_handling_data/flutter_error_handling_data.dart'
    as data;
import 'package:flutter_error_handling_ui/flutter_error_handling_ui.dart' as ui;
import 'package:get_it/get_it.dart';

void main() async {
  final dataDependencies = await data.bootstrap();
  dataDependencies.registerAll();

  await GetIt.instance.allReady();

  final coreDependencies = await core.bootstrap();
  coreDependencies.registerAll();

  await GetIt.instance.allReady();

  await ui.boot();
}
