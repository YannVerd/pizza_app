
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';


class UserProfil extends StatelessWidget{
  const UserProfil({super.key});

  
  @override
  Widget build(BuildContext context){
    return const ProfileScreen(
  providerConfigs: [
    EmailProviderConfiguration(),
    GoogleProviderConfiguration(
      clientId: '...',
    ),
    FacebookProviderConfiguration(
      clientId: '...',
    ),
    AppleProviderConfiguration(),
  ],
  avatarSize: 24,
);
  }
}