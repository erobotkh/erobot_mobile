# Erobot Application v2
## I. Getting Started

In this project, we use flutter 2.5.3. If you have different version, you should consider [install FVM](https://soksereyphon8.medium.com/flutter-version-management-3c318c4ff97d).

### Prerequisites

```
flutter pub get
flutter run
```
### Built with

* [Flutter 2.5.3](https://flutter.dev) - The framework used
* [Dart](https://dart.dev/) - The language used

### Data use
* [Erobot App API](https://github.com/erobot-dev/erobot_api) - By our backend team.

## II. Code generation 
### 1. Model generations with JSON Serialization
We uses Json Serializable [ https://flutter.dev/docs/development/data-and-backend/json#code-generation ] package build tool to generate model from Json to Class object. In case you want to add more fields model or even change the model data type, you need to run the command:
```
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. Assets generations with flutter_gen
We also use [flutter_gen](https://pub.dev/packages/flutter_gen) which is the Flutter code generator for your assets, fonts, colors, … — to Get rid of all String-based APIs.

Installation: [https://pub.dev/packages/flutter_gen/install]

Generate new assets:
```
fluttergen
```

```dart
Widget build(BuildContext context) {
  return Assets.images.profile.image();
}
```

## III. State Management
We uses [GetX](https://pub.dev/packages/get) for our state management... solution.
### 1. CLI
We use [get_cli](https://pub.dev/packages/get_cli) to automated our development process.
```
// To install:
flutter pub global activate get_cli

// To create a page:
// (Pages have controller, view, and binding)
// Note: you can use any name, ex: `get create page:login`
get create page:home

get install camera

// To install a dev package in your project (dependencies_dev):
get install flutter_launcher_icons --dev

// To remove a package from your project:
get remove http

// For more detail
get help
```
### 2. VSCode Exstension
We also use [GetX Snippets](https://marketplace.visualstudio.com/items?itemName=get-snippets.get-snippets).

## IV. API Connection
Even we use getx, we don't use its `GetConnect` for communicate with our API.
### 1. Creating a API call:
For Example, if we are creating post api with end point: https://example.com/posts.<br>
We have to create that class in `lib/services/apis/` folder, eg:
```dart
// - extends BaseResourceOwnerApi: if you need token in request header.
// - extends BaseAppApi: if you don't need token in request header.
class PostApi extends BaseResourceOwnerApi<PostModel> {
  Future<dynamic> fetchAllPosts() async {
    var result = await super.fetchAll(
      queryParameters: {
        'included': 'images,author',
      },
    );
    return result;
  }

  // https://example.com/posts => nameInUrl = posts
  @override
  String get nameInUrl => "posts";

  @override
  objectTransformer(Map<String, dynamic> json) {
    return PostModel.fromJson(json);
  }

  @override
  itemsTransformer(Map<String, dynamic> json) {
    return PostListModel(
      items: buildItems(json),
      meta: buildMeta(json),
      links: buildLinks(json),
    );
  }
}
```
> [lib/services/apis/post_api.dart](lib/services/apis/post_api.dart)

### 2. Note
- Extends your class with [BaseResourceOwnerApi](lib/services/base_apis/base_resource_owner_api.dart), if you need token in request header.
- Extends your class with [BaseAppApi](lib/services/base_apis/base_app_api.dart), if you don't need token in request header.
## V. Check sign in report
Get info such as `Variant, Config, Store, Alias, MD5, SHA1, SHA-256, Valid until` with following command:
```shell
cd android
./gradlew signingReport
```

## VI. Authors
See also the list of [contributors](https://github.com/erobot-dev/erobot_mobile/contributors) who participated in this project.
## VII. License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
