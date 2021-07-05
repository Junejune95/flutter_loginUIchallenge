

import 'package:loginUIchallenge/model/list_item.dart';
import 'package:loginUIchallenge/screen/login1/login1_screen.dart';
import 'package:loginUIchallenge/screen/login2/login2_screen.dart';

final List<ListItem> listItems = [
  ListItem(
    title: 'Login 1',
    urlImage:
        'assets/login UI/login1.png',
  ),
  ListItem(
    title: 'Login 2',
    urlImage:
        'assets/login UI/login2.png',
  )
];


final List listUis=[
  Login1(),
  Login2()
];
