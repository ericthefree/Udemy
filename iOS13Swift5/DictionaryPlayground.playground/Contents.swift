
//Don't change this
var studentsAndScores = ["Amy": 86, "James": 91, "Helen": 89]

func highestScore(scores: [String: Int]) {
  
  //Write your code here.

    var highScore = 0
    for (_, value) in studentsAndScores {
        if (value > highScore) {
            highScore = value
        }

  }
  print(highScore)
  
}

//Don't change this
highestScore(scores: studentsAndScores)
