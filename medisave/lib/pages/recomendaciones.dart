import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/helpers/utils.dart';
import 'package:medisave/models/recomendaciones.dart';

class RecomendacionesPage extends StatefulWidget {
  RecomendacionesPage({Key key}) : super(key: key);

  @override
  _RecomendacionesPageState createState() => _RecomendacionesPageState();
}

class _RecomendacionesPageState extends State<RecomendacionesPage> {
  List<Recomendaciones> _content = Utils.getRecomendaciones();
  int pageIndex = 0;
  PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recomendaciones '),
        ),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Expanded(
                  child: PageView(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    pageIndex = page;
                  });
                },
                children: List.generate(
                    _content.length,
                    (index) => Container(
                        padding: EdgeInsets.all(40),
                        margin: EdgeInsets.all(70),
                        //left: 40, right: 40, top: 40, bottom: 40),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.BACKGROUND,
                                  blurRadius: 15,
                                  offset: Offset.zero)
                            ]),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      'assets/imgs/medisave.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),*/
                                  Image.asset(
                                      'assets/imgs/${_content[index].img}.png'),
                                  SizedBox(height: 40),
                                  Text(_content[index].message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 23))
                                ],
                              ),
                            ),
                          ],
                        ))),
              )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      _content.length,
                      (index) => GestureDetector(
                            onTap: () {
                              _controller.animateTo(
                                  MediaQuery.of(context).size.width * index,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.BACKGROUND,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 6,
                                      color: pageIndex == index
                                          ? Colors.lightBlue[100]
                                          : Theme.of(context).canvasColor)),
                            ),
                          ))),
              SizedBox(height: 20),
              /*ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.BACKGROUND,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
                label: Text(
                  "SALTAR RECOMENDACIONES",
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
                icon: Icon(Icons.save),
              ),*/
            ],
          ),
        )));
  }
}
