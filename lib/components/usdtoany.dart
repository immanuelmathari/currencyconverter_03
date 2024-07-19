// conversion of usd to any currency
import 'package:currencyconverter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget{
  // const UsdToAny({super.key});

  final rates;
  final Map currencies;
  const UsdToAny({Key? key, required this.rates, required this.currencies}) : super(key: key);

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'INR';
  String answer = 'Converted Currency';
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    var w = MediaQuery.of(context).size.width;


    return Card(color: Colors.transparent,
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text('USD to Any currency', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            key: const Key('usd'),
            controller: usdController,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter USD', hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(child: DropdownButton<String>(
                dropdownColor: Colors.grey.shade500,
                value: dropdownValue,
                style: const TextStyle(color: Colors.white),
                icon: const Icon(Icons.arrow_drop_down_circle_rounded, color: Colors.white),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Colors.grey.shade400,
                ),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),),
              const SizedBox(
                width: 10,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                      setState(() {
                        // to create convertusd in fetchrates
                        answer = usdController.text + 'USD     =      ' + convertusd(widget.rates, usdController.text, dropdownValue) + ' ' + dropdownValue;
                      });
                  },
                  child: const Text('Convert'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade400),
                  )
                )
              )
            ]
          ),
          const SizedBox(
            height: 19,
          ),
          Container(
            child: Text(answer, style: const TextStyle(color: Colors.white),),
          )
        ]
      )
    ),
    );
  }
}