import 'dart:convert';
import 'package:e_commernce_ui/Route.dart';
import 'package:http/http.dart' as http;
import 'package:e_commernce_ui/Data/Sharedprefs.dart';
import 'package:e_commernce_ui/Data/api.dart';
import 'package:e_commernce_ui/Data/model.dart';
import 'package:e_commernce_ui/widgetsui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

import 'login.dart';


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);




  @override
  State<homepage> createState() => _homepageState();
}
final TextEditingController searchCon = new TextEditingController();

class _homepageState extends State<homepage> {

 



  final TextFieldfixed =
  TextFormField(

      autofocus: false,
      controller: searchCon,
      keyboardType: TextInputType.name,

      onSaved: (value) {
        searchCon.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Search",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),

      )

  );


  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/bag_1.png',
    'assets/images/r1.png',

    'assets/images/bag_2.png',
    'assets/images/r2.png',

    'assets/images/bag_3.png',
    'assets/images/r3.png',

    'assets/images/bag_4.png',
    'assets/images/r4.png',

  ];

   CharacterApi api = CharacterApi();
   Apilist? apilist ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.red.shade700,

        leading: IconButton(
            onPressed: (){




            },
            icon: Icon(CupertinoIcons.rectangle_grid_2x2)),

        actions: [
          IconButton(onPressed: (){},
              icon: Icon(CupertinoIcons.cart_fill)),

        ],

      ),

      backgroundColor: Color.fromARGB(240, 200, 190, 145),
      body: SingleChildScrollView(
       // padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [


                Container(
                  margin: EdgeInsets.all(25),

                  child: TextFieldfixed),

            SizedBox(height:15),

            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),),
              margin: EdgeInsets.symmetric(horizontal: 25),

              child: CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height*0.25,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index))),
            ),
            SizedBox(height: 12),
            Center(child: buildIndicator()),
            SizedBox(height: 12),
            Container(
                margin: EdgeInsets.only(left: 15),
                child: Text("Our Countries " , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),)),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),


              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),

              child:  FutureBuilder(
              future: api.Apireturn(),
                      builder :(context , aa) {
                if(aa.hasData)
                  {
                    apilist = aa.data as Apilist;
                    return ListView.builder(
                      shrinkWrap: true ,
                        physics: ScrollPhysics(),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index)
                    {
                      return ListV(function: (){}, champ: apilist!.apilist[index]);
                    },
                    );

                  }
                else{return LinearProgressIndicator();}
              }
              ),
            ),
            SizedBox(height: 15,),
            Text("Profile info's : ",
              style: TextStyle(color: Colors.white ,
                  fontWeight: FontWeight.bold , fontSize: 18),),
            SizedBox(height: 20,),

            Row(children: <Widget>[Text(" Welcome back my friend ! , \n ${CacheHelper.getData(key: "emailstate")}")], ),
            SizedBox(height: 20,),

            newButton(width: MediaQuery.of(context).size.width*0.4,
                title: Text("Sign out"),
                function: (){
              CacheHelper.removeData(key: "loginstate");
              CacheHelper.removeData(key: "emailstate");

              Navigator.of(context).pushNamed(loginRoute);
                }),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,)
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
    activeIndex: activeIndex,
    count: urlImages.length,
  );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Container(child: Image.asset(urlImage, fit: BoxFit.cover));
