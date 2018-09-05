//
//  SearchDetailTableViewController.swift
//  Tracros
//
//  Created by Jake Gray on 7/30/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit

class SearchDetailTableViewController: UITableViewController {
    
    // MARK: - IB OUtlets
    @IBOutlet weak var ironLabel: UILabel!
    @IBOutlet weak var calciumLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var sugarsLabel: UILabel!
    @IBOutlet weak var fiberLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var potassiumLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var cholesterolLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    
    @IBOutlet weak var servingSizeTextField: UITextField!
    @IBOutlet weak var numberOfServingsTextField: UITextField!
    
    @IBOutlet weak var fatPercentageLabel: UILabel!
    @IBOutlet weak var carbsPercentageLabel: UILabel!
    @IBOutlet weak var proteinPercentageLabel: UILabel!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    // Mark: - Properties
    var foodItem: SearchFoodItem?
    var numberOfServings = 1.0
    let servingFractions = ["","1/8", "1/4", "3/8", "1/2", "5/8", "3/4", "7/8"]
    
    let servingSizePicker = UIPickerView()
    let numberOfServingsPicker = UIPickerView()
    let pickerToolbar = UIToolbar()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false
        
        //FIXME Temporary disable
        servingSizeTextField.isUserInteractionEnabled = false
        
        numberOfServingsPicker.delegate = self
        numberOfServingsPicker.dataSource = self
        
        servingSizePicker.delegate = self
        servingSizePicker.dataSource = self
        
        setupViews()
        
    }
    
    // MARK: - Methods
    
    private func setupViews(){
        setupPickerToolbar()
        guard let foodItem = foodItem else {return}
        foodNameLabel.text = foodItem.desc.name
        
        servingSizeTextField.text = "100g"
        servingSizeTextField.inputView = servingSizePicker
        servingSizeTextField.tintColor = .clear
        servingSizeTextField.inputAccessoryView = pickerToolbar
        
        numberOfServingsTextField.text = "1"
        numberOfServingsTextField.inputView = numberOfServingsPicker
        numberOfServingsTextField.tintColor = .clear
        numberOfServingsTextField.inputAccessoryView = pickerToolbar
        
        for nutrient in foodItem.nutrients {
            switch nutrient.name{
            case "Total lipid (fat)":
                fatLabel.text = nutrient.value
            case "Cholesterol":
                cholesterolLabel.text = nutrient.value
            case "Sodium, Na":
                sodiumLabel.text = nutrient.value
            case "Potassium, K":
                potassiumLabel.text = nutrient.value
            case "Carbohydrate, by difference":
                carbsLabel.text = nutrient.value
            case "Fiber, total dietary":
                fiberLabel.text = nutrient.value
            case "Sugars, total":
                sugarsLabel.text = nutrient.value
            case "Protein":
                proteinLabel.text = nutrient.value
            case "Calcium, Ca":
                calciumLabel.text = nutrient.value
            case "Iron, Fe":
                ironLabel.text = nutrient.value
            default:
                print("Nutrient not needed")
            }
        }
    }
    
    private func setupPickerToolbar() {
        pickerToolbar.sizeToFit()
        pickerToolbar.barTintColor = UIColor(named: "main")
        pickerToolbar.isTranslucent = false
        pickerToolbar.tintColor = .white
        
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(pickerCancelButtonPressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerDoneButtonPressed))
        
        pickerToolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: true)
    }
    
    private func updateLabels() {
        guard let foodItem = foodItem else {return}
        
        for nutrient in foodItem.nutrients {
        
            let value = "\(Double(nutrient.value)! * numberOfServings)"
            switch nutrient.name{
            case "Total lipid (fat)":
                fatLabel.text = value
            case "Cholesterol":
                cholesterolLabel.text = value
            case "Sodium, Na":
                sodiumLabel.text = value
            case "Potassium, K":
                potassiumLabel.text = value
            case "Carbohydrate, by difference":
                carbsLabel.text = value
            case "Fiber, total dietary":
                fiberLabel.text = value
            case "Sugars, total":
                sugarsLabel.text = value
            case "Protein":
                proteinLabel.text = value
            case "Calcium, Ca":
                calciumLabel.text = value
            case "Iron, Fe":
                ironLabel.text = value
            default:
                print("Nutrient not needed")            }
        }
    }
    
    // MARK: - Button Actions
    
    @objc private func pickerCancelButtonPressed() {
        view.endEditing(true)
    }
    
    @objc private func pickerDoneButtonPressed() {
        let wholeNumber = numberOfServingsPicker.selectedRow(inComponent: 0) + 1
        let fraction = numberOfServingsPicker.selectedRow(inComponent: 1)
        
        print(wholeNumber)
        print(fraction)
        
        numberOfServingsTextField.text = "\(wholeNumber) \(servingFractions[fraction])"
        
        numberOfServings = Double(wholeNumber) + (Double(fraction) * 0.125)
        
        updateLabels()
        
        view.endEditing(true)
    }

}

extension SearchDetailTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 10
        case 1:
            return 8
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(row + 1)
        case 1:
            return servingFractions[row]
        default:
            return "Servings"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0,1:
            return view.frame.width / 4
        default:
            return view.frame.width / 2
        }
    }
}
