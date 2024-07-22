import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_provise_assignment/src/model/item_model.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key});
  final dio = Dio();

  Future<List<ItemData>> fetchList() async {
    List<ItemData> data = [];
    try {
      Response response = await dio.get(
          'https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json');
      if (response.statusCode == 200 && response.data != null) {
        response.data.forEach((e) => data.add(ItemData.fromJson(e)));
      }
    } on DioException {
      throw Exception();
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List items'),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchList(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<ItemData>>(
            future: fetchList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : snapshot.hasError
                        ? Center(
                            child: Text('${snapshot.error}'),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                  children: List.generate(
                                      snapshot.data.length,
                                      (index) => Card(
                                            child: ListTile(
                                              title: Text(
                                                  '${snapshot.data[index].name}'),
                                              subtitle: Text(
                                                  '${snapshot.data[index].description}'),
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    snapshot.data[index].thumb),
                                              ),
                                            ),
                                          ))),
                            ),
                          ),
          ),
        ),
      ),
    );
  }
}
