//
//  endViewController.swift
//  Q&A
//
//  Created by fun on 2020/8/3.
//

import UIKit


class endViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setScore()

        // Do any additional setup after loading the view.
    }
    
    var FinalScore : Int = 0

    @IBOutlet weak var scoreLabel: UILabel!
    
    func setScore(){
        scoreLabel.text = String(FinalScore)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
