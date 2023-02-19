import 'dart:async';
import 'dart:convert';
import 'package:countries_info/screens/country_detail_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:countries_info/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamController streamController;
  late Stream stream;

  var countryList = <CountryModel>[];

  getAllCountriesData() async {
    streamController.add('loading');
    var url = 'https://restcountries.com/v2/all';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var countryData in jsonData) {
        CountryModel countryModel = CountryModel.fromJSON(countryData);
        countryList.add(countryModel);
        streamController.add(countryList);
      }
    } else {
      streamController.add('went wrong');
    }
  }

  @override
  void initState() {
    streamController = StreamController();
    stream = streamController.stream;
    super.initState();
    getAllCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries Info'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 'loading') {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == 'went wrong') {
              return const Text('Something went wrong');
            } else {
              return ListView.builder(
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  var countryData = countryList[index];
                  return Card(
                    color: Colors.black12,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CountryDetail(countryModel: countryData);
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        child: ClipOval(
                          child: SvgPicture.network(
                            countryData.flag,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(countryData.name),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}