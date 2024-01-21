import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:versotech/app/components/alert_dialog.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Lista de Presença',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "QTD: ${store.names.length}",
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                for (int index = 0; index < store.names.length; index++)
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    child: ListTile(
                      title: const Text(
                        "Nome",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          store.names[index].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => store.removeName(index),
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => alertDialog(context, store, "Editar", index),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () => alertDialog(context, store, "Adicionar", 0),
        child: const Icon(
            Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
