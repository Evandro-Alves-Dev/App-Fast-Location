import 'dart:convert';
import 'package:fast_location/src/modules/home/components/search_address.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class InputScreen extends StatefulWidget {
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _cepController = TextEditingController();
  String _address = '';
  bool _isLoading = false;
  late AddressModel addressModel = AddressModel(
    cep: '',
    publicPlace: '',
    complement: '',
    neighborhood: '',
    city: '',
    state: '',
  );

  Future<AddressModel> _searchAddress(String cep) async {
    setState(() {
      _isLoading = true;
    });

    final cep = _cepController.text;

    if (cep.isEmpty || cep.length != 8) {
      setState(() {
        _address = 'O CEP não pode ser vazio e deve ter 8 dígitos';
        _isLoading = false;
        throw Exception(_address);
      });
    } else {
      final url = 'https://viacep.com.br/ws/$cep/json/';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.containsKey('erro') && data['erro'] == true) {
          setState(() {
            _isLoading = false;
            _address =
                'Não foi possível encontrar o endereço para o CEP informado.';
            throw Exception(_address);
          });
        } else {
          setState(() {
            addressModel = AddressModel.fromJson(data);
          });
        }
      } else {
        setState(() {
          _isLoading = false;
          _address =
              'Não foi possível encontrar o endereço para o CEP informado.';
          throw Exception(_address);
        });
      }

      setState(() {
        _isLoading = false;
      });
    }
    return addressModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              decoration: const InputDecoration(
                hintText: 'Digite o CEP',
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final addressModel =
                        await _searchAddress(_cepController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchAddress(address: addressModel),
                      ),
                    );
                  },
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : const Text('Buscar'),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(title: "Fast Location"),
                    ),
                  ),
                },
                child: const Text('Voltar'),
              ),
            ),
            Text(
              _address,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
