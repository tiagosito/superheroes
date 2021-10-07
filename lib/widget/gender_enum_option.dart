import 'package:flutter/material.dart';
import 'package:superheroes/model/gender_enum.dart';

class GenderEnumOption extends StatelessWidget {
  const GenderEnumOption({
    Key? key,
    required this.onTap,
    required this.skill,
    required this.skillValue,
    required this.genderEnum,
  }) : super(key: key);

  final Function onTap;
  final String skill;
  final GenderEnum skillValue;
  final ValueNotifier<GenderEnum?> genderEnum;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<GenderEnum>(
              value: skillValue,
              groupValue: genderEnum.value,
              onChanged: (value) {
                onTap.call();
              },
            ),
            Text(
              skill,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
