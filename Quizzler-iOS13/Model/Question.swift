

import Foundation


struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.options = a
        self.correctAnswer = correctAnswer
    }
}
