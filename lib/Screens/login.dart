import 'package:flutter/material.dart';
import 'package:e_commernce_ui/widgetsui.dart';

class WomenPage extends StatefulWidget {
  const WomenPage({Key? key}) : super(key: key);

  @override
  State<WomenPage> createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.red.shade700,

        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back)),

        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.search)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.shopping_cart)),

        ],

      ),
      body:
      SingleChildScrollView(
        child: Column(
          children:  <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.amber.shade700,
              child: const Text("Women" ,
                style: TextStyle(fontWeight:
                FontWeight.w500, fontSize: 22,),
                textAlign: TextAlign.left,),
            ),
            DefaultTabController(length: 5,
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
               Container(
                  color : Colors.amber.shade700,
                 child: const TabBar(
                   isScrollable: true,
                   labelPadding: EdgeInsets.fromLTRB(20,5,20,5),
                   tabs: [
                     Tab(

                       child: Text("Hand bag" ,
                         style: TextStyle(color: Colors.blueGrey , fontSize: 16),),

                     ),
                     Tab(
                       child: Text("Watches" ,
                         style: TextStyle(color: Colors.blueGrey, fontSize: 16),),

                     ),
                     Tab(
                       child: Text("Jewelery" ,
                         style: TextStyle(color: Colors.blueGrey, fontSize: 16),),

                     ),
                     Tab(

                       child: Text("Clothes" ,
                         style: TextStyle(color: Colors.blueGrey , fontSize: 16),),

                     ),
                     Tab(

                       child: Text("Rings" ,
                         style: TextStyle(color: Colors.blueGrey , fontSize: 16),),

                     ),

                   ],
                 ),






               ),
                Container(
                     height:MediaQuery.of(context).size.height, //height of TabBarView
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,

                          colors: [
                            Colors.red,
                            Colors.blueGrey,
                            Colors.blue,
                          ],
                        )

                    ),
                     child:
                     TabBarView(
                         children: <Widget>[

                           Center(
                             child: Text('Display Tab 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                           ),
                       Center(
                         child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                       ),

                       Center(
                         child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                       ),

                       Center(
                         child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                       ),

                       Center(
                         child: Text('Display Tab 5', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                       ),





                     ])
                 )
                 ]
               )
      ),


          ],


        ),


      ),


    );
  }
}
