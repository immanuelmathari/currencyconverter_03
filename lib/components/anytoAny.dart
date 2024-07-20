// conversion of usd to any currency
import 'package:currencyconverter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class AnyToAny extends StatefulWidget{
  // const UsdToAny({super.key});

  final rates;
  final Map currencies;
  const AnyToAny({Key? key, required this.rates, required this.currencies}) : super(key: key);

  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();
  String dropdownValue1 = 'KES';
  String dropdownValue2 = 'INR';
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
              mainAxisSize:  MainAxisSize.min,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: const Text('Convert any currency', textAlign: TextAlign.center ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const ValueKey('amount'),
                  controller: amountController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter Amount', hintStyle: TextStyle(color: Colors.grey),
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
                        value: dropdownValue1,
                        style: const TextStyle(color: Colors.black),
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
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text('To', style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.grey.shade600,
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                        });
                        },
                          items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                              style: TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                        ),
                      ),
                      ],
                ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          child: ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  // to create convertusd in fetchrates
                                  answer = amountController.text + '  '  + dropdownValue1 + '  =   '    + convertany(widget.rates, amountController.text, dropdownValue1, dropdownValue2) + ' ' + dropdownValue2;
                                });
                              },
                              child: const Text('Convert', style: TextStyle(color: Colors.black)),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade400),
                              )
                          )
                      ),
                const SizedBox(
                  width: 10,
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