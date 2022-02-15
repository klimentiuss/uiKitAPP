//
//  ViewController.swift
//  uiKitAPP
//
//  Created by user on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "1"
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        slider.maximumTrackTintColor = .red
        slider.minimumTrackTintColor = .blue
        slider.thumbTintColor = .black
    
        datePicker.locale = Locale.current
        datePicker.locale = Locale(identifier: "ru_RU")
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0: mainLabel.text = "First"
        case 1: mainLabel.text = "Second"
        default: mainLabel.text = "Third"
    }
    
}
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else
        { showAlert(title: "Error", message: "Enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(title: "Attention", message: "Enter your name ")
            return
        }
        mainLabel.text = inputText
        textField.text = ""
    }
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
     
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
}

//MARK: - Private Methods

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    

}
