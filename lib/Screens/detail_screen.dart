//External
import 'package:flutter/material.dart';
import 'package:gh_search_app/Models/repository.dart';
//Internal
import 'package:gh_search_app/Widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = ModalRoute.of(context)!.settings.arguments as Repository;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 165, 202),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.0,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(onPressed: () {
                Navigator.pop(context);
              },
              color: const Color.fromARGB(255, 118, 165, 202),
              child: const Text('Back')),
            ),
            Text( repo.name,
            style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),),
            Text( 'Owner: ${repo.owner}',
           style:  const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey,
      ),),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text( 'Description: ${repo.description}',
               style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),),
            ),
            Text('Url: ${repo.url}',
             style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),),

          ],
        ),
      ),
    );
  }
}