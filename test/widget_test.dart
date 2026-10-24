import 'package:applyflow/app/app.dart';
import 'package:applyflow/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Splash renders on compact and large screens with accessible text',
    (tester) async {
      for (final size in [
        const Size(320, 568),
        const Size(430, 932),
        const Size(932, 430),
      ]) {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(const ApplyFlowApp());
        await tester.pump(const Duration(milliseconds: 700));
        expect(find.text('ApplyFlow'), findsOneWidget);
        expect(find.byType(Image), findsNWidgets(2));
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox.shrink());
      }
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    },
  );

  testWidgets('Splash supports reduced motion and large text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            disableAnimations: true,
            textScaler: TextScaler.linear(2),
          ),
          child: SplashPage(),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 2));
    expect(tester.takeException(), isNull);
  });
}
