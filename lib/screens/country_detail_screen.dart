import 'package:countries_info/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetail extends StatelessWidget {
  final CountryModel countryModel;

  const CountryDetail({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryModel.name),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.network(
              countryModel.flag,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text('Region')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Text(countryModel.region),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: Text('Sub Region')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Text(countryModel.subregion),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: Text('Capital')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Text(countryModel.capital.toString()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: Text('Population')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Text(countryModel.population.toString()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(child: Text('Borders')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Text(countryModel.borders.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}