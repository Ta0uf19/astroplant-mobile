import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/api/definitions_api.dart';
import 'package:app/repositories/api/kits_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupInjection();
  var api = inject<DefinitionsApi>();
  var apikit = inject<KitsApi>();

  test('test api', () async {
    var listP = await api.getPeripheralDefinitions();
    var listT = await api.getQuantityTypes();
    
    print(listP);
    print(listT);
  });

}
