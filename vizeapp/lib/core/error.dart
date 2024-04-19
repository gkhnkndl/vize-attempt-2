import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "404 - not found",
                style: TextStyle(fontSize: 45, color: Colors.red),
              ),
              const Gap(20),
              IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(CupertinoIcons.chevron_back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
