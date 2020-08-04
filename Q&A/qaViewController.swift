//
//  qaViewController.swift
//  Q&A
//
//  Created by fun on 2020/8/3.
//

import UIKit

class qaViewController: UIViewController {
    
    var index = 0
    var rightAnswer = ""
    var SelectedAnswer : String = ""
    var NumbersOfCorrect : Int = 0
    
    var NumbersOfCurrentQandA : Int = 0
    
    
    var questionsInfoemation = [Qnas(question: "最聰明的恐龍？", option:  ["傷齒龍","暴龍","翼手龍"], answer: "傷齒龍"),Qnas(question: "最笨的恐龍？", option: ["傷齒龍","暴龍","劍龍"], answer: "劍龍"),Qnas(question: "最兇猛的恐龍是？", option: ["傷齒龍","暴龍","翼手龍"], answer: "暴龍"),Qnas(question: "最高的恐龍是？", option:  ["傷齒龍","劍龍","波塞東龍"], answer: "波塞東龍"),Qnas(question: "最大的恐龍是？", option: ["阿根廷龍","暴龍","翼手龍"], answer: "阿根廷龍"),Qnas(question: "第一個發現會挖洞的恐龍？", option:  ["傷齒龍","奔掘龍","翼手龍"], answer: "奔掘龍"),Qnas(question: "第一個發現有毒牙的恐龍？", option: ["中國鳥龍","暴龍","翼手龍"], answer: "中國鳥龍"),Qnas(question: "會照顧寶寶的龍？", option: ["傷齒龍","暴龍","慈母龍"], answer: "慈母龍"),Qnas(question: "最小的恐龍？", option: ["傷齒龍","暴龍","細顎龍"], answer: "細顎龍"),Qnas(question: "食量最大的草食恐龍？", option: ["慈母龍","腕龍","細顎龍"], answer: "腕龍"),Qnas(question: "最重的恐龍？", option: ["地震龍","暴龍","細顎龍"], answer: "地震龍")]
    

    @IBOutlet weak var QLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet var optionButton: [UIButton]!
    
    @IBOutlet weak var OptionAOutlet: UIButton!
    
    @IBOutlet weak var OptionBOutlet: UIButton!
    @IBOutlet weak var OptionCOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsInfoemation.shuffle()
        playGame()
        
    }
    
    
    func playGame(){
        QLabel.text = questionsInfoemation[index].question
        rightAnswer = questionsInfoemation[index].answer
        questionsInfoemation[index].option.shuffle()
  for i in 0...2{
             optionButton[i].setTitle(questionsInfoemation[index].option[i], for: UIControl.State.normal)
        }
}
    
    
    @IBAction func optionPressBtn(_ sender: UIButton) {
        index = index+1
        if sender.currentTitle == rightAnswer{
            doItRight()
        }else{
            doItWrong()
        }
    }
    
    func doItRight(){
        let controller = UIAlertController(title: "正確", message: "厲害喔！", preferredStyle: .alert)
        if NumbersOfCurrentQandA == 9{
            let action = UIAlertAction(title: "完成！", style: .cancel, handler: nextPage)
            controller.addAction(action)
        }else{
            let action = UIAlertAction(title: "繼續", style: .cancel, handler: reloadPage)
            controller.addAction(action)
        }
        
        present(controller, animated: true)
        NumbersOfCorrect += 1
    }
    
    func doItWrong(){
        let controller = UIAlertController(title: "錯誤", message: "ＱＱ", preferredStyle: .alert)
        if NumbersOfCurrentQandA == 9{
            let action = UIAlertAction(title: "完成！", style: .cancel, handler: nextPage)
            controller.addAction(action)
        }else{
            let action = UIAlertAction(title: "繼續", style: .cancel, handler: reloadPage)
            controller.addAction(action)
        }
        
        present(controller, animated: true)
        
    }
    
    func reloadPage (alert: UIAlertAction!){
        NumbersOfCurrentQandA += 1
        playGame()
        countLabel.text = String(NumbersOfCurrentQandA+1)

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EndQuiz"{
            if let controller = segue.destination as? endViewController{
                controller.FinalScore = NumbersOfCorrect * 10
            }
        }
    }
    
    func nextPage(alert: UIAlertAction!){
        performSegue(withIdentifier: "EndQuiz", sender: UIAlertAction.self)
        
    }
    

}
