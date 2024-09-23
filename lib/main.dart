import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
              Image.asset(
                'logo.png', 
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FirstPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Future<String> getToken() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/36af98ee-9643-4ced-a59e-9f9d44fca62d'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['token'];
    } else {
      return 'token 123';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50.0),
              const SizedBox(height: 5.0), 
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  controller: loginController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Login',
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  controller: senhaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    prefixIcon: const Icon(Icons.filter_9_plus),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () async {
                  String token;
                  try {
                    token = await getToken();
                  } catch (e) {
                    token = 'token teste'; // Token fixo em caso de erro
                  }

                  // Mostra o token recebido ou o token fixo
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Token'),
                      content: Text('Token recebido: $token'),
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

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<dynamic> dataList = [];
  List<dynamic> filteredList = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://run.mocky.io/v3/36af98ee-9643-4ced-a59e-9f9d44fca62d'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          dataList = jsonResponse['data']; 
          filteredList = dataList; 
        });
      } else {
        throw Exception('Falha ao carregar dados');
      }
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

  //Future<void> fetchData() async {
  //  dataList = [
  //    {"matricula": 1, "name": "João", "nota": 85},
  //    {"matricula": 2, "name": "Maria", "nota": 76},
  //    {"matricula": 3, "name": "Pedro", "nota": 58},
  //    {"matricula": 4, "name": "Ana", "nota": 100},
  //    {"matricula": 5, "name": "Lucas", "nota": 45},
  //  ];

  //  setState(() {
  //    filteredList = dataList;
  //  });
  //}

  //chama fetchData ao iniciar a página, carregando os dados assim que a página é criada.
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void filterNotaBaixa() {
    setState(() {
      filteredList = dataList.where((item) => item['nota'] < 60).toList();
    });
  }

  void filterNotaMedia() {
    setState(() {
      filteredList = dataList.where((item) => item['nota'] >= 60 && item['nota'] < 100).toList();
    });
  }

  void filterNotaMaxima() {
    setState(() {
      filteredList = dataList.where((item) => item['nota'] == 100).toList();
    });
  }

  Color getBackgroundColor(int nota) {
    if (nota == 100) {
      return Colors.green;
    } else if (nota >= 60) {
      return Colors.blue;
    } else {
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas dos Alunos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = filteredList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: getBackgroundColor(item['nota']),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Text('Matrícula: ${item['matricula']} - Nome: ${item['name']}'),
                    subtitle: Text('Nota: ${item['nota']}'),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: filterNotaBaixa,
                child: const Text('Nota < 60'),
              ),
              ElevatedButton(
                onPressed: filterNotaMedia,
                child: const Text('Nota >= 60'),
              ),
              ElevatedButton(
                onPressed: filterNotaMaxima,
                child: const Text('Nota = 100'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
