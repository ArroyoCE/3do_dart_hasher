// File: lib/3do/hash_3do_main.dart

import 'hash_3do.dart';
import 'hash_3do_cue.dart';
import 'dart:io';

/// Main class to calculate 3DO hashes
class Hash3DO {
  /// Calculate hash for a 3DO disc (supports both CHD and CUE formats)
  /// Returns the MD5 hash as a hex string, or null if an error occurs
  static Future<String?> calculateHash(String filePath) async {
    final extension = filePath.toLowerCase().split('.').last;
    
    switch (extension) {
      case 'chd':
        return Hash3DOCalculator.calculateHash(filePath);
        
      case 'cue':
        return Hash3DOCueCalculator.calculateHash(filePath);
        
      default:
        print('Unsupported file extension for 3DO hashing: $extension');
        return null;
    }
  }
}