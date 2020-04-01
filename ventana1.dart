import 'package:flutter/material.dart';
import 'productos.dart';

class Ventana1 extends StatefulWidget {

Ventana1() : super();
  final String title = "DataTable Proyecto UNACH";
  @override
  Ventana1State createState() => Ventana1State();
}

class Ventana1State extends State<Ventana1> {

List<Productos> users;
  List<Productos> selectedUsers;
  bool sort;
 
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = Productos.getUsers();
    super.initState();
  }
 
  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.idP.compareTo(b.descripcion));
      } else {
        users.sort((a, b) => b.idP.compareTo(a.descripcion));
      }
    }
  }
 
  onSelectedRow(bool selected, Productos user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }
 
  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<Productos> temp = [];
        temp.addAll(selectedUsers);
        for (Productos user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }
 
  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("idProd"),
              numeric: false,
              tooltip: "Identificador de Producto",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("Descripcion"),
            numeric: false,
            tooltip: "Descripcion del Producto",
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
                      selected: selectedUsers.contains(user),
                      onSelectChanged: (b) {
                        print("Onselect");
                        onSelectedRow(b, user);
                      },
                      cells: [
                        DataCell(
                          Text(user.idP),
                          onTap: () {
                            print('Selected ${user.idP}');
                          },
                        ),
                        DataCell(
                          Text(user.descripcion),
                        ),
                      ]),
            )
            .toList(),
      ),
    );
  }


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(widget.title),backgroundColor: Colors.green[700],),
backgroundColor: Colors.green[50],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECCIONADOS ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('ELIMINAR '),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
