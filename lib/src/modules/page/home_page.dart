import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: TextStyle(
            color: Colors.green[600],
            fontSize: 35,
            fontWeight: FontWeight.bold,
            height: 2.5),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.check)), // verificar e colocar o incone certo
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Icon(
                  Icons.directions,
                  color: Colors.green[600],
                  size: 100,
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        "Faça uma busca para localizar seu destino",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ),
            ElevatedButton(
              onPressed: () => {},              
              autofocus: true,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 10)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                "Localizar endereço",
                style: TextStyle(                  
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Container(
            //   margin: const EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 100,
            //   ),
            //   decoration: const BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(12)),
            //       color: Color.fromARGB(255, 29, 168, 33),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey,
            //           spreadRadius: 3,
            //           blurRadius: 10,
            //           offset: Offset(0, 1),
            //         )
            //       ]),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(right: 5),
            //         child: Icon(
            //           Icons.access_alarm,
            //           color: Colors.white,
            //           size: 35,
            //         ),
            //       ),
            //       Text(
            //         "Encontro ",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 40,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text(
            //         "02",
            //         style: TextStyle(
            //           color: Colors.black45,
            //           fontSize: 40,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                  "https://unisenaisc.com.br/wp-content/uploads/sites/12/2023/04/marca-1.png"),
            ),
            const Text(
              'Quantidade de vezes que você clicou no botão:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton.extended(
          label: const Icon(Icons.add),
          onPressed: _incrementCounter,
          // tooltip: 'Increment',
          // child: const Icon(Icons.add),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
            onPressed: _reset,
            child: const Text(
              "Reiniciar contador",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
