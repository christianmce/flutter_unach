//Clase productos en la cual se definen sus atributos y un arreglo List que almacena varios objetos de tipo productos.

class Productos {
  String idP;
  String descripcion;
 
  Productos({this.idP, this.descripcion});
 
  static List<Productos> getUsers() {
    return <Productos>[
      Productos(idP: "R3459", descripcion: "TV FULL HD 41"),
      Productos(idP: "R7995", descripcion: "IMPRESORA LASER A COLOR"),
      Productos(idP: "R4377", descripcion: "ESCRITORIO EJECUTIVO"),
      Productos(idP: "R5111", descripcion: "LAMPARA 200v PANEL SOLAR"),      
    ];
  }
}
