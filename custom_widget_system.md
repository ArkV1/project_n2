# Custom Widget System

Our application uses a flexible custom widget system that allows for dynamic creation and management of widgets, primarily for wallet and to-do list functionalities.

## Widget Types

We have two main types of widgets:

1. Wallet Widgets
2. To-Do Widgets

Each type has several subtypes defined in the `WalletWidgetType` and `ToDoWidgetType` enums.

### Wallet Widget Types

```dart
enum WalletWidgetType {
  unknown,
  dailySpendings,
  total,
  lastTransaction
}
```

### To-Do Widget Types

```dart
enum ToDoWidgetType {
  unknown,
  classic,
  expanded
}
```

## Widget Models

Widgets are represented by model classes:

- `WalletWidget`
- `ToDoWidget`

These models contain the necessary data for rendering the widgets and are associated with `AppWidget` objects.

## Widget Builders

Custom builder classes are used to render the widgets:

- `WalletWidgetBuilder`
- `ToDoWidgetBuilder`

These builders take the respective widget models and construct the appropriate UI.

## Adding Widgets

Widgets can be added dynamically through a custom dialog:

```dart
void addWidget(String currentRoutePath, {int? screenIndex}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AppWidgetDialog(currentRoutePath, screenIndex: screenIndex);
    }
  ).then((value) => setState(() {}));
}
```

## Widget Management

Widgets are managed through a series of dialogs, allowing for creation, editing, and deletion:

- `WalletsDialog`: Manages wallet widgets
- `ToDoDialog`: Manages to-do widgets

These dialogs handle different states (creation, editing, listing) and update the widget data accordingly.

## Rendering Widgets

Widgets are rendered dynamically in the home view:

```dart
if (appWidget.containedObjectType == ContainedObjectType.wallet) {
  return WalletWidgetBuilder(
    appWidget: appWidget,
  );
} else if (appWidget.containedObjectType == ContainedObjectType.toDoList) {
  // Render To-Do widget
}
```

## Widget Customization

Users can customize widgets through the settings view, which provides options to manage different components of the application.

## Data Management

Widget data is persisted using ObjectBox, allowing for efficient storage and retrieval of widget information.

This custom widget system provides a flexible and extensible way to create and manage different types of widgets in the application, enhancing the user experience and allowing for a high degree of customization.
