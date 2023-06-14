import 'package:flutter/material.dart';
import 'package:marketapp/globalStates/address.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressItem extends ConsumerStatefulWidget {
  const AddressItem({Key? key, required this.adr}) : super(key: key);
  final Address adr;
  @override
  ConsumerState<AddressItem> createState() => _AddressItem();
}

class _AddressItem extends ConsumerState<AddressItem> {
  @override
  void initState() {
    super.initState();
  }

  chngName(String _name) {
    ref
        .read(addressesProvider.notifier)
        .changeAddress(id: widget.adr.id, name: _name);
  }

  chngAddress(String _address) {
    ref
        .read(addressesProvider.notifier)
        .changeAddress(id: widget.adr.id, address: _address);
  }

  removeAddress() {
    ref.read(addressesProvider.notifier).remove(widget.adr.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buildDialog(context),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: const Icon(Icons.location_on),
          title: Text(widget.adr.name),
          subtitle: Text(widget.adr.address),
          trailing: IconButton(
            onPressed: () {
              removeAddress();
            },
            icon: Icon(Icons.restore_from_trash),
          ),
          isThreeLine: true,
        ),
      ),
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
                      onPressed: () => Navigator.pop(context, 'Kaydet'),
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
              initialValue: widget.adr.name,
              onChanged: (value) => chngName(value.toString()),
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
              initialValue: widget.adr.address,
              onChanged: (value) => chngAddress(value.toString()),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'adres',
              ),
            ),
          ],
        ));
  }
}
