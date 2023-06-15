import 'package:flutter/material.dart';
import 'package:marketapp/globalStates/address.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marketapp/widgets/address_item.dart';

class UserFavories extends ConsumerStatefulWidget {
  const UserFavories({Key? key}) : super(key: key);

  ConsumerState<UserFavories> createState() => _UserFavories();
}

class _UserFavories extends ConsumerState<UserFavories> {
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
          'Favorilerim',
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
}
