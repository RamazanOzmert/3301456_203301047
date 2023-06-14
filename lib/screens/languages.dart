import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/languages.dart';

class Languages extends ConsumerStatefulWidget {
  const Languages({Key? key}) : super(key: key);
  @override
  ConsumerState<Languages> createState() => _Languages();
}

class _Languages extends ConsumerState<Languages> {
  @override
  void initState() {
    super.initState();
  }

  changeLan(String _languages) {
    ref.read(languagesProvider.notifier).changeLanguages(languages: _languages);
  }

  @override
  Widget build(BuildContext context) {
    var lang = ref.watch(languagesProvider).first;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        title: const Text(
          'Dil',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            //fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => changeLan('Türkçe'),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Türkçe'),
                    trailing: lang.languages == 'Türkçe'
                        ? Icon(
                            Icons.task_alt_rounded,
                            color: Colors.amber,
                          )
                        : null),
              ),
            ),
            GestureDetector(
              onTap: () => changeLan('English'),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text('English'),
                    trailing: lang.languages == 'English'
                        ? Icon(
                            Icons.task_alt_rounded,
                            color: Colors.amber,
                          )
                        : null),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Text(lang.languages),
            ),
          ],
        ),
      ),
    );
  }
}
