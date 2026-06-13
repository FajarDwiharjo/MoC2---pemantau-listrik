import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  AppSizes.md,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.smallRadius,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Application',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Electrical Panel Monitoring',
                    ),

                    Text(
                      'Version 1.0 MVP',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  AppSizes.md,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.smallRadius,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Developer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Built using Flutter',
                    ),

                    Text(
                      'Realtime monitoring MVP',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  AppSizes.md,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.smallRadius,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Future Features',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      '• Firebase Integration',
                    ),

                    Text(
                      '• ESP32 Integration',
                    ),

                    Text(
                      '• Alarm System',
                    ),

                    Text(
                      '• Push Notifications',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.popUntil(
                    //   context,
                    //   (route) => route.isFirst,
                    // );
                  },
                  child: const Text(
                    'Logout',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

