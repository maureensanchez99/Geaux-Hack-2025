import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';

class GamePage extends StatelessWidget {
  final String username;
  const GamePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      resizeToAvoidBottomInset: false, 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/logo_design.svg',
                  height: 350,
                  width: 350,
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Challenge Location:',
                      style: TextStyle(
                        fontFamily: 'Merienda',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: NatureQuestApp.earthyBrown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Find us by the lakes behind Herget Hall',
                      style: TextStyle(
                        fontFamily: 'Merienda',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    Text(
                      'Challenge:',
                      style: TextStyle(
                        fontFamily: 'Merienda',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: NatureQuestApp.earthyBrown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Imitate the call of the local birds',
                      style: TextStyle(
                        fontFamily: 'Merienda',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),

                    Flexible(
                      child: SizedBox(
                        width: 240,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter challenge code',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        // check if code is correct
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NatureQuestApp.natureGreen,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: const Text(
                        'Submit Code',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
