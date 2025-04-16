// hash_3do_cli.dart
import 'dart:io';

import 'hash_3do_main.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Usage: dart hash_3do_cli.dart <path-to-chd-or-cue-file>');
    exit(1);
  }

  final filePath = arguments[0];
  print('Calculating 3DO hash for $filePath...');
  
  // Check if file exists
  if (!await File(filePath).exists()) {
    print('Error: File not found: $filePath');
    exit(1);
  }
  
  try {
    final hash = await Hash3DO.calculateHash(filePath);
    
    if (hash != null) {
      print('Hash: $hash');
    } else {
      print('Error: Failed to calculate hash. See log messages for details.');
      exit(1);
    }
  } catch (e, stackTrace) {
    print('Error: Exception occurred: $e');
    print('Stack trace: $stackTrace');
    exit(1);
  }
}