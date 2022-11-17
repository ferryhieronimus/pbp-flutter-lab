class Budget {
  String judul;
  int nominal;
  String jenisBudget;

  Budget(
      {required this.judul, required this.nominal, required this.jenisBudget});
}

class ListBudget {
  static List<Budget> listBudget = [];
}

