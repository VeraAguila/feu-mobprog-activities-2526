class ProfileCategory {
  const ProfileCategory(this.categoryDescription, this.categoryChoices);

  final String categoryDescription; 
  final List<String> categoryChoices;

  List<String> getShuffledList(){
    final List<String> shuffledList = List.of(categoryChoices);
    shuffledList.shuffle();
    
    return shuffledList;
  }
}