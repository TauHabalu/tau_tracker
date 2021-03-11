import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tau_tracker/tracker_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'networks/rest_client.dart';

class TrackerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrackerListState();
  }
}

class TrackerListState extends State<TrackerList> {
  List<TrackerData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Tracker"),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adjust),
        onPressed: () => _loadTracker(context),
      ),
    );
  }

  _loadTracker(BuildContext context) async {
    // final response = await http.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=USD",
    //     headers: {'Accept':'application/json','X-CMC_PRO_API_KEY':'91edb478-c809-4a2d-8941-3687b246673d'});
    // if(response.statusCode == 200) {
    //   // print(response.body);
    //   var responseData = jsonDecode(response.body);
    //   var allData = responseData['data'] as List<dynamic>;
    //   var trackerData_list = List<TrackerData>();
    //   allData.forEach((val) {
    //     var record = TrackerData(val["name"],
    //         val["symbol"],
    //         val["cmc_rank"].toString(),
    //         val["quote"]["USD"]["price"]);
    //     trackerData_list.add(record);
    //   });
    //   setState(() {
    //     data = trackerData_list;
    //   });
    // }
    //
    // getFilterList(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    final dio = Dio();
    final client = RestClient(dio);
    await client
        .getCryptoList(1, 100, "USD", "91edb478-c809-4a2d-8941-3687b246673d")
        .then((response) {
      if (response != null) {
        Navigator.pop(context);
        var trackerData_list = List<TrackerData>();
        response.data.forEach((element) {
          var record = TrackerData(element.name, element.symbol,
              element.cmc_rank.toString(), element.quote.USD.price);
          trackerData_list.add(record);
        });
        setState(() {
          data = trackerData_list;
        });
      } else {
        Navigator.pop(context);
        // checkErrorState(context, null, scaffoldKey);
      }
    }).catchError((Object obj) {
      Navigator.pop(context);
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          // checkErrorState(context, obj, scaffoldKey);
          break;
        default:
          return null;
      }
    });
  }

  List<Widget> _buildList() {
    return data
        .map((TrackerData trackerData) => ListTile(
              subtitle: Text(trackerData.symbol),
              title: Text(trackerData.name),
              leading: CircleAvatar(child: Text(trackerData.rank)),
              trailing: Text("\$${trackerData.price.toStringAsFixed(2)}"),
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _loadTracker(context);
    });;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
