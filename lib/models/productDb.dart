
class ProductDB {
  final String? id;
  final String? name;
  final String? serial;
  final String? date;
  final int? exptime;
  final String? exptype;
  final String? insurer;

  const ProductDB(this.id, this.name, this.serial, this.date, this.exptime, this.exptype, this.insurer);

  factory ProductDB.fromMap(Map map) {
    return ProductDB(map['id'], map['name'], map['serial'], map['date'], map['exptime'], map['exptype'], map['insurer']);
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'serial': serial,
      'date': date,
      'exptime': exptime,
      'exptype': exptype,
      'insurer': insurer,
    };
  }


}