import 'package:flutter/material.dart';
import 'package:versotech/app/modules/home/home_store.dart';


alertDialog(BuildContext context, HomeStore store, String mode, int index) => showDialog(
  context: context,
  builder: (context) => SingleChildScrollView(
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * .5,
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: [
              TextField(
                onChanged: (value) => store.setName(value),
                cursorColor: Colors.black45,
                decoration:  InputDecoration(
                  labelText: mode == "Editar" ? store.getName(index) : "Nome",
                  labelStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancelar",
            style: TextStyle(
              fontSize: 11,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            elevation: 2,
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: () {
            mode == "Editar" ? store.replaceName(index) : store.addName();
            Navigator.pop(context);
          },
          child: Text(
            mode,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  ),
);