import 'package:flutter/material.dart';
import 'package:travel_agency/home/widget/app_drawwer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final List<String> explore = ["Popular", "Country", "Night", "Historical", "Mountains", "Culture", "Dishes"];
  
  final List<Map<String, dynamic>> packageItems =[
    {
      "image":"https://tse2.mm.bing.net/th/id/OIP.dEPxWNvzHo4AdO0z8g1JdAHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Family Tour",
      "Prices": "5000 USD",
      "Packages":"SAARC Tour"
    },
    {
      "image":"https://cda.1001malam.com/uploads/tour/solocitytourpackage2d1n_istanamangkunegaran_1453.JPG",
      "title":"Solo",
      "Prices":"USD 10000",
      "Packages":"1 country"
    },
    {
      "image":"https://assets-global.website-files.com/56e9debf633486e330198479/6037da8f9802d561500f9812_group%20travel.jpg",
      "title":"Group Tour",
      "Prices":"USD 40000",
      "Packages":"5 countries"
    },
    {
      "image":"https://th.bing.com/th/id/OIP.u9H6hW9Wmg2wJ_wWu3xQxAHaD2?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Companies Tour",
      "Prices":"per individual",
      "Packages":"Specific"
    },
    {
      "image":"https://tse2.mm.bing.net/th/id/OIP.oRu0SxZkb3Tn4MFmrXWp3AHaC5?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"VVIP Tour with securities",
      "Prices":"USD 1 Billion",
      "Packages":"VIP Tour"
    },
    {
      "image":"https://tse3.mm.bing.net/th/id/OIP.8p6al1cDx6bCBQKMnJKo0wHaEN?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Festival and adventure",
      "Prices":"USD 1 Trillion",
      "Packages":"Presidency"
    }
  ];
  final List<Map<String, dynamic>> mostvisited =[
    {
      "image":"https://tse1.mm.bing.net/th/id/OIP.7VWg6NGV8GrQ5KmA90FMnAHaEA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Times Square",
      "Add":"Favourites"
    },
    {
      "image":"https://static.vecteezy.com/system/resources/previews/033/863/522/large_2x/great-wall-of-china-at-sunrise-panoramic-view-of-china-the-great-wall-of-china-in-the-mist-lying-long-surrealist-view-from-dronegraphy-8k-ai-generated-free-photo.jpg",
      "title":"Great Wall of China",
      "Add":"Favourites"
    },
    {
      "image":"https://tse4.mm.bing.net/th/id/OIP.zU4yIsTDd7b1hhEi-jLRVwHaEQ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Taj Mahal",
      "Add":"Favourites"
    },
    {
      "image":"https://tse4.mm.bing.net/th/id/OIP.vlSqXpPPvVIYXW6GPhy0RQHaJ4?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Eiffel Tower",
      "Add":"Favourites"
    },
    {
      "image":"https://tse2.mm.bing.net/th/id/OIP.JZtZFOtKsWoni75gxVJbLgHaE5?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Disney World (Orlando)",
      "Add":"Favourites"
    },
    {
      "image":"https://th.bing.com/th/id/R.63d0f5f687eee8267cafcbbd4d387c36?rik=31SZpsOFR8zs5A&pid=ImgRaw&r=0",
      "title":"Grand Bazaar",
      "Add":"Favourites"
    },
  ];
  final List<Map<String, String>> imageItems = [
    {
      "image":"https://tse3.mm.bing.net/th/id/OIP.lNmQGL7yXEufIZBUxC6p7gHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Adventure",
      "date":"1909-02-23"
    },
    {
      "image":"https://cdn.getyourguide.com/image/format=auto,fit=crop,gravity=auto,quality=60,width=450,height=450,dpr=2/tour_img/011f1169380eb06de9e48272bca5e757f2745be958af35df0e30ce7936c385b6.png",
      "title":"Historic Site",
      "date":"2025-07-20"
    },
    {
      "image":"https://tse1.mm.bing.net/th/id/OIP.1LppgW_EyDH7jr06X2MvfwHaEo?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title":"Beautiful Mountain",
      "date":"2025-03-12"
    },
    {
      "image":"https://th.bing.com/th/id/R.18b31d96f17fbef4de9ca72fcab8852a?rik=JH8uPwDvJois%2bw&pid=ImgRaw&r=0",
      "title":"City at Night",
      "date":"2025-04-04"
    }
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: AppBar(
        title: Row(
        children: [
          Text("Explore"),
          SizedBox(width: 20,),
        ],
      ),
      actions: [
        CircleAvatar(
          child: Text("T"),
        )
      ],
      ),
      
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(),
                    prefixIcon: IconButton(
                      onPressed: ()=> searchController.clear(),
                      icon: Icon(Icons.search)
                    )
                  ),
                ),
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: explore.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Chip(
                            label: Text(explore[index]),
                            backgroundColor: Colors.white,
                          )
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imageItems.length,
                  itemBuilder: (context, index){
                    //final item = imageItems[index];
                    return Container(
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(imageItems[index]["image"]!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color.fromARGB(255, 38, 37, 37), Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter
                                )
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(imageItems[index]["title"]!, 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  Text(imageItems[index]["date"]!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                  ),
                                  )
                                ],
                              ),
                            )
                            
                          ],
                        ),
                                      
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Packages", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: packageItems.length,
                  itemBuilder: (context, index){
                    //final item = imageItems[index];
                    return Container(
                      width: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(packageItems[index]["image"]!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color.fromARGB(255, 38, 37, 37), Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter
                                )
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 7, 176, 255),
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Center(
                                  child: Text(packageItems[index]["Packages"], 
                                  style: TextStyle(color:const Color.fromARGB(255, 17, 17, 17), 
                                  fontSize: 20, fontWeight: FontWeight.bold),)))
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(packageItems[index]["title"]!, 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(packageItems[index]["Prices"]!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                  ),
                                  )
                                ],
                              ),
                            )
                            
                          ],
                        ),
                                      
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Most visited Places", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  ),
                ],
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mostvisited.length,
                  itemBuilder: (context, index){
                    //final item = imageItems[index];
                    return Container(
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(mostvisited[index]["image"]!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [const Color.fromARGB(255, 38, 37, 37), Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter
                                )
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(mostvisited[index]["title"]!, 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(mostvisited[index]["Add"]!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                  ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}