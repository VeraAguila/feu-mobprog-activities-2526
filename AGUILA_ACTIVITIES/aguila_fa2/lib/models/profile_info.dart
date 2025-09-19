class ProfileInfo {
  const ProfileInfo(this.infoQuestion, this.infoChoices, this.infoCorrectAnswer);

  final String infoQuestion; 
  final List<String> infoChoices;
  final String infoCorrectAnswer;

  List<String> getShuffledList(){
    final List<String> shuffledList = List.of(infoChoices);
    shuffledList.shuffle();
    
    return shuffledList;
  }
}