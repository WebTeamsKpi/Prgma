import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_list_drag_and_drop/drag_and_drop_list.dart';
import 'package:prgma/constant/pallete.dart';
import 'package:prgma/models/Flopers.dart';
import 'package:prgma/models/User.dart';
import 'package:prgma/representation/Sidebar/home_side_drawer.dart';

class HomePage extends StatefulWidget {
  static User user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Flopers> cards = [];
  List<List<String>> childres = [
    ["ToDo 1", "ToDo 2"],
    ["Done 1", "Done 2"],
  ];
  Color _pickColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeSideDrawer(),
      appBar: AppBar(
        title: Text("Prgma"),
      ),
      body: _buildBody(),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(
      BuildContext context, StateSetter setStatelocal) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setStatelocal(() {
        selectedDate = picked;
      });
  }

  TextEditingController _cardTextController = TextEditingController();
  TextEditingController _taskTextController = TextEditingController();
  Color dialogPickerColor;
  _showAddCard() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStatelocal) {
            return Dialog(
                child: Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Title")),
                                Expanded(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Title",
                                            border: OutlineInputBorder()))),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Color")),
                                ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 16,
                                  height:
                                      MediaQuery.of(context).size.height / 16,
                                  child: RaisedButton(
                                    color: _pickColor,
                                    onPressed: () async {
                                      colorPick(setStatelocal);
                                    },
                                  ),
                                ),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("MoveRight")),
                                Expanded(
                                    child: DropdownButton<String>(
                                  items: <String>['A', 'B', 'C', 'D']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                )),
                              ])),
                      Center(
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 16,
                          height: MediaQuery.of(context).size.height / 16,
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () {
                              _addCard(_cardTextController.text.trim());

                              Navigator.of(context).pop();
                            },
                            child: Text("Add Task"),
                          ),
                        ),
                      ),
                    ])));
          });
        });
  }

  editTask() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStatelocal) {
            return Dialog(
                child: Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Title")),
                                Expanded(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Title",
                                            border: OutlineInputBorder()))),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                              minLines: 3,
                              maxLines: 50,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  border: OutlineInputBorder()))),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Deadline")),
                                SizedBox(
                                  height: 20.0,
                                ),
                                RaisedButton(
                                  onPressed: () =>
                                      _selectDate(context, setStatelocal),
                                  child: Text("${selectedDate.toLocal()}"
                                      .split(' ')[0]),
                                ),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Contributor")),
                                Expanded(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Contributor",
                                            border: OutlineInputBorder()))),
                              ])),
                      Center(
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 16,
                          height: MediaQuery.of(context).size.height / 16,
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () {
                              _addCard(_cardTextController.text.trim());

                              Navigator.of(context).pop();
                            },
                            child: Text("Add Task"),
                          ),
                        ),
                      ),
                    ])));
          });
        });
  }

  _showAddTask() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStatelocal) {
            return Dialog(
                child: Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Title")),
                                Expanded(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Title",
                                            border: OutlineInputBorder()))),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                              minLines: 3,
                              maxLines: 50,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  border: OutlineInputBorder()))),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Deadline")),
                                SizedBox(
                                  height: 20.0,
                                ),
                                RaisedButton(
                                  onPressed: () =>
                                      _selectDate(context, setStatelocal),
                                  child: Text("${selectedDate.toLocal()}"
                                      .split(' ')[0]),
                                ),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Contributor")),
                                Expanded(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Contributor",
                                            border: OutlineInputBorder()))),
                              ])),
                      Center(
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 16,
                          height: MediaQuery.of(context).size.height / 16,
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () {
                              _addCard(_cardTextController.text.trim());

                              Navigator.of(context).pop();
                            },
                            child: Text("Add Task"),
                          ),
                        ),
                      ),
                    ])));
          });
        });
  }

  _addCard(String text) {
    // cards.add(text);
    childres.add([]);
    _cardTextController.text = "";
    setState(() {});
  }

  static int colortoHue(Color colorHue) {
    if (colorHue == Colors.red) {
      return 0;
    } else if (colorHue == Colors.orange) {
      return 30;
    } else if (colorHue == Colors.yellow) {
      return 60;
    } else if (colorHue == Colors.green) {
      return 120;
    } else if (colorHue == Colors.cyan) {
      return 180;
    } else if (colorHue == Color.fromRGBO(0, 127, 255, 1)) {
      return 210;
    } else if (colorHue == Colors.blue) {
      return 240;
    } else if (colorHue == Colors.purple) {
      return 270;
    } else if (colorHue == Color.fromRGBO(255, 0, 255, 1)) {
      return 300;
    } else if (colorHue == Color.fromRGBO(183, 110, 121, 1)) {
      return 330;
    }

    return 0;
  }

  void colorPick(Function setStatelocal) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Виберіть колір'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: _pickColor,
                availableColors: colorsForMarker,
                onColorChanged: (Color color) {
                  _pickColor = color;
                },
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ок'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setStatelocal(() {});
                },
              ),
            ],
          );
        });
  }

  _showAddCardTask(int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add Card task",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Task Title"),
                    controller: _taskTextController,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _addCardTask(index, _taskTextController.text.trim());
                    },
                    child: Text("Add Task"),
                  ),
                )
              ],
            ),
          );
        });
  }

  _showSettingTask(int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStatelocal) {
            return Dialog(
                child: Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Title")),
                                Expanded(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Title",
                                            border: OutlineInputBorder()))),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("Color")),
                                ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 16,
                                  height:
                                      MediaQuery.of(context).size.height / 16,
                                  child: RaisedButton(
                                    color: _pickColor,
                                    onPressed: () {
                                      colorPick(setStatelocal);
                                    },
                                  ),
                                ),
                              ])),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(child: Text("MoveRight")),
                                Expanded(
                                    child: DropdownButton<String>(
                                  items: <String>['A', 'B', 'C', 'D']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                )),
                              ])),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width / 16,
                              height: MediaQuery.of(context).size.height / 16,
                              child: RaisedButton(
                                color: Colors.green,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Save"),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width / 16,
                              height: MediaQuery.of(context).size.height / 16,
                              child: RaisedButton(
                                color: Colors.red,
                                onPressed: () {},
                                child: Text("Delete"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ])));
          });
        });
  }

  _addCardTask(int index, String text) {
    childres[index].add(text);
    _taskTextController.text = "";
    setState(() {});
  }

  _handleReOrder(int oldIndex, int newIndex, int index) {
    var oldValue = childres[index][oldIndex];
    childres[index][oldIndex] = childres[index][newIndex];
    childres[index][newIndex] = oldValue;
    setState(() {});
  }

  _buildBody() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cards.length + 1,
      itemBuilder: (context, index) {
        if (index == cards.length)
          return _buildAddCardWidget(context);
        else
          return _buildCard(context, index);
      },
    );
  }

  Widget _buildAddCardWidget(context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            _showAddCard();
          },
          child: Container(
            width: 300.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    color: Color.fromRGBO(127, 140, 141, 0.5),
                    spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.add,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text("Add Card"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddCardTaskWidget(context, index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          _showAddCardTask(index);
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.add,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text("Add Card Task"),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    // return Container(
    //         width: 300.0,
    //   child: ,
    // );
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    color: Color.fromRGBO(127, 140, 141, 0.5),
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /*Text(
                            cards[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(Icons.add),
                                onTap: () {
                                  _showAddTask();
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: Icon(Icons.settings),
                                onTap: () {
                                  _showSettingTask(index);
                                },
                              )
                            ],
                          ),
                        ])),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: DragAndDropList<String>(
                      childres[index],
                      itemBuilder: (BuildContext context, item) {
                        return _buildCardTask(
                            index, childres[index].indexOf(item));
                      },
                      onDragFinish: (oldIndex, newIndex) {
                        _handleReOrder(oldIndex, newIndex, index);
                      },
                      canBeDraggedTo: (one, two) => true,
                      dragElevation: 8.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: DragTarget<dynamic>(
              onWillAccept: (data) {
                print(data);
                return true;
              },
              onLeave: (data) {},
              onAccept: (data) {
                if (data['from'] == index) {
                  return;
                }
                childres[data['from']].remove(data['string']);
                childres[index].add(data['string']);
                print(data);
                setState(() {});
              },
              builder: (context, accept, reject) {
                print("--- > $accept");
                print(reject);
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCardTask(int index, int innerIndex) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Draggable<dynamic>(
        feedback: Material(
          elevation: 5.0,
          child: Container(
            width: MediaQuery.of(context).size.width / 3.75,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Text(childres[index][innerIndex]),
          ),
        ),
        childWhenDragging: Container(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.red,
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(childres[index][innerIndex]),
              Row(
                children: [
                  GestureDetector(
                      child: Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                      onTap: () {
                        editTask();
                      }),
                  SizedBox(width: 20),
                  GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onTap: () {})
                ],
              )
            ]),
          ]),
        ),
        data: {"from": index, "string": childres[index][innerIndex]},
      ),
    );
  }
}
