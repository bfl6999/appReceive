
class Opiniones{
  String id;
  final int opinion;
  final String ropa;
  final String actividad;

  Opiniones({
    this.id = '',
   required this.opinion,
   required this.ropa,
   required this.actividad,
});

  Map<String, dynamic> toJson() => {
    'id' :id,
    'opionion' : opinion,
    'ropa' : ropa,
    'actividad' : actividad,
  };

}