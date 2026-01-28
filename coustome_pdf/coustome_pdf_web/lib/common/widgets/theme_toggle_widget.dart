/*
 * Project      : gudbuks
 * File         : theme_toggle_widget.dart
 * Description  : Theme toggle widget for switching between light/dark/system themes
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/services/theme_service.dart';

class ThemeToggleWidget extends StatelessWidget {
  final bool showLabel;
  final bool showIcon;
  final double? iconSize;
  final Color? iconColor;
  final String? tooltip;

  const ThemeToggleWidget({
    Key? key,
    this.showLabel = true,
    this.showIcon = true,
    this.iconSize,
    this.iconColor,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeService>(
      builder: (themeService) {
        return PopupMenuButton<ThemeMode>(
          tooltip: tooltip ?? 'Change Theme',
          icon: _buildIcon(themeService),
          onSelected: (ThemeMode mode) => _handleThemeChange(themeService, mode),
          itemBuilder: (BuildContext context) => _buildMenuItems(themeService),
          child: showLabel ? _buildLabel(themeService) : null,
        );
      },
    );
  }

  Widget _buildIcon(ThemeService themeService) {
    if (!showIcon) return const SizedBox.shrink();
    
    return Icon(
      themeService.getThemeModeIcon(themeService.themeMode),
      size: iconSize ?? 24,
      color: iconColor,
    );
  }

  Widget _buildLabel(ThemeService themeService) {
    if (!showLabel) return const SizedBox.shrink();
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Icon(
            themeService.getThemeModeIcon(themeService.themeMode),
            size: iconSize ?? 20,
            color: iconColor,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          themeService.getThemeModeName(themeService.themeMode),
          style: Theme.of(Get.context!).textTheme.bodyMedium,
        ),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }

  List<PopupMenuEntry<ThemeMode>> _buildMenuItems(ThemeService themeService) {
    return themeService.availableThemeModes.map((ThemeMode mode) {
      final isSelected = themeService.themeMode == mode;
      
      return PopupMenuItem<ThemeMode>(
        value: mode,
        child: Row(
          children: [
            Icon(
              themeService.getThemeModeIcon(mode),
              size: 20,
              color: isSelected ? Theme.of(Get.context!).primaryColor : null,
            ),
            const SizedBox(width: 12),
            Text(
              themeService.getThemeModeName(mode),
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Theme.of(Get.context!).primaryColor : null,
              ),
            ),
            if (isSelected) ...[
              const Spacer(),
              Icon(
                Icons.check,
                size: 16,
                color: Theme.of(Get.context!).primaryColor,
              ),
            ],
          ],
        ),
      );
    }).toList();
  }

  void _handleThemeChange(ThemeService themeService, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        themeService.switchToLightTheme();
        break;
      case ThemeMode.dark:
        themeService.switchToDarkTheme();
        break;
      case ThemeMode.system:
        themeService.switchToSystemTheme();
        break;
    }
  }
}

/// Simple theme toggle button that switches between light and dark
class SimpleThemeToggle extends StatelessWidget {
  final double? iconSize;
  final Color? iconColor;
  final String? tooltip;

  const SimpleThemeToggle({
    Key? key,
    this.iconSize,
    this.iconColor,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeService>(
      builder: (themeService) {
        return IconButton(
          tooltip: tooltip ?? 'Toggle Theme',
          icon: Icon(
            themeService.isDarkMode 
                ? Icons.light_mode 
                : Icons.dark_mode,
            size: iconSize ?? 24,
            color: iconColor,
          ),
          onPressed: () => themeService.toggleTheme(),
        );
      },
    );
  }
}

/// Theme mode selector with radio buttons
class ThemeModeSelector extends StatelessWidget {
  final String? title;
  final bool showTitle;

  const ThemeModeSelector({
    Key? key,
    this.title,
    this.showTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeService>(
      builder: (themeService) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showTitle && title != null) ...[
              Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
            ],
            ...themeService.availableThemeModes.map((mode) {
              final isSelected = themeService.themeMode == mode;
              
              return RadioListTile<ThemeMode>(
                title: Row(
                  children: [
                    Icon(
                      themeService.getThemeModeIcon(mode),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(themeService.getThemeModeName(mode)),
                  ],
                ),
                value: mode,
                groupValue: themeService.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    _handleThemeChange(themeService, value);
                  }
                },
                activeColor: Theme.of(context).primaryColor,
              );
            }),
          ],
        );
      },
    );
  }

  void _handleThemeChange(ThemeService themeService, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        themeService.switchToLightTheme();
        break;
      case ThemeMode.dark:
        themeService.switchToDarkTheme();
        break;
      case ThemeMode.system:
        themeService.switchToSystemTheme();
        break;
    }
  }
}
