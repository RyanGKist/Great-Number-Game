//
//  MainVC.swift
//  Great Number Game
//
//  Created by Ryan Kistner on 1/10/18.
//  Copyright © 2018 Ryan Kistner. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var usersGuess: UITextField!
    
    var machinesGuess = Int(arc4random_uniform(101)+1)
    var attempts : Int = 0
    var machinesScore : Int = 0
    var usersScore : Int = 0
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    override func view

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(MainVC.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func submitGuess(_ sender: UIButton) {
        if (attempts == 7){
            let alert = UIAlertController(title: "Nice Try!", message: "I have bested you!! Machines : \(machinesScore) | Users : \(usersScore)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again?", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            machinesGuess = Int(arc4random_uniform(101)+1)
            usersGuess.text = ""
            attempts = 0
        }else{
            if let guess = usersGuess.text{
                if (guess.count > 0){
                    let intGuess = Int(guess)!
                    //Is equal to Machines Guess
                    if(intGuess == machinesGuess){
                        let alert = UIAlertController(title: "Success!!!", message: "You guessed my guess correctly.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "replay", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        machinesGuess = Int(arc4random_uniform(101)+1)
                        usersScore += 1
                        usersGuess.text = ""
                    }
                    //Less than Machines Guess
                    else if(intGuess < machinesGuess){
                        let alert = UIAlertController(title: "Incorrect", message: "Your guess of \(guess) was to small, please try again!,  You have \(6-attempts) left!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "try again", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        usersGuess.text = ""
                        attempts += 1
                    }
                    //Greater than Machines Guess
                    else{
                        let alert = UIAlertController(title: "Incorrect", message: "Your guess of \(guess) was to large, please try again!,  You have \(6-attempts) left!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "try again", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        usersGuess.text = ""
                        attempts += 1
                    }
                }else{
                    let alert = UIAlertController(title: "Please add guess!", message: "You did not guess, are you afraid of the machines?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "retry", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    usersGuess.text = ""
                }
            }
        }
    }
}


