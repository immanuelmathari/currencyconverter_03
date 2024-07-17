import 'package:currencyconverter/functions/fetchrates.dart';
import 'package:currencyconverter/models/ratesmodel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<RatesModel> result; // comes way after after going to fetchrates then ratesModel then the return in here
  final formKey = GlobalKey<FormState>();
  @override

  void initState() {
    super.initState();
    result = fetchrates();
  }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Currenct converter', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: 65, left: 15, right: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/demo.png'),
            fit: BoxFit.cover,
          )
        ),
        child:
        SingleChildScrollView(
          // we have to define the key variable
          child: Form(key: formKey,
          child: FutureBuilder<RatesModel>(
            future: result,
            builder: (context,snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: Text(snapshot.data!.rates.toString(), style: const TextStyle(fontSize: 20, color: Colors.white),),
              );
            }
          ),
        ),),
      ),
    );
  }
}