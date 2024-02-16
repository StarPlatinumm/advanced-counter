//
//  ViewController.swift
//  advanced-counter
//
//  Created by Артем Кривдин on 16.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var labelValue: Int = 0
    var logText: String = "История изменений:"
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    }

    @IBAction func minusDidPress() {
        if labelValue == 0 {
            logText += "\n[\(getDate())]: попытка уменьшить значение счётчика ниже 0"
        } else {
            labelValue -= 1
            logText += "\n[\(getDate())]: значение изменено на -1"
        }
        updateLogAndLabel()
    }
    
    @IBAction func plusDidPress() {
        labelValue += 1
        logText += "\n[\(getDate())]: значение изменено на +1"
        updateLogAndLabel()
    }
    
    @IBAction func resetDidPress() {
        labelValue = 0
        logText += "\n[\(getDate())]: значение сброшено"
        updateLogAndLabel()
    }
    
    // вспомогательные функции
    
    func updateLogAndLabel() {
        counterLabel.text = String(labelValue)
        logTextView.text = logText
    }
    
    func getDate() -> String {
        return dateFormatter.string(from: Date())
    }

}
