import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Brand introduction. Navigation belongs to the app's initialization flow.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _loading = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _loading.stop();
      _loading.value = 0;
    } else if (!_loading.isAnimating) {
      _loading.repeat();
    }
  }

  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xFFF3F9FF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = math.min(constraints.maxWidth, 560.0);
              final illustrationSize = math.min(
                width,
                constraints.maxHeight * .54,
              );
              final logoSize = (width * .29).clamp(88.0, 138.0);
              return Center(
                child: SizedBox(
                  width: width,
                  height: constraints.maxHeight,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: illustrationSize,
                        child: ExcludeSemantics(
                          child: Image.asset(
                            'assets/images/splash/applyflow_splash_illustration.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        bottom: illustrationSize * .94,
                        child: LayoutBuilder(
                          builder: (context, header) => SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: header.maxHeight,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: header.maxHeight * .12),
                                    ExcludeSemantics(
                                      child: Image.asset(
                                        'assets/images/splash/applyflow_logo.png',
                                        width: logoSize,
                                        height: logoSize,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Semantics(
                                      header: true,
                                      child: Text(
                                        'ApplyFlow',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: (width * .112).clamp(
                                            34.0,
                                            54.0,
                                          ),
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: -1.8,
                                          height: 1.12,
                                          color: const Color(0xFF06164E),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Find opportunities.\nSend applications. Track your progress.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: (width * .041).clamp(
                                          14.0,
                                          21.0,
                                        ),
                                        height: 1.35,
                                        letterSpacing: -.3,
                                        color: const Color(0xFF647897),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: MediaQuery.paddingOf(context).bottom + 28,
                        child: Semantics(
                          label: 'Loading ApplyFlow',
                          child: ExcludeSemantics(
                            child: AnimatedBuilder(
                              animation: _loading,
                              builder: (context, child) {
                                final active = (_loading.value * 3).floor() % 3;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    3,
                                    (index) => Container(
                                      width: 10,
                                      height: 10,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: index == active
                                            ? const Color(0xFF007AFF)
                                            : const Color(0xFFADD2FF),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
