import 'package:flutter/material.dart';
import 'package:marketapp/globalStates/address.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marketapp/widgets/address_item.dart';

class ProfileAddress extends ConsumerStatefulWidget {
  const ProfileAddress({Key? key}) : super(key: key);

  ConsumerState<ProfileAddress> createState() => _ProfileAddress();
}

class _ProfileAddress extends ConsumerState<ProfileAddress> {
  @override
  void initState() {
    super.initState();
  }

  var _name;
  var _address;
  addAddress() {
    ref.read(addressesProvider.notifier).add(_name, _address);
  }

  @override
  Widget build(BuildContext context) {
    var adr = ref.watch(addressesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        title: const Text(
          'Adreslerim',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            //fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () => buildDialog(context),
                child: const Card(
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.plus_one),
                    title: Text('adres ekle'),
                  ),
                ),
              ),
              Wrap(
                children: adr.map((_adr) => AddressItem(adr: _adr)).toList(),
              ),
            ],
          )),
    );
  }

  buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: buildEditRows(context),
        title: Text('Adresi Düzenle'),
        actions: <Widget>[
          Container(
              width: 700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400]),
                      onPressed: () => Navigator.pop(context, 'Kapat'),
                      child: const Text('Kapat'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      onPressed: () {
                        addAddress();
                        Navigator.pop(context, 'Kaydet');
                      },
                      child: const Text('Kaydet'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  buildEditRows(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        height: 250,
        child: Wrap(
          runSpacing: 15,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) => setState(() {
                _name = value.toString();
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'adres adı',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              expands: false,
              minLines: 2,
              maxLines: 5,
              maxLength: 150,
              onChanged: (value) => setState(() {
                _address = value.toString();
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'adres',
              ),
            ),
          ],
        ));
  }
}
