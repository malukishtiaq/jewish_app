# Home Feature

This feature contains the main home screen of the Jewish learning app, implemented based on the Figma design.

## Components

### HomeScreen
The main home screen widget that displays:
- Welcome section with search functionality
- Progress tracker for Kitzur Shulchan Aruch Yomi
- Ritual progress section with progress bars
- Statistics chart showing daily study time
- Leadership board with top locations
- Sponsorship information

### MainNavigationScreen
A wrapper screen that provides bottom navigation between:
- Home
- Library
- Settings
- Profile

### CustomProgressBar
A custom progress bar widget used in the ritual progress section.

## Usage

**For the complete home experience with bottom navigation (RECOMMENDED):**
```dart
Navigator.pushNamed(context, MainNavigationScreen.routeName);
// or
Navigator.pushNamed(context, HomeScreen.routeName); // This now goes to MainNavigationScreen
```

**For just the home content without navigation (NOT RECOMMENDED):**
```dart
// Navigate directly to HomeScreen content
Navigator.pushNamed(context, '/home-content'); // You would need to add this route
```

## Design Features

- **Responsive Layout**: Uses proper spacing and margins for different screen sizes
- **Custom Colors**: Implements the exact color scheme from the Figma design
- **Progress Indicators**: Circular progress for main tracker, linear progress bars for rituals
- **Interactive Elements**: Search functionality and navigation
- **Clean Architecture**: Separated into logical sections with reusable widgets
- **Bottom Navigation**: Integrated bottom navigation bar with proper state management

## Colors Used

- Primary Purple: `#8A5694`
- Accent Orange: `#F2A41E`
- Text Gray: `#62606E`
- Background Gray: `#F5F5F5`
- Progress Gray: `#939393`
- Error Red: `#D92934`
- Light Blue: `#4FC4D6`

## Fonts

- Taz (for headings and important text)
- Futura Std (for body text and descriptions)
- Inter (for UI elements and secondary text)

## Navigation Structure

The app now uses a proper navigation structure where **Home is part of the bottom navigation**:

1. **MainNavigationScreen** - Main container with bottom navigation (default home route)
   - **Home** (index 0) - Your beautiful home content
   - **Library** (index 1) - Library features  
   - **Settings** (index 2) - App settings
   - **Profile** (index 3) - User profile

2. **HomeScreen** - Home content only (no bottom navigation, used within MainNavigationScreen)

**Important:** When you navigate to `/home`, you now get the complete experience with bottom navigation, just like Library, Settings, and Profile. The HomeScreen is embedded within the MainNavigationScreen as the first tab.
