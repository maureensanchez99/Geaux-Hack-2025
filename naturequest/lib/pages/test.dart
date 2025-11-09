import 'package:flutter/material.dart';
import '/../main.dart';
import 'package:http/http.dart' as http;

String status = "Check on DB";

const base = 'http://100.111.150.67:8000'; 
class Testpage extends StatefulWidget
{
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}
  class _TestpageState extends State<Testpage>
  {
    Future<void> checkhealth() async 
    {
      setState(() => status = "Checking....");
      final r = await http.get(Uri.parse('$base/health'));
      try
      {
        if (r.statusCode == 200)
        {
          setState(() => status = "Database/Api is online!");
        }
        else
        {
          setState(() => status = "Http return this error code: ${r.statusCode}");
        }
      }
      catch (e) 
      {
        setState(() => status = "Something Fucked up");
      }
    }

    
  
  
    @override
    Widget build(BuildContext context)
    {
      return Scaffold
      (
        backgroundColor: NatureQuestApp.softMintGreen,
        body: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text(status),
              ElevatedButton(onPressed: checkhealth, child: Text("Check Health"))
            ]
          )
        )
      );
    }
  }



