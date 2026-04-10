1. put application shell in feature folder and organize all the files in a feature based architecture
2. flutter_gen
3. learn to make extension and extract the method from there.
```
extension ThemeContext on BuildContext {
  // ThemeData get theme => Theme.of(this);
  // TextTheme get text => theme.textTheme;
  double get devicePaddingTop => MediaQuery.of(this).padding.top;
  double get devicePaddingBottom => MediaQuery.of(this).padding.bottom;
  double get viewInsets => MediaQuery.of(this).viewInsets.bottom;
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  void hideKeyboard() {
    // SystemChannels.textInput.invokeMethod('TextInput.hide');
    // FocusScope.of(this).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  String getInitials(String name) {
    var nameParts = name.split(' ');
    var firstNameInitial = '';
    var lastNameInitial = '';

    if (nameParts.isEmpty || name == '') {
      return '';
    } else if (nameParts.length == 1) {
      return firstNameInitial = nameParts[0][0].toUpperCase();
    } else {
      firstNameInitial = nameParts[0][0].toUpperCase();
      lastNameInitial = nameParts.last[0].toUpperCase();

      return firstNameInitial + lastNameInitial;
    }
  }

  String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}
```
```
import 'package:html/parser.dart' as html_parser;

extension StringExtension on String? {
  String removeTime() {
    return this?.substring(0, 10) ?? '';
  }

  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  String routePath() {
    return '/$this';
  }

  String capitalizeWords() {
    if (this == null || this!.trim().isEmpty) return '';

    return this!
        .trim()
        .split(RegExp(r'\s+'))
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  String htmlToPlainText() {
    final document = html_parser.parse(this);
    return document.body?.text ?? '';
  }

  String formatNumber() {
    if (this == null || this!.trim().isEmpty) return '0';
    if (this!.endsWith('.00')) {
      return this!.substring(0, this!.length - 3);
    }
    return this!;
  }
}
```

4. Define route name and reuse it all over app
5. Custom font use case
```
- family: PublicSans
      fonts:
        - asset: assets/fonts/public_sans/PublicSans-Thin.ttf
          weight: 100
        - asset: assets/fonts/public_sans/PublicSans-ExtraLight.ttf
          weight: 200
        - asset: assets/fonts/public_sans/PublicSans-Light.ttf
          weight: 300
        - asset: assets/fonts/public_sans/PublicSans-Regular.ttf
          weight: 400
        - asset: assets/fonts/public_sans/PublicSans-Medium.ttf
          weight: 500
        - asset: assets/fonts/public_sans/PublicSans-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/public_sans/PublicSans-Bold.ttf
          weight: 700
        - asset: assets/fonts/public_sans/PublicSans-ExtraBold.ttf
          weight: 800
        - asset: assets/fonts/public_sans/PublicSans-Black.ttf
          weight: 900
```
6. flutter_launcher_icons