import 'package:flutter/material.dart';
import '/../main.dart';
import 'package:nfc_manager/nfc_manager.dart';


class Testpage extends StatefulWidget
{
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}
  class _TestpageState extends State<Testpage>
  {
    String status = 'Waiting for NFC...';

    Future<void> startNfcSession() async 
    {
      setState(() => status = 'Starting NFC session...');
      NfcAvailability isAvailable = await NfcManager.instance.checkAvailability();

      if (isAvailable == NfcAvailability.enabled)
      {
        setState(() => status = 'NFC session started. Waiting for target');
        NfcManager.instance.startSession
        (
          pollingOptions: {NfcPollingOption.iso},
          onDiscovered: (NfcTag tag) async 
          {
            try 
            {
              final msg = tag.data.toString();
              setState(() => status = "msg: $msg");
            }
            catch(e)
            {
              setState(() => status = "Error");
            }
          }
        );
      }
      else
      {
        setState(() => status = 'Still Waiting for Session to start.....');
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
              ElevatedButton(onPressed: startNfcSession, child: Text("Start Nfc"))
            ]
          )
        )
      );
    }
  }



