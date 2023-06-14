import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressesProvider =
    StateNotifierProvider<AddressNotifier, List<Address>>((ref) {
  return AddressNotifier(addresses: [
    const Address(
      id: '0',
      name: 'ev',
      address: 'Seyhan/Adana',
    ),
    const Address(
      id: "1",
      name: "iş",
      address: "seyhan adana2",
    ),
    const Address(
      id: "2",
      name: "adres2",
      address: "çukurova/adana",
    ),
  ]);
});

@immutable
class Address {
  final String id;
  final String name;
  final String address;

  const Address({
    required this.id,
    required this.name,
    required this.address,
  });

  Address copyWith({
    String? id,
    String? name,
    String? address,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }
}

class AddressNotifier extends StateNotifier<List<Address>> {
  AddressNotifier({addresses}) : super(addresses);

  void add(String _name, String _address) {
    var _length = (state.length + 1).toString();
    Address address = Address(id: _length, name: _name, address: _address);
    state = [...state, address];
  }

  void remove(String id) {
    state = [
      for (final item in state)
        if (item.id != id) item
    ];
  }

  void changeAddress({required String id, String? name, String? address}) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(
            id: id,
            name: name,
            address: address,
          )
        else
          item
    ];
  }
}
