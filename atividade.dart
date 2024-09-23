import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  final String login = "";
  final String senha = "";

  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Papelaria Faz Bem',
                  style: TextStyle(fontSize: 50.0, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 50.0),
              const SizedBox(
                  height: 5.0), 
              SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    controller: loginController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Login',
                      prefixIcon:
                          const Icon(Icons.account_circle_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  )),

              const SizedBox(
                  height: 5.0),
              SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    controller: senhaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // customização
                      hintText: 'Senha', //hint
                      prefixIcon: const Icon(Icons.filter_9_plus), //icon
                      enabledBorder: OutlineInputBorder(
                        //borda ao redor da entrada
                        borderSide:
                            BorderSide(color: Colors.black), //cor da borda
                      ), //quando receber o foco, altera cor da borda
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  )),

              const SizedBox(height: 30.0),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                ),
                onPressed: () {
                  if (loginController.text == login &&
                      senhaController.text == senha) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Erro'),
                        content: const Text('Login ou senha incorretos!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Lista de Produtos',
                style: TextStyle(fontSize: 24.0, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
            
            
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ThirdPage(produto: "Tesoura")),
                      );
                    },
                    child: const Text('Tesoura'),
                  ),
                  
                  
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPage(produto: "Cola")),
                      );
                    },
                    child: const Text('Cola'),
                  ),
                  
                  
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPage(produto: "Papel")),
                      );
                    },
                    child: const Text('Papel'),
                  ),
                  
                  
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPage(produto: "Caneta")),
                      );
                    },
                    child: const Text('Caneta'),
                  ),
                  
                  
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ThirdPage(produto: "Borracha")),
                      );
                    },
                    child: const Text('Borracha'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  final String produto;
  const ThirdPage({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Detalhes da Compra',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 20.0),
            
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                produto,
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
            
            
            const SizedBox(height: 20.0),
            
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Quantidade',
                ),
              ),
            ),
            
            
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Voltar'),
                ),
                
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourPage()),
                    );
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Papelaria Faz Bem',
                  style: TextStyle(fontSize: 50.0, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            
            const SizedBox(height: 15.0),
            const Text(
              'Pedido Confirmado!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
