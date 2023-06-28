import 'package:bloc_example/Api%20Handling/data/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // FetchData fetchData=FetchData();
    // fetchData.fetchDataFromApi();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade300,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue.shade300,
            systemNavigationBarColor: Colors.blue.shade300),
      ),
      body: ListView.builder(
       itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            subtitle: Text("body",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                )),
            title: Text("Title",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
          );
        },
      ),
    );
  }
}
