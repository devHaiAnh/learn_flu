import 'package:flutter/material.dart';
import 'package:learn_flu/config_size.dart';

class ListViewDUI extends StatefulWidget {
  @override
  _ListViewDUIState createState() => _ListViewDUIState();
}

class _ListViewDUIState extends State<ListViewDUI> {
  @override
  Widget build(BuildContext context) {
    final double width = ConfigSize.width, height = ConfigSize.height;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Text('Normal'),
            Container(
              height: height * 0.3,
              width: width * 0.95,
              child: ListView(
                children: [
                  Container(
                    color: Colors.red,
                    height: height * 0.1,
                    child: Text('1'),
                  ),
                  Container(
                    height: height * 0.1,
                    color: Colors.cyanAccent,
                    child: Text('2'),
                  ),
                  Container(
                    height: height * 0.1,
                    color: Colors.blue,
                    child: Text('3'),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Text('Builder'),
            Container(
              height: height * 0.3,
              width: width * 0.95,
              color: Colors.black12,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.1,
                      color: index % 2 == 0
                          ? Colors.redAccent
                          : Colors.amberAccent,
                      child: Text(index.toString()),
                    );
                  }),
            ),
            SizedBox(height: height * 0.01),
            Text('ExpansionTitle 1'),
            Container(
              height: height * 0.4,
              width: width * 0.95,
              color: Colors.black12,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(
                      "Title $index",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ExpansionTile(
                        title: Text(
                          'Sub title $index',
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('data $index'),
                          )
                        ],
                      ),
                      ListTile(
                        title: Text('data $index'),
                      ),
                      Text('data')
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Text('ExpansionTitle 2'),
            Container(
              height: height * 0.4,
              width: width * 0.95,
              color: Colors.black12,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          items[index].isExpanded = !items[index].isExpanded;
                        });
                      },
                      children: items.map((NewItem item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                                leading: item.iconpic,
                                title: Text(
                                  item.header,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ));
                          },
                          isExpanded: item.isExpanded,
                          body: item.body,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<NewItem> items = <NewItem>[
    NewItem(
        false, // isExpanded ?
        'Header', // header
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Text('data'),
              Text('data'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
              Radio(value: null, groupValue: null, onChanged: null)
            ])), // body
        Icon(Icons.image) // iconPic
        ),
  ];
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}
