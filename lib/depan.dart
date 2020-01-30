import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stunting_apps/login.dart';

class HalamanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    //this.cPage,
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  //final int currentPage;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  //final cPage;
  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _controller = new PageController();

  void getChangedPageAndMoveBar(int page) {
    currentPage = page;
    print(currentPage);
    setState(() {});
  }

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    new Scaffold(
        backgroundColor: Colors.blueAccent[100],
        //color: Colors.pinkAccent[50],
        //constraints: const BoxConstraints.expand(),
        body: Column(children: <Widget>[
          new Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
              height: 250.0,
              width: 250.0,
              child: Image.asset('assets/images/logoApp1.png')),
          new Container(
              margin: EdgeInsets.all(50.0),
              child: new Center(
                child: new Text(
                  "geser untuk info lebih lanjut",
                  style: TextStyle(fontFamily: 'JosefinSans', fontSize: 20),
                ),
              ))
        ])),
    new Scaffold(
        backgroundColor: Colors.blueAccent[100],
        body: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
              child: Image.asset('assets/images/stuntingchild3.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 100.0),
              alignment: Alignment.bottomCenter,
              child: new Text(
                "anak anda stunting? Cek di fitur DETEKSI DINI",
                style: TextStyle(fontFamily: 'JosefinSans', fontSize: 15),
              ),
            )
          ],
        )),
    new Scaffold(
        backgroundColor: Colors.blueAccent[100],
        //color: Colors.pinkAccent[50],
        //constraints: const BoxConstraints.expand(),
        body: Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              new Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
                  height: 250.0,
                  width: 250.0,
                  child: Image.asset('assets/images/logoApp1.png')),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 50.0),
              )
            ]))),
  ];

  // get currentPageValue => _builtDo;
  //final test = PageView.builder();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
              onPageChanged: (int page) {
                getChangedPageAndMoveBar(page);
              },
            ),
            Visibility(
              visible: currentPage < _pages.length - 1 ? true : false,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 630, 0, 0),
                    color: Colors.grey[800].withOpacity(0.5),
                    alignment: Alignment.bottomCenter,
                    child: new Center(
                      child: new DotsIndicator(
                        controller: _controller,
                        itemCount: 3,
                        onPageSelected: (int page) {
                          //  currentPage = page;
                          // print(currentPage);
                          // print(_pages.length-1);
                          _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
                visible: currentPage == _pages.length - 1 ? true : false,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: new Text("Mulai"),
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new Login(),
                          ));
                        })))
          ],
        ),
      ),
    );
  }
}
