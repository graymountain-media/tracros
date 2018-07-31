//
//  FoodDetailTableViewController.swift
//  Tracros
//
//  Created by Jake Gray on 7/30/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit

class FoodDetailTableViewController: UITableViewController {
    
    // MARK: - IB OUtlets
    @IBOutlet weak var ironLabel: UILabel!
    @IBOutlet weak var calciumLabel: UILabel!
    @IBOutlet weak var vitCLabel: UILabel!
    @IBOutlet weak var vitALabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var sugarsLabel: UILabel!
    @IBOutlet weak var fiberLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var potassiumLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var cholesterolLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    @IBOutlet weak var numberOfServingsButton: UIButton!
    @IBOutlet weak var servingSizeButton: UIButton!
    
    @IBOutlet weak var fatPercentageLabel: UILabel!
    @IBOutlet weak var carbsPercentageLabel: UILabel!
    @IBOutlet weak var proteinPercentageLabel: UILabel!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    // Mark: - Properties
    var foodItem: FoodItem?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
    }
    
    // MARK: - Methods
    
    private func setupViews(){
        guard let foodItem = foodItem else {return}
        foodNameLabel.text = foodItem.desc.name
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
                print("Error with nutrient value")
            }
        }
    }

}
