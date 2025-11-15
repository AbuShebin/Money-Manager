class Constands {
  String _currency = "\$";

  void updateCurrency({required CurrencyType currencyType}) {
    _currency = currencyType == CurrencyType.rupees
        ? "₹"
        : currencyType == CurrencyType.dollar
            ? "\$"
            : "€";
  }

  String get currency{
    return _currency;
  }
}

enum CurrencyType { rupees, dollar, euro }
