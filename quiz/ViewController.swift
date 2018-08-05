//
//  ViewController.swift
//  quiz
//
//  Created by Onoue tatsuki on 2018/08/05.
//  Copyright © 2018年 Onoue tatsuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var questionLabel: UILabel!
    
    var correctNum:Int = 0
    
    var currentQuestionNum:Int = 0
    
    let questions:[[String:Any]] = [
    [
        "q":"iPhoneアプリを開発する統合環境はZcodeである",
        "a":false
        ],
    ["q":"Xcode画面の右端にはユーティリティーズがある",
     "a":true
        ],
    ["q":"UILabelは文字列を表示する際に利用する",
     "a":true
        ]
        
    ]
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    func showQuestion()  {
        let question = questions[currentQuestionNum]
        //optional binding
        if let questionText = question["q"] as? String{
            questionLabel.text = questionText
        }
    }
    
    func checkAnswer(yourAnswer: Bool)  {
        let question = questions[currentQuestionNum]
        if let ans = question["a"] as? Bool {
            if yourAnswer == ans {
                //正解
                correctNum += 1
                showAlert(message: "正解です🎉")
            }else{
                showAlert(message: "不正解です😁")
            }
                            currentQuestionNum += 1
        }
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
            
        }
        showQuestion()
    }
    func showAlert(message:String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "次へ", style: .cancel, handler: nil)
        alert.addAction(closeAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
