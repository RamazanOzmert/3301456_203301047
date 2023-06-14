import 'package:flutter/material.dart';
import 'package:marketapp/util/address.dart';
import 'package:marketapp/globalStates/address.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/screens/profil_address.dart';

class AddressRow extends ConsumerStatefulWidget {
  const AddressRow({Key? key, this.adress}) : super(key: key);
  final adress;
  @override
  ConsumerState<AddressRow> createState() => _AddressRow();
}

class _AddressRow extends ConsumerState<AddressRow> {
  @override
  void initState() {
    super.initState();
  }

  dynamic selected;
  @override
  Widget build(BuildContext context) {
    var adress = selected ?? "Lütfen bir adres seçin";

    return Container(
      color: Color(0xFFFFE45E),
      constraints: BoxConstraints(
        minHeight: 48.0,
        maxHeight: 50.0,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(100, 50),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        adress,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.expand_more,
                        color: Colors.blue,
                      ),
                    ]),
                onPressed: () => buildModalBottomSheet(context),
              ),
            ),
            //
            Expanded(
              flex: 1,
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 48.0,
                  maxHeight: 50.0,
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Minimum',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                        Text('75 TL',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Gönderim',
                            style: TextStyle(
                              fontSize: 11.0,
                            )),
                        Text('Ücreti',
                            style: TextStyle(
                              fontSize: 11.0,
                            )),
                        Text('15 TL',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  buildModalBottomSheet(BuildContext context) {
    var adr = ref.watch(addressesProvider);
    return showModalBottomSheet<State>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    height: 5.0,
                    width: 50.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                height: 50.0,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Teslimat adresi seçin.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton.icon(
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).accentColor,
                        size: 20,
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      label: Text(
                        'Adreslerim',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileAddress(),
                          ),
                        )
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 12,
              fit: FlexFit.tight,
              child: Container(
                constraints: BoxConstraints(minHeight: 100.0, maxHeight: 230.0),
                color: Theme.of(context).backgroundColor,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: adr
                      .map(
                        (e) => ListTile(
                          leading: Radio(
                            value: e.address,
                            groupValue: adr,
                            onChanged: (value) {
                              setState(() {
                                selected = value.toString();
                              });
                            },
                          ),
                          title: Text(e.name),
                          subtitle: Text(e.address),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                height: 60.0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).accentColor,
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        label: Text(
                          'adres ekle',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        );
      },
    );
  }
}
