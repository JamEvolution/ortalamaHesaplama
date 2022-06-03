class Ders {
  final String ad;
  final double harfDegeri;
  final double krediDeger;

  Ders({required this.ad, required this.harfDegeri, required this.krediDeger});

  @override
  String toString() {
    return '$ad , $harfDegeri , $krediDeger';
  }
}
