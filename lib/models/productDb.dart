
class ProductDB {
  final String? id;
  final String? name;
  final String? serial;
  final String? date;
  final int? expTime;
  final String? expType;
  final String? insurer;

  const ProductDB(this.id, this.name, this.serial, this.date, this.expTime, this.expType, this.insurer);

  factory ProductDB.fromMap(Map map) {
    return ProductDB(map['id'], map['name'], map['serial'], map['date'], map['expTime'], map['expType'], map['insurer']);
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'serial': serial,
      'date': date,
      'exptime': expTime,
      'exptype': expType,
      'insurer': insurer,
    };
  }


}