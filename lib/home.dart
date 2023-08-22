import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_recipe/model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   List<RecipeModel> recipeList =  <RecipeModel>[];
//   TextEditingController searchController = new TextEditingController();
//
//   getRecipes(String query) async
//   {
//     String url = "https://api.edamam.com/search?q=$query&app_id=3a07c484&app_key=e75f7b112394a02c920a4783a414ff0f";
//     Response response = await get(Uri.parse(url));
//     Map data = jsonDecode(response.body);
//
//
//     data["hits"].forEach((element){
//       RecipeModel recipeModel = new RecipeModel();
//       recipeModel = RecipeModel.fromMap(element["recipe"]);
//        recipeList.add(recipeModel);
//       log(recipeList.toString());
//     });
//
//     recipeList.forEach((Recipe) {
//       print(Recipe.applabel);
//       print(Recipe.appcalories);
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [
//                     Color(0xff213A50),
//                     Color(0xff071938)
//                   ]
//               ),
//             ),
//           ),
//
//           SingleChildScrollView(
//             child: Column(
//               children: [
//
//
//                 //Search Bar
//                 SafeArea(
//                   child: Container(
//                     //Search Wala Container
//
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(24)),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             if((searchController.text).replaceAll(" ", "") == "")
//                             {
//                               print("Blank search");
//                             }else{
//                               getRecipes(searchController.text);
//                             }
//
//                           },
//                           child: Container(
//                             child: Icon(
//                               Icons.search,
//                               color: Colors.blueAccent,
//                             ),
//                             margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
//                           ),
//                         ),
//                         Expanded(
//                           child: TextField(
//                             controller: searchController,
//                             decoration: InputDecoration(
//                                 border: InputBorder.none, hintText: "Let's Cook Something!"),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("WHAT DO YOU WANT TO COOK TODAY?", style: TextStyle(fontSize: 33, color: Colors.white),),
//                       SizedBox(height: 10,),
//                       Text("Let's Cook Something New!", style: TextStyle(fontSize: 20,color: Colors.white),)
//                     ],
//                   ),
//                 ),
//                 Container(
//                     child:
//                     ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: recipeList.length,
//                         itemBuilder: (context, index){
//                           return InkWell(
//                             onTap: (){},
//                             child: Card(
//                               margin: EdgeInsets.all(20),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//
//                               ),
//                               elevation: 0.0,
//
//                               child: Stack(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.network(recipeList[index].appimgUrl,
//                                       fit: BoxFit.cover,
//                                       width: double.infinity,
//                                       height: 200,
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 0,
//                                       bottom: 0,
//
//                                       child:
//
//                                       Container(
//                                           padding: EdgeInsets.all(10),
//                                           child: Text(recipeList[0].applabel))
//                                   )
//
//                                 ],
//                               ),
//                             ),
//
//                           );
//                         })
//                 )
//               ],
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
// }
//
// Widget MyText()
// {
//   return Text("MY TEXT WIDGET IS HERE");
//
// }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<RecipeModel> recipeList = <RecipeModel>[];
  TextEditingController searchController = new TextEditingController();
  List reciptCatList = [{"imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db", "heading": "Chilli Food"},{"imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db", "heading": "Chilli Food"},{"imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db", "heading": "Chilli Food"},{"imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db", "heading": "Chilli Food"}];
  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=3a07c484&app_key=e75f7b112394a02c920a4783a414ff0f";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["hits"].forEach((element) {
        RecipeModel recipeModel = new RecipeModel();
        recipeModel = RecipeModel.fromMap(element["recipe"]);
        recipeList.add(recipeModel);
        log(recipeList.toString());
      });
    });


    recipeList.forEach((Recipe) {
      print(Recipe.applabel);
      print(Recipe.appcalories);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes("chilli chicken");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff213A50), Color(0xff071938)]),
            ),
          ),

          /*
      * InWell - Tap,DoubleTaP,etc.
      * Gesture Detector
      *
      * Hover - Color
      * Tap - Splash
      *
      * Getsure -
      * Swipe,'
      *
      * Card - elevation background color,radius child
      *
      * ClipRRect - Frame - Photo Rectangle
      *
      * ClipPath - Custom CLips
      *
      * positioned  - Stack - topleft , top,down,left - 2.2
      *
      * */
          SingleChildScrollView(
            child: Column(
              children: [
                //Search Bar
                SafeArea(
                  child: Container(
                    //Search Wala Container

                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              print("Blank search");
                            } else {
                              getRecipes(searchController.text);
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Let's Cook Something!"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WHAT DO YOU WANT TO COOK TODAY?",
                        style: TextStyle(fontSize: 33, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Let's Cook Something New!",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: recipeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              margin: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        recipeList[index].appimgUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 200,
                                      )),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.black26),
                                          child: Text(
                                            recipeList[index].applabel,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ))),
                                  Positioned(
                                    right: 0,
                                    height: 40,
                                    width: 80,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)
                                            )
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.local_fire_department, size: 15,),
                                              Text(recipeList[index].appcalories.toString().substring(0, 6)),
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),

                Container(
                  height: 100,
                  child: ListView.builder( itemCount: reciptCatList.length, shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){

                        return Container(
                            child: InkWell(
                              onTap: () {},
                              child: Card(
                                  margin: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0.0,
                                  child:Stack(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(18.0),
                                          child: Image.network(reciptCatList[index]["imgUrl"], fit: BoxFit.cover,
                                            width: 200,
                                            height: 250,)
                                      ),
                                      Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          top: 0,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.black26),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    reciptCatList[index]["heading"],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 28),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  )
                              ),
                            )
                        );
                      }),
                )






              ],
            ),
          ),


        ],
      ),
    );
  }
}