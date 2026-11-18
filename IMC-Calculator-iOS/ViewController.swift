//
//  ViewController.swift
//  IMC-Calculator-iOS
//
//  Created by Turno Mananas on 16/11/2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var height = 160.0
    var weight = 70.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightChanger(_ sender: UISlider) {
        height = Double(sender.value).rounded()
        heightLabel.text = "\(Int(height))"
    }
    
    @IBAction func weightChanger(_ sender: UIStepper) {
        weight = sender.value
        weightLabel.text = "\(Int(weight))"
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        let heightInMeters = height / 100
        let result = weight / (pow(heightInMeters, 2))
        resultLabel.text = String(format: "%.2f", result)
        
        
        switch result {
        case 0..<18.5:
            resultDescriptionLabel.text = String(localized: "low_weight",table: "Main")
            resultLabel.textColor = UIColor.bmiUnder
            resultDescriptionLabel.textColor = UIColor.bmiUnder
        case 18.5..<25.0:
            resultDescriptionLabel.text = String(localized: "normal_weight",table: "Main")
            resultLabel.textColor = UIColor.bmiNormal
            resultDescriptionLabel.textColor = UIColor.bmiNormal
        case 25.0..<30.0:
            resultDescriptionLabel.text = String(localized: "over_weight",table: "Main")
            resultLabel.textColor = UIColor.bmiOver
            resultDescriptionLabel.textColor = UIColor.bmiOver
        case 30.0..<35.0:
            resultDescriptionLabel.text = String(localized: "obesity_weight",table: "Main")
            resultLabel.textColor = UIColor.bmiObesity
            resultDescriptionLabel.textColor = UIColor.bmiObesity
        default:
            resultDescriptionLabel.text = String(localized: "extreme_obesity",table: "Main")
            resultLabel.textColor = UIColor.bmiExtremeObesity
            resultDescriptionLabel.textColor = UIColor.bmiExtremeObesity
        }
    }
}

