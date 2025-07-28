import 'package:flutter/material.dart';
import 'package:travel_agency/packages/page/packages_page.dart';

class CityPage extends StatelessWidget {
  final String country;

  CityPage({required this.country});
  final Map<String, List<Map<String, String>>> cities = {
  'USA': [
    {'name': 'New York', 'imageUrl': 'https://th.bing.com/th/id/R.5b28c1fd91f9ee8a65981359332b7076?rik=Y7iPOosgwyCCxw&riu=http%3a%2f%2fwww.experiencify.com%2fwp-content%2fuploads%2f2015%2f02%2fnew-york.jpg&ehk=jTfdZL4HbRoqXHwEBP17ovrSfjt8KBuvyV9uLklFqJY%3d&risl=1&pid=ImgRaw&r=0'},
    {'name': 'Los Angeles', 'imageUrl': 'https://www.explore.com/img/gallery/the-best-itinerary-if-you-only-have-one-day-in-los-angeles/l-intro-1699466577.jpg'},
    {'name': 'Chicago', 'imageUrl': 'https://th.bing.com/th/id/R.694779291c06041181faa1f06c83bf7f?rik=chBWv7Wksu2uPw&riu=http%3a%2f%2fjustshortofcrazy.com%2fwp-content%2fuploads%2f2013%2f07%2fCC_Skyline_NorthLakeshore.jpg&ehk=w6Fu%2bBSl8GpiumWHmsNUl5OF69a15gOxhiMu%2bT4KNYM%3d&risl=1&pid=ImgRaw&r=0'},
  ],
  'Canada': [
    {'name': 'Toronto', 'imageUrl': 'https://tse2.mm.bing.net/th/id/OIP.9HjaZYKlA8fbcO0e1hzp7wHaE8?rs=1&pid=ImgDetMain&o=7&rm=3'},
    {'name': 'Vancouver', 'imageUrl': 'https://th.bing.com/th/id/R.a573210ec30a2ada27165ec2574bfe84?rik=poBP%2fAupGyfTzA&pid=ImgRaw&r=0'},
    {'name': 'Montreal', 'imageUrl': 'https://th.bing.com/th/id/R.86538df61020371ec237f542fb54cb84?rik=2NEMfX5USJyY4g&pid=ImgRaw&r=0'},
  ],
  'India': [
    {'name': 'Delhi', 'imageUrl': 'https://www.mistay.in/travel-blog/content/images/2020/07/travel-4813658_1920.jpg'},
    {'name': 'Mumbai', 'imageUrl': 'https://tse2.mm.bing.net/th/id/OIP.3H6Tc08X_vDP1koalgF1UQHaE0?rs=1&pid=ImgDetMain&o=7&rm=3'},
    {'name': 'Bangalore', 'imageUrl': 'https://th.bing.com/th/id/R.218bad2a0793b11411129f2fe64cddea?rik=%2fXyD8fITvFBS7w&pid=ImgRaw&r=0'},
  ],
  'Germany': [
    {'name': 'Berlin', 'imageUrl': 'https://media.timeout.com/images/105303515/1372/1029/image.jpg'},
    {'name': 'Munich', 'imageUrl': 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/03/23/13/munich-alamy.jpg'},
    {'name': 'Hamburg', 'imageUrl': 'https://th.bing.com/th/id/R.5656656d19cf19a694577cf6297bdc23?rik=hFY0QhqAP%2bJ97w&riu=http%3a%2f%2fimages.trvl-media.com%2fmedia%2fcontent%2fshared%2fimages%2ftravelguides%2fHamburg-and-vicinity-180004-smallTabletRetina.jpg&ehk=pOYWZzX1In5hIhuFdvH3yS3W3umy3IcNDPnDKReyMd8%3d&risl=&pid=ImgRaw&r=0'},
  ],
  'Australia': [
    {'name': 'Sydney', 'imageUrl': 'https://th.bing.com/th/id/R.955893c4f85b6a065abe6dc83e1c655e?rik=lyVbe4H5e%2fwfSw&pid=ImgRaw&r=0'},
    {'name': 'Melbourne', 'imageUrl': 'https://th.bing.com/th/id/R.50ffe58e096261a589577546a69a605e?rik=%2bSMxF0yFUdQ2gg&pid=ImgRaw&r=0'},
    {'name': 'Brisbane', 'imageUrl': 'https://th.bing.com/th/id/R.4ddcd896da6bed6dd98c46ba485bb2ea?rik=1a%2b07kpqWP175Q&pid=ImgRaw&r=0'},
  ],
  'UK': [
    {'name': 'London', 'imageUrl': 'https://tse4.mm.bing.net/th/id/OIP.vYRu1mpGPZgsXniQRY7jvAHaDX?rs=1&pid=ImgDetMain&o=7&rm=3'},
    {'name': 'Manchester', 'imageUrl': 'https://th.bing.com/th/id/R.3f251d623656ce0d70828a5e60891654?rik=Y9UQaxBVopGSbg&pid=ImgRaw&r=0'},
    {'name': 'Birmingham', 'imageUrl': 'https://th.bing.com/th/id/R.d8ac6e549ccd8fff90450fb7e6b9842b?rik=rcm2AA%2fVER8%2fKw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-0Rdi3HUdgxc%2fUqGWk1kPhtI%2fAAAAAAAAdYk%2f_d3-W7UEKgA%2fs1600%2fBirmingham%2b1.jpg&ehk=tUK862fw4OMsIdB3h95Liv63WFTY5Kre8xgEC8QG3wg%3d&risl=&pid=ImgRaw&r=0'},
  ],
};

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>>? countryCities = cities[country];

    return Scaffold(
      appBar: AppBar(title: Text("$country Cities")),
      body: countryCities == null || countryCities.isEmpty
          ? Center(child: Text("No cities available"))
          : ListView.builder(
              itemCount: countryCities.length,
              itemBuilder: (context, index) {
                final city = countryCities[index]["name"]!;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TravelPage(
                      country: country, 
                      city: city
                    ))
                    
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.network(countryCities[index]['imageUrl']!, fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.black, Colors.transparent], 
                            begin: Alignment.bottomLeft, 
                            end: Alignment.bottomCenter
                          )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 10,
                        child: Text(countryCities[index]["name"]!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                      )
                  
                    ],
                  
                  ),
                );
              },
            ),
    );
  }
}