class Burc{
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcOzellikleri;
  final String _burcKucukResim;
  final String _burcBuyukResim;
  get burcAdi => _burcAdi;
  get burcTarihi =>_burcTarihi;
  get burcOzellikleri => _burcOzellikleri;
  get burcKucukResim => _burcKucukResim;
  get burcBuyukResim => _burcBuyukResim;

  Burc(this._burcAdi, this._burcTarihi, this._burcOzellikleri, this._burcKucukResim, this._burcBuyukResim);
  @override
  String toString() {
    return '$_burcAdi - $_burcBuyukResim';
  }
}