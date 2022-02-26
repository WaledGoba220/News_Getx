import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx/controller/news_controller.dart';
import 'package:news_getx/model/news_model.dart';



// ignore: use_key_in_widget_constructors
class Sports extends GetWidget{
  @override
  Widget build(BuildContext context) {

    NewsController controller=Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(title: const Text("News App"),),
      body: FutureBuilder(
          future: controller.getData("sports"),
          builder: (context,AsyncSnapshot snapshot)
          {
            Articles data=snapshot.data;
            if(snapshot.hasData)
            {
              return ListView.builder(

                  itemCount: data.articles.length,
                  itemBuilder:(context,int index)
                  {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Column(
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: double.infinity,
                            height: 150,
                            child: Image.network(
                              data.articles[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            data.articles[index].title.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,

                          ),
                          Text(
                            data.articles[index].description.toString(),
                            style: const TextStyle(
                                fontSize: 15,color: Colors.grey),
                            textDirection: TextDirection.rtl,

                          ),

                        ],
                      ),
                    );
                  } );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

}