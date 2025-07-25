// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:jewish_app/core/theme/theme_manager.dart';
// import 'package:jewish_app/core/ui/components/app_button.dart';
// 
// /// A button that allows users to switch between light and dark themes
// class ThemeSwitchButton extends StatelessWidget {
//   const ThemeSwitchButton({super.key});
// 
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeManager>(
//       builder: (context, themeManager, child) {
//         return AppIconButton(
//           onPressed: () => themeManager.toggleTheme(),
//           icon: themeManager.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//           tooltip: themeManager.isDarkMode
//               ? 'Switch to Light Mode'
//               : 'Switch to Dark Mode',
//         );
//       },
//     );
//   }
// }
// 
// /// A more detailed theme selection widget with multiple options
// class ThemeSelectionWidget extends StatelessWidget {
//   const ThemeSelectionWidget({super.key});
// 
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeManager>(
//       builder: (context, themeManager, child) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.light_mode),
//               title: const Text('Light Theme'),
//               trailing: Radio<ThemeMode>(
//                 value: ThemeMode.light,
//                 groupValue: themeManager.themeMode,
//                 onChanged: (value) => themeManager.setLightTheme(),
//               ),
//               onTap: () => themeManager.setLightTheme(),
//             ),
//             ListTile(
//               leading: const Icon(Icons.dark_mode),
//               title: const Text('Dark Theme'),
//               trailing: Radio<ThemeMode>(
//                 value: ThemeMode.dark,
//                 groupValue: themeManager.themeMode,
//                 onChanged: (value) => themeManager.setDarkTheme(),
//               ),
//               onTap: () => themeManager.setDarkTheme(),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings_suggest),
//               title: const Text('System Theme'),
//               trailing: Radio<ThemeMode>(
//                 value: ThemeMode.system,
//                 groupValue: themeManager.themeMode,
//                 onChanged: (value) => themeManager.setSystemTheme(),
//               ),
//               onTap: () => themeManager.setSystemTheme(),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
