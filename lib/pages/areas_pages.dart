import 'package:flutter/material.dart';

class AreasPage extends StatelessWidget {
  const AreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Filtrar por zonas",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            _flagContainer(context, 'Canadian', 'assets/flags/canadaa.png'),
            _flagContainer(context, 'Chinese', 'assets/flags/china.png'),
            _flagContainer(context, 'Croatian', 'assets/flags/croatia.png'),
            _flagContainer(context, 'Dutch', 'assets/flags/egypt.png'),
            _flagContainer(context, 'Egyptian', 'assets/flags/egypt.png'),
            _flagContainer(context, 'Mexican', 'assets/flags/mexico.png'),
            _flagContainer(context, 'Spanish', 'assets/flags/spanish.png'),
            _flagContainer(context, 'American', 'assets/flags/us.png'),
            _flagContainer(context, 'British', 'assets/flags/uk.png'),
          ],
        ),
      ),
    );
  }
}

Widget _flagContainer(BuildContext context, String area, String flagUrl) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'food_by_area', arguments: area);
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Image(
        image: AssetImage(flagUrl),
        width: 200.0,
        height: 200.0,
      ),
    ),
  );
}
