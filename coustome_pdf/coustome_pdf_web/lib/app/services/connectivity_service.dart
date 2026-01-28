/*
 * Project      : gudbuks
 * File         : connectivity_service.dart
 * Description  : Common service for monitoring network connectivity
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:common_base/utils/logger.dart';

/// Common service for monitoring network connectivity status
/// This service is shared across the app to avoid code duplication
/// Uses GetXService for automatic permanent lifecycle management
class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Observable connectivity status
  final RxBool isConnected = true.obs;
  
  // Previous connectivity result for tracking changes
  List<ConnectivityResult>? _previousConnectivityResult;
  bool _wasPreviouslyDisconnected = false;

  @override
  void onInit() {
    super.onInit();
    _initConnectivityMonitoring();
  }

  /// Initialize connectivity monitoring
  void _initConnectivityMonitoring() {
    try {
      // Get initial connectivity state
      _connectivity.checkConnectivity().then((results) {
        _previousConnectivityResult = results;
        _updateConnectionStatus(results);
        LogHelper.info('Initial connectivity state: $results');
      });

      // Listen to connectivity changes
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        (List<ConnectivityResult> results) {
          _updateConnectionStatus(results);
        },
        onError: (error) {
          LogHelper.error('Connectivity monitoring error: $error');
          isConnected.value = false;
        },
      );

      LogHelper.info('Connectivity monitoring initialized');
    } catch (e) {
      LogHelper.error('Failed to initialize connectivity monitoring: $e');
      isConnected.value = false;
    }
  }

  /// Update connection status based on connectivity results
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final wasConnected = isConnected.value;
    final isCurrentlyConnected = results.any(
      (result) => result != ConnectivityResult.none,
    );
    
    // Track if we were previously disconnected
    _wasPreviouslyDisconnected = _previousConnectivityResult == null ||
        _previousConnectivityResult!.every(
          (result) => result == ConnectivityResult.none,
        );
    
    isConnected.value = isCurrentlyConnected;
    
    // Log connectivity changes
    if (wasConnected != isCurrentlyConnected) {
      LogHelper.info(
        'Connectivity changed: Previous: $_previousConnectivityResult, Current: $results, Status: ${isCurrentlyConnected ? "Connected" : "Disconnected"}',
      );
    }
    
    _previousConnectivityResult = results;
  }

  /// Check if connection was just restored (from offline to online)
  /// This should be checked immediately after a connectivity change
  bool get wasConnectionRestored {
    return isConnected.value && _wasPreviouslyDisconnected;
  }

  /// Get current connectivity results
  List<ConnectivityResult>? get currentConnectivityResults => _previousConnectivityResult;

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
    super.onClose();
  }
}


