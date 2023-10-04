import 'package:flutter_test/flutter_test.dart';

import 'package:new_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // arrange
    const app = App();

    // act
    await tester.pumpWidget(app);

    // assert
    expect(find.text('new app'), findsOneWidget);
  });
}
