AI Coding Assistant Rulebook for the Jewish App
1. Core Principles
This project is built on a foundation of Clean Architecture to ensure separation of concerns, scalability, and testability. All generated code must adhere to these core principles.

Architecture: Clean Architecture is mandatory. All features are separated into three layers: Data, Domain, and Presentation.

State Management: We use BLoC, specifically the Cubit pattern, for all state management.

Dependency Injection: We use the get_it and injectable packages for managing dependencies. All Cubits, UseCases, Repositories, and DataSources must be registered.

2. Folder Structure
Every new feature must be created within the lib/features/ directory. For any new feature named [feature_name], the following folder structure is required:

lib/features/[feature_name]/
|-- data/
|   |-- datasource/
|   |   `-- i_[feature_name]_remote.dart
|   |   `-- [feature_name]_remote.dart
|   |-- model/
|   |   `-- [model_name]_model.dart
|   |-- param/
|   |   `-- [param_name]_param.dart
|   `-- repository/
|       `-- [feature_name]_repository.dart
|-- domain/
|   |-- entity/
|   |   `-- [entity_name]_entity.dart
|   |-- repository/
|   |   `-- i_[feature_name]_repository.dart
|   `-- usecase/
|       `-- [use_case_name]_usecase.dart
`-- presentation/
    |-- screen/
    |   `-- [feature_name]_screen.dart
    `-- state_m/
        |-- [feature_name]_cubit.dart
        |-- [feature_name]_cubit.freezed.dart
        `-- [feature_name]_state.dart

3. Naming Conventions
Strict adherence to these naming conventions is required.

Element

Convention

Example

File Names

snake_case.dart

login_screen.dart, account_cubit.dart

Classes

PascalCase

LoginScreen, AccountCubit

Repositories (Interface)

I + PascalCase + Repository

IAccountRepository

Repositories (Implementation)

PascalCase + Repository

AccountRepository

DataSources (Interface)

I + PascalCase + Remote

IAccountRemote

DataSources (Implementation)

PascalCase + Remote

AccountRemote

Use Cases

PascalCase + UseCase

LoginUseCase

Cubits

PascalCase + Cubit

AccountCubit

Cubit States

PascalCase + State

AccountState

Entities (Domain)

PascalCase + Entity

AuthenticationEntity

Models (Data)

PascalCase + Model

AuthenticationModel

4. Code Generation Workflow
Follow this two-step process for creating new features.

Step A: Generate the UI First (Frontend)
When given a Figma screenshot, the initial task is to create the static, stateless UI view.

File Location: lib/features/[feature_name]/presentation/screen/[feature_name]_screen.dart

Primary Widget: The main widget must be [FeatureName]Screen.

Logic: Do not add any onClick handlers, state management, or API calls. The UI should be completely static.

Styling:

No Inline Styles: All styling properties (colors, text styles, padding, margins) must be derived from the Theme.of(context) or predefined styles in lib/core/theme/. Absolutely no inline TextStyle or BoxDecoration objects with hardcoded values are permitted.

Theme Adherence: All UI components must correctly adapt to both light and dark themes using the alta_theme_helper.dart.

Reusable Widgets: Use existing custom widgets from lib/core/ui/widgets/ (e.g., CustomElevatedButton, CustomTextFormField) where appropriate. Do not create duplicates.

Responsive Sizing: Use SizeUtils for all sizing to ensure responsiveness.

Step B: Add the Business Logic (Backend)
After the UI is approved, you will be prompted to add the business logic.

Create the Cubit and State:

Create [FeatureName]Cubit and [FeatureName]State in lib/features/[feature_name]/presentation/state_m/.

The state must use the freezed package.

Connect UI to Cubit:

Wrap the UI widgets in BlocProvider, BlocBuilder, and/or BlocListener.

Implement Events:

Add logic to the onClick handlers to call methods on the Cubit.

Implement Cubit Logic:

The Cubit's methods will call the appropriate UseCase from the domain layer.

The Cubit must handle both Success and Failure states returned by the Result class from the UseCase and update its state accordingly.

5. Best Practices
Immutability: All data models and state classes must be immutable. Use the freezed package for generating immutable state classes.

Error Handling: All repository and use case methods must return a Future<Result<T, AppErrors>>. The presentation layer (Cubit) is responsible for handling the AppErrors.

Code Comments: Add Dart doc comments (///) to all public methods, classes, and complex logic blocks to explain their purpose.

DRY Principle (Don't Repeat Yourself): If you find yourself writing the same logic in multiple places, refactor it into a reusable function and place it in a relevant utility file within lib/core/common/utils/.

Use Core Utilities: Always leverage the utilities provided in the lib/core/ directory for common tasks like navigation, theming, and UI components. Do not reinvent them.

6. Internationalization (i18n)
Multi-Language Support: All user-facing strings must be localized using the existing localization setup. Do not use hardcoded strings in the UI.

Right-to-Left (RTL) Support: All layouts must be designed to work correctly for both LTR (e.g., English) and RTL (e.g., Hebrew) languages. Use layout widgets that respect text direction (Row, Padding, Align, etc.) with start/end properties instead of left/right.

7. AI Interaction Protocol
Direct to Code: After instructions are given, generate the required code directly. Do not provide explanations, summaries, or conversational text unless explicitly asked.

Clarification: If an instruction is ambiguous or conflicts with existing rules, ask for clarification before proceeding.

8. Asset Management
Centralized Asset Management: All asset references must use the centralized asset management system. No hardcoded asset paths are permitted in any UI components or business logic.

Asset Usage Rules:
- All images, icons, and other assets must be referenced through the appropriate asset classes (e.g., JudaismAssets, AppAssets)
- Never use inline asset paths like "assets/images/logo.png" directly in code
- Import the required asset constants: import 'package:jewish_app/core/constants/judaism_assets.dart'
- Use type-safe asset getters: JudaismAssets.ui.ellipse1, AppAssets.images.splashBackground
- If a new asset category is needed, create a new asset class following the existing pattern

Benefits:
- Easy asset path management and updates
- Type safety and better IDE support
- Consistency across the codebase
- Centralized asset organization

9. Plugin and API Integration
API Abstraction: All API definitions and network calls must be handled within the data layer of a feature. The UI should never call an API directly.

Plugin Abstraction: When a new third-party plugin is introduced, it must be wrapped in an abstract service class within the lib/core/ or feature-specific data layer. The rest of the application will interact with this custom service, not the plugin directly. This ensures that if the plugin is ever replaced, the changes are isolated to a single location.