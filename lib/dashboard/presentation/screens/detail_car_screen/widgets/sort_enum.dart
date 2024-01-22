enum SortMethods {
  byNameAscending,
  byNameDescending,
  byPriceAscending,
  byPriceDescending,
}

String sortMessage(SortMethods method) {
  switch (method) {
    case SortMethods.byNameAscending:
      return 'Sorted by name descending';
    case SortMethods.byNameDescending:
      return 'Sorted by price ascending';
    case SortMethods.byPriceAscending:
      return 'Sorted by price descending';
    case SortMethods.byPriceDescending:
      return 'Sorted by price ascending';
  }
}
