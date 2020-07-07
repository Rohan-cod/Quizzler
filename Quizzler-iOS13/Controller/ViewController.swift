
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    

    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        progressBar.progress = 0.0
        
        updateQuestion()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector:#selector(updateQuestion), userInfo:nil, repeats: false)
    }
    
    @objc func updateQuestion() {
        questionLabel.text = quizBrain.getQuestionText()
        choice1.setTitle(quizBrain.getChoice1(), for: .normal)
        choice1.titleLabel?.textAlignment = .center
        choice2.setTitle(quizBrain.getChoice2(), for: .normal)
        choice2.titleLabel?.textAlignment = .center
        choice3.setTitle(quizBrain.getChoice3(), for: .normal)
        choice3.titleLabel?.textAlignment = .center
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "score: \(quizBrain.getScore())"
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
}

