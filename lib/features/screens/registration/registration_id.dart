import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';
import 'package:regain_mobile/constants/text_strings.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/features/screens/registration/registration_complete_page.dart';
import 'package:regain_mobile/themes/elements/button_styles.dart';

class RegistrationIDPage extends StatelessWidget {
  const RegistrationIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 16;
    double iconSize = screenWidth > 600 ? 60 : 40;
    double fontSize = screenWidth > 600 ? 24 : 20;

    return Scaffold(
      appBar: buildAppBar(context, ''),
      body: SingleChildScrollView(  
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Icon(
                  Icons.lock,
                  size: iconSize,
                  color: green,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Additional Step',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Provide Your ID Information',
                      style: TextStyle(
                        fontSize: fontSize - 4,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            
            const Text(
              'Upload your ID:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: screenWidth > 600 ? 150 : 100,
                height: screenWidth > 600 ? 150 : 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: screenWidth > 600 ? 60 : 40,
                ),
              ),
            ),
            const SizedBox(height: 20),

            
            const Text(
              'ID Type:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              hint: const Text('Select ID Type'),
              items: [
                'Driver’s License',
                'Passport ',
                'Postal ID',
                'National ID',
                'Phil-health ID',
                'SSS ID'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),


            const Text(
              'ID Number:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your ID Number',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: green),
                ),
              ),
            ),
             const SizedBox(height: 20),


            const Text(
              'Birth Date:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  //validation code here
                }
              },
              decoration: const InputDecoration(
                hintText: 'Select your Birth Date',
                suffixIcon: Icon(Icons.calendar_today),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: green),
                ),
              ),
            ),

            const SizedBox(
              height: ReGainSizes.spaceBtwSections,
            ),

            RegainButtons(
              text: ReGainTexts.signUp,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationCompletePage(),
                  ),
                );
              },
              type: ButtonType.filled,
              txtSize: BtnTxtSize.large,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
