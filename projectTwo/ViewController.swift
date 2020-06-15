//
//  ViewController.swift
//  projectTwo
//
//  Created by AND Group on 6/5/20.
//  Copyright © 2020 AND Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]();
    var score = 0;
    var correctAnswer = Int.random(in: 0...2);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"];
        button1.layer.borderWidth = 1;
        button2.layer.borderWidth = 1;
        button3.layer.borderWidth = 1;
        
        button1.layer.borderColor = UIColor.lightGray.cgColor;
        button2.layer.borderColor = UIColor.lightGray.cgColor;
        button3.layer.borderColor = UIColor.lightGray.cgColor;
        
        askQuestion(action: nil);
        // Do any additional setup after loading the view.
    }
    func askQuestion(action: UIAlertAction!){
        countries.shuffle();
        title = countries[correctAnswer].uppercased();
        button1.setImage(UIImage(named: countries[0]), for: .normal);
        button2.setImage(UIImage(named: countries[1]), for: .normal);
        button3.setImage(UIImage(named: countries[2]), for: .normal);
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title = "";
        if sender.tag == correctAnswer {
            score += 1;
            title = "Correct";
        }
        else{
            title = "Wrong";
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert);
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion));
        present(ac, animated: true);
    }
    

}

