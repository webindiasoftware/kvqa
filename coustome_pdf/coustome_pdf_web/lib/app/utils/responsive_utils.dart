/*
 * Project      : gudbuks
 * File         : responsive_utils.dart
 * Description  : Responsive design utilities
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1200;

  // Screen size helpers
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  static bool isMobileOrTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletBreakpoint;
  }

  // Responsive padding
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16.0);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24.0);
    } else {
      return const EdgeInsets.all(32.0);
    }
  }

  // Responsive font size
  static double getResponsiveFontSize(BuildContext context, {
    double mobile = 14.0,
    double tablet = 16.0,
    double desktop = 18.0,
  }) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Responsive spacing
  static double getResponsiveSpacing(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Get responsive star size that won't overflow
  static double getResponsiveStarSize(BuildContext context, {
    double mobile = 32.0,
    double tablet = 36.0,
    double desktop = 40.0,
    int maxStars = 5,
  }) {
    final screenWidth = getScreenWidth(context);
    final isMobile = screenWidth < mobileBreakpoint;
    final isTablet = screenWidth >= mobileBreakpoint && screenWidth < tabletBreakpoint;
    
    // Base size based on screen type
    double baseSize = isMobile ? mobile : (isTablet ? tablet : desktop);
    
    // Calculate spacing between stars
    double spacing = isMobile ? 2.w : (isTablet ? 3.w : 4.w);
    
    // Calculate total width needed
    double totalWidth = (baseSize * maxStars) + (spacing * (maxStars - 1));
    
    // Maximum available width (80% of screen width)
    double maxAvailableWidth = screenWidth * 0.8;
    
    // If total width exceeds available width, scale down
    if (totalWidth > maxAvailableWidth) {
      baseSize = (maxAvailableWidth - (spacing * (maxStars - 1))) / maxStars;
    }
    
    return baseSize;
  }

  // Get responsive star spacing
  static double getResponsiveStarSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 2.w;
    } else if (isTablet(context)) {
      return 3.w;
    } else {
      return 4.w;
    }
  }

  // Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Check if device is in landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Check if device is in portrait mode
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  // Get available height (screen height - safe area - app bar)
  static double getAvailableHeight(BuildContext context, {double appBarHeight = 0}) {
    final screenHeight = getScreenHeight(context);
    final safeArea = getSafeAreaPadding(context);
    return screenHeight - safeArea.top - safeArea.bottom - appBarHeight;
  }

  static Size getScreenDesignSize(BuildContext context, bool kIsWeb){
    Size designSize;
    if (kIsWeb) {
      designSize = Size(1440, 1024); // Web
    } else if (isTablet(context)) {
      designSize = Size(800, 1280); // Tablet
    } else {
      designSize = Size(412, 893); // Mobile
    }
    return designSize;
  }

} 