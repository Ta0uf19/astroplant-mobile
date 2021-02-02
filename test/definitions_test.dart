import 'package:app/di/injector_provider.dart';
import 'package:app/repositories/definitions_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupInjection();
  var definitionRepository = inject<DefinitionRepository>();

  test('test api', () async {
    var listP = await definitionRepository.getPeripheralDefinitions();
    var listT = await definitionRepository.getQuantityTypes();
    
    print(listP);
    print(listT);
  });

}
