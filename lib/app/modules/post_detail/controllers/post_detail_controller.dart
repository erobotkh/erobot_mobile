import 'package:erobot_mobile/app/modules/comment/views/comment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  //TODO: Implement PostDetailController

  final count = 0.obs;
  late final PageController pageController;
  final isShow = true.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  void increment() => count.value++;

  List<String> getImages() {
    return [
      'https://pbs.twimg.com/media/Ey9OPzOWYAkX57L.jpg',
      'https://pbs.twimg.com/media/EvBGPQXXAAMuKvz.jpg',
      'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2018/05/03/15253818363726.jpg',
      'https://pbs.twimg.com/media/Ey9OPzOWYAkX57L.jpg',
    ];
  }

  List<IconData> getListIcons() {
    List<IconData> icons = [
      Icons.favorite,
      Icons.message,
      Icons.share,
      Icons.bookmark,
      Icons.more_vert,
    ];
    return icons;
  }

  String getDesc() {
    return '''
    ---
layout: post
title:  "Introduction to Dart"
date:   2021-11-08
categories: education
permalink: education/intro-dart
author: Chen Darot
---

# Introduction to Dart programming
### Create dart project
open your terminal or comand prompt and run
```shell
dart create projectName
cd projectName
dart run
```

### Data Type
1. int    : `1, 2, 3, 4, ..... `
2. double : `1.2, 5.2, 5.5, .....`
3. bool   : `true`, `false`
4. String : `'name'`, `'school'`, `'books'`, ..... 
5. list   : `[1,2,3,4]`, `['apple', 'orange', 'banana']` ......
6. Map    : `{'name': 'Erobot', 'age': 18, 'skill': 'Mobile dev',}`

### Variable
> `int`
```dart
var myAge = 20;
int x = 9;
print("I am \$myAge yearold"); 
// OutPut : I am 20 yearold
```

> `double`
```dart
var height = 160.5;
double weight = 50;
print("My height = \$height and weight = \$weight");
// Output: My height = 160.5 and weight = 50
```

> `bool`
```dart
var love = true;
bool hate = false;
print("I love Erobot, \$love. I hate football, \$hate");
// Output: I love Erobot, true. I hate football, false
```

> `String`
```dart
var myName = "Erobot";
String description = "I love Erobot";
print("Hi my name is \$myName, \$description");
// Output: Hi my name is Erobot. I love Erobot
```

> `list`
```dart
var fruits = ['apple', 'orange', 'banana'];
List<int> ages = [16, 21, 12, 15];
print(fruits);        //  [apple, orange, banana]
print(fruits[1]);     //  orange
print(fruits.lenght); //  3
print(fruits.first);  //  apple
print(fruits.last);   //  banana
```

> `Map`
```dart
var info = {
  'name': 'Erobot', 
  'age': 18, 
  'skill': 'Mobile dev',
};
print("Hello my name is \${info["name"]}. I'm \${info['age']}");
// Output: Hello my name is Erobot. I'm 18
```

### Operator
> Arithmetic operators

| Operator  | Meaning
| :------:  | -------
| +         | Add
| –         | Subtract
| *         | Multiply
| /         | Divide
| ~/        | Divide, returning an integer result
| %         | Get the remainder of an integer division (modulo)
| ++        | Increment
| --        | Decrement

> Assignment operators

| Operator  | Example     | Meaning
| :------:  | ------      | ------
| =         | `x = 10`    | `x = 10`
| +=        | `x += 1`    | `x = x + 1`
| -=        | `x -= 1`    | `x = x - 1`
| *=        | `x *= 2`    | `x = x * 2`
| /=        | `x /= 2`    | `x = x / 2`
| %=        | `x %= 2`    | `x = x % 1`

> relational operators

| Operator  | Meaning
| :------:  | -------
| ==        | Equal; see discussion below
| !=        | Not equal
| >         | Greater than
| <         | Less than
| >=        | Greater than or equal to
| <=        | Less than or equal to

> Logical operators

| Operator  | Meaning
| :------:  | -------
| \|\|      | OR
| &&        | AND

## Control flow statements
1. `if` and `else`
2. `switch` and `case` 
4. `for` loops
5. `while` and `do-while` loops

### If and else
```dart
if (raining) {
  wearRainCoat();
} else if (isSnowing()) {
  wearJacket();
} else {
  wearNormal();
}
```

### Switch and case
```dart
switch(grade){
  case 'A':
    print('Excellent');
    break;
  case 'B':
    print('Very Good');
    break;
  case 'C':
    print('Good');
    break;
  case 'D':
    print('Medium');
    break;
  case 'E':
    print('Poor');
    break;
  default:
    print('Fail');
}
```

### For loops
```dart
for (var i = 0; i < 5; i++) {
  print("*");
}
//   *****

var fruits = ['apple', 'orange', 'banana'];
for (final fruit in fruits) {
  print(fruit);
}
//  OR
fruits.forEach(print);
//  apple
//  orange
//  banana
```

### While and do-while
```dart
while (notDone()) {
  doSomething();
}
//  OR
do {
  writing();
} while (!atEndOfPage());
```

## List and Map
### List

**Fix length list**
> Declare a list : `var list_name = new List(initial_size)`

> Initailizing  : `lst_name[index] = value`

```dart
// Example
var lst = new List(3); 
lst[0] = 12; 
lst[1] = 13; 
lst[2] = 11; 
print(lst); // [12, 13, 11]
```

**Growable List**

> Declare a list  : `var list_name = new List()`

> Initailizing  : `var list_name = [val1,val2,val3]`

```dart
var num_list = [1,2,3]; 
print(num_list); // [1, 2, 3]
```

**List Properties**

| Methods | Description |
| ------  | ----------  |
| first   | Returns the first element in the list. |
| isEmpty | Returns true if the collection has no elements. |
| isNotEmpty  | Returns true if the collection has at least one element.  |
| length  | Returns the size of the list. |
| last    | Returns the last element in the list. |
| reversed  | Returns an iterable object containing the lists values in the reverse order.  |
| Single  | Checks if the list has only one element and returns it. |


### Map

> Declare : 
> `var identifier = { key1:value1, key2:value2 [,…..,key_n:value_n] }` or 
> `var identifier = new Map()`

> Initailizing :  `map_name[key] = value`

```dart
var details = {'Usrname':'tom','Password':'pass@123'}; 
print(details); 
// {Usrname: tom, Password: pass@123}
```

**Map Properties**

| Methods | Description |
| ------  | ----------  |
| key     | Returns the first element in the list. |
| value   | Returns true if the collection has no elements. |
| length  | Returns true if the collection has at least one element.  |
| isEmpty | Returns the size of the list. |
| isNotEmpty  | Returns the last element in the list. |
    ''';
  }

  void onTapBottomNav(int index) {
    switch (index) {
      case 0:
        print('Like');
        break;
      case 1:
        _showComment();
        break;
      case 2:
        print('Share');
        break;
      case 3:
        print('Save');
        break;
      default:
        print('More');
        break;
    }
  }

  void _showComment() {
    Get.bottomSheet(
      CommentView(),
    );
  }
}
