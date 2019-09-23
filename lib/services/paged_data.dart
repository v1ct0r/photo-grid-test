class PagedData<T> {
  List<T> items;
  int totalCount;
  int perPage;

  PagedData(this.items, this.totalCount, this.perPage);
}