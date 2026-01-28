/*
 * Project      : DigitalSignage
 * File         : multi_tab_guard_web.dart
 * Description  : 
 * Author       : BALAJI
 * Date         : 2025-06-23
 * Version      : 1.0
 * Ticket       : 
 */

/*
 * Project      : mctc-supplychain
 * File         : multi_tab_guard_web.dart
 * Description  :
 * Author       : kannappan
 * Date         : 2025-06-22
 * Version      : 1.0
 * Ticket       :
 */
import 'dart:html' as html;

void preventMultiTab() {
  const key = 'app_tab_id';
  final currentTabId = DateTime.now().millisecondsSinceEpoch.toString();

  if (html.window.localStorage.containsKey(key)) {
    html.window.alert('This application is already open in another tab. Please use that tab to continue.');
    html.window.location.href = 'about:blank';
    return;
  }

  html.window.localStorage[key] = currentTabId;

  html.window.onBeforeUnload.listen((event) {
    html.window.localStorage.remove(key);
  });

  html.window.onStorage.listen((event) {
    if (event.key == key && event.newValue != currentTabId) {
      html.window.alert('This tab is now disabled.');
      html.window.location.href = 'about:blank';
    }
  });

  blockRightClickWithMessage();
}

void blockRightClickWithMessage() {
  html.document.onContextMenu.listen((event) {
    event.preventDefault();
    html.window.alert('Right-click is disabled on this application.');
  });
}
