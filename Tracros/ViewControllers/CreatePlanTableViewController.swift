//
//  CreatePlanTableViewController.swift
//  Tracros
//
//  Created by Jake Gray on 9/5/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit

class CreatePlanTableViewController: UITableViewController {

    //MARK: Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    
    //MARK: Properties
    let planTypePicker = UIPickerView()
    let durationPicker = UIPickerView()
    let planTypePickerToolbar = UIToolbar()
    let durationPickerToolbar = UIToolbar()
    
    var duration: Int = 7
    var planType: PlanType = .FatLoss
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        
        planTypePicker.delegate = self
        planTypePicker.dataSource = self
        
        durationPicker.delegate = self
        durationPicker.dataSource = self
        
        setupViews()
    }
    @IBAction func typeTextFieldTapped(_ sender: Any) {
        print("you touched me")
    }
    
    //MARK: Methods
    
    private func setupViews() {
        setupPickerToolbars()
        
        typeTextField.inputView = planTypePicker
        typeTextField.tintColor = .clear
        typeTextField.inputAccessoryView = planTypePickerToolbar
        
        durationTextField.inputView = durationPicker
        durationTextField.tintColor = .clear
        durationTextField.inputAccessoryView = durationPickerToolbar
    }
    
    private func setupPickerToolbars() {
        print("Setup toolbar")
        let toolbars = [durationPickerToolbar, planTypePickerToolbar]
        for toolbar in toolbars {
            
            toolbar.sizeToFit()
            toolbar.barTintColor = UIColor(named: "main")
            toolbar.isTranslucent = false
            toolbar.tintColor = .white
            
            
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(pickerCancelButtonPressed))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            var doneButton = UIBarButtonItem()
            if toolbar == durationPickerToolbar {
                doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(durationPickerDoneButtonPressed))
            } else {
                doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(planTypePickerDoneButtonPressed))
            }
            
            
            toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: true)
        }
        
    }

    //MARK: Button Actions
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, title != "" else {
            let alert = UIAlertController(title: "No Title", message: "Please enter a title for your new meal plan.", preferredStyle: .alert)
            
            let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
            return
        }
        PlanController.createPlan(withName: title, type: planType, duration: duration)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Picker Methods
    
    @objc private func planTypePickerDoneButtonPressed() {
        let row = planTypePicker.selectedRow(inComponent: 0)
        
        switch row {
        case 0:
            planType = .FatLoss
        case 1:
            planType = .MuscleGain
        case 2:
            planType = .Recomposition
        default:
            planType = .FatLoss
        }
        
        typeTextField.text = planType.rawValue
        view.endEditing(true)
    }
    
    @objc private func durationPickerDoneButtonPressed() {
        let row = planTypePicker.selectedRow(inComponent: 0)
        
        switch row {
        case 0:
            duration = 7
        case 1:
            duration = 14
        default:
            duration = 7
        }
        
        durationTextField.text = "\(duration) Days"
        view.endEditing(true)
    }
    
    @objc private func pickerCancelButtonPressed() {
        view.endEditing(true)
    }
    
}

extension CreatePlanTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case planTypePicker:
            return 3
        case durationPicker:
            return 2
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case planTypePicker:
            switch row{
            case 0:
                return "Fat Loss"
            case 1:
                return "Muscle Gain"
            case 2:
                return "Recomposition"
            default:
                return "Error"
            }
        case durationPicker:
            switch row{
            case 0:
                return "7 Days"
            case 1:
                return "14 Days"
            default:
                return "Error"
            }
        default:
            return "Error"
        }
    }
    
    
}

extension CreatePlanTableViewController: UITextFieldDelegate {
    
}
