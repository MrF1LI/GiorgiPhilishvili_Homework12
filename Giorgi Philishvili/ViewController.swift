//
//  ViewController.swift
//  Giorgi Philishvili
//
//  Created by GIORGI PILISSHVILI on 30.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables

    @IBOutlet weak var numberOne: UILabel!
    @IBOutlet weak var numberTwo: UILabel!
    @IBOutlet weak var numberThree: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var result: UILabel!
    
    var maxOfRange = 100
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.alpha = 0
        initNumbers()
    }
    
    // MARK: - Functions

    @IBAction func changeRange(_ sender: UISlider) {
        maxOfRange = Int(sender.value)
        initNumbers()
        result.text = ""
    }
    
    @IBAction func getResult(_ sender: UIButton) {
        
        let value = valueTextField.text?.lowercased()
        let numbers = [
            Int(numberOne.text!)!,
            Int(numberTwo.text!)!,
            Int(numberThree.text!)!
        ]
        
        switch value {
        case "maximum":
            result.text = "Max: \(numbers.max() ?? numbers[0])"
        case "average":
            result.text = "Average: " + String(format: "%.1f", Double(numbers.reduce(0, +)) / 3)
        case "sum":
            result.text = "Sum: \(numbers.reduce(0, +))"
        default:
            result.text = "Enter - 'maximum', 'average' or 'sum'"
        }
        
        result.alpha = 1
        valueTextField.text = ""
        
    }
    
    func initNumbers() {
        numberOne.text = String(Int.random(in: 1...maxOfRange))
        numberTwo.text = String(Int.random(in: 1...maxOfRange))
        numberThree.text = String(Int.random(in: 1...maxOfRange))
    }
    
}
