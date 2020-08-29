import 'package:flutter/material.dart';
import 'package:learn_flu/config_size.dart';

class GridViewDUI extends StatelessWidget {
  List<Image> listImage = [
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
    Image.network("https://placeimg.com/500/500/any"),
  ];
  @override
  Widget build(BuildContext context) {
    final double width = ConfigSize.width, height = ConfigSize.height;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Text('Count'),
            Container(
                height: height * 0.25,
                width: width * 0.95,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  children: <Widget>[...listImage],
                )),
            SizedBox(height: height * 0.01),
            Text('Builder'),
            Container(
              height: height * 0.5,
              width: width * 0.95,
              color: Colors.black12,
              child: GridView.builder(
                itemCount: listImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0),
                itemBuilder: (BuildContext context, int index) {
                  return listImage[index];
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Text('Extent'),
            Container(
              height: height * 0.25,
              width: width * 0.95,
              color: Colors.black12,
              child: GridView.extent(
                maxCrossAxisExtent: 120,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                children: <Widget>[
                  ...listImage
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
