import 'package:flutter/material.dart';
import 'package:loginUIchallenge/data/list_item.dart';
import 'package:loginUIchallenge/model/list_item.dart';

class ListScreen extends StatelessWidget {
  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login UI Challenge'),
      ),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        children: List.generate(
          items.length,
          (index) => GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>listUis[index]
              ),
            ),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Ink.image(
                    image: AssetImage(items[index].urlImage),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black12,
                            Colors.black45,
                          ],
                        ),
                      ),
                      child: Text(
                        items[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
