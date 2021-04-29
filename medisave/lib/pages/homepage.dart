import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/add_%20medicine.dart';
import 'package:medisave/widgets/logged_in_widget.dart';
import 'add_ medicine.dart';

class HomePageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Contenido();
  }
}

class Contenido extends StatelessWidget {
   List lista (int count){
     List<Widget> listItems= List();
      for(int i = 0; i < count; i++) {
        listItems.add(
          Container(
            child: Card(
              color: Color(0xff158dad),
              child:  new Container(
                padding: EdgeInsets.all(20.20),
                child: new Row(
                  children: <Widget>[
                   const Icon(Icons.add_alarm,color: Color(0xFFFFFFFF), size: 15,),
                  VerticalDivider(
                    color: Colors.white,width: 80, indent: 10, endIndent: 10, thickness: 1,
                  ),
                   const Text(' Alarma ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Color(0xFFFFFFFF)),)
                  ]
                )
              ),
              ),
            )
          ); 
      }
      return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff158dad),
        title: Text('Medisave')
      ),
      drawer: LoggedInWidget(),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(lista(5)),
          )
        ],
      ),
      //body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff158dad),
        onPressed: (){
          //print("CIEGO");
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Addmedicine()));
        },
         shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        elevation: 5,
        highlightElevation: 10,
      ),
    );
  }
}
