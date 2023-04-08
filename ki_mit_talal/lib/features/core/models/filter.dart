class Filter {
  final String? query;
  String? cuisine;
  String? diet;
  String? intolerances;
  String? equipment;
  String? type;
  String? mealType;
  int? recipeBoxId;
  int? maxReadyTime;
  int? minCarbs;
  int? maxCarbs;
  int? minProtein;
  int? maxProtein;
  int? minCalories;
  int? maxCalories;
  int? minFat;
  int? maxFat;
  int? offset;
  int? number;

  Filter.onlyQuery({required this.query});

  Filter(
      {required this.query,
      this.cuisine = ' ',
      this.diet = '',
      this.intolerances,
      this.equipment,
      this.type,
      this.recipeBoxId,
      this.maxReadyTime,
      this.minCarbs,
      this.maxCarbs,
      this.minProtein,
      this.maxProtein,
      this.minCalories,
      this.maxCalories,
      this.mealType,
      this.minFat,
      this.maxFat,
      this.offset,
      this.number});

  @override
  String toString() {
    final buffer = StringBuffer();

    if (query?.isNotEmpty == true) buffer.write('&query=$query');
    if (cuisine != ' ') buffer.write('&cuisine=$cuisine');
    if (diet?.isNotEmpty == true) buffer.write('&diet=$diet');
    if (intolerances != null) buffer.write('&intolerances=$intolerances');
    if (equipment != null) buffer.write('&equipment=$equipment');
    if (type != null) buffer.write('&type=$type');
    if (recipeBoxId != null) buffer.write('&recipeBoxId=$recipeBoxId');
    if (maxReadyTime != null) buffer.write('&maxReadyTime=$maxReadyTime');
    if (minCarbs != null) buffer.write('&minCarbs=$minCarbs');
    if (maxCarbs != null) buffer.write('&maxCarbs=$maxCarbs');
    if (minProtein != null) buffer.write('&minProtein=$minProtein');
    if (maxProtein != null) buffer.write('&maxProtein=$maxProtein');
    if (minCalories != null) buffer.write('&minCalories=$minCalories');
    if (maxCalories != null) buffer.write('&maxCalories=$maxCalories');
    if (mealType != null) buffer.write('&type=$mealType');
    if (minFat != null) buffer.write('&minFat=$minFat');
    if (maxFat != null) buffer.write('&maxFat=$maxFat');
    if (offset != null) {
      buffer.write('&offset=$offset');
    }
    if (number != null) {
      buffer.write('&number=$number');
    }

    return buffer.toString();
  }
}
