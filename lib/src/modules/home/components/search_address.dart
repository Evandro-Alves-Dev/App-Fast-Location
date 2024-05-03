import 'package:flutter/material.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class SearchAddress extends StatefulWidget {
  final AddressModel address;

  const SearchAddress({
    super.key,
    required this.address,
  });

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [         
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                "Dados da Localização",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                "Logradouro/Rua: ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Expanded(
                child: Text(widget.address.publicPlace))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Expanded(
                child: Text(
                "Bairro/Distrito: ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )),
               Expanded(
                child: Text(widget.address.neighborhood))
            ],
          ),
          if(widget.address.complement != "")
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Expanded(
                child: Text(
                    "Complemento: ",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                   Expanded(
                child: Text(widget.address.complement ?? ''))
                ],
              ),
            ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Expanded(
                child: Text(
                "Cidade/UF: ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )),
               Expanded(
                child: Text('${widget.address.city}/${widget.address.state}'))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Expanded(
                child: Text(
                "CEP: ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 50
                ),
              )),
               Expanded(
                child: Text(widget.address.cep))
            ],
          ),          
        ],
      ),
    );
  }
}
