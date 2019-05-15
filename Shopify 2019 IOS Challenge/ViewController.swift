//
//  ViewController.swift
//  Shopify 2019 IOS Challenge
//
//  Created by Alexandre Attar on 2019-05-02.
//  Copyright © 2019 AADevelopment. All rights reserved.
//

import UIKit

enum Difficulty {
    case Easy
    case Medium
    case Hard
    case Extreme
}

class ViewController: UIViewController {
    
    struct globalVariable {
        static var gridSize = Int()
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var gridSizeLabel: UILabel!
    @IBOutlet weak var gridSizeSlider: UISlider!
    @IBOutlet weak var difficultySegmentControl: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch difficultySegmentControl.selectedSegmentIndex {
        case 0:
            difficultySegmentControl.setSelectedAttribute(color: UIColor(red:0.40, green:0.74, blue:0.12, alpha:0.80))
            gridSizeSlider.value = 10
            globalVariable.gridSize = Int(gridSizeSlider.value)
            gridSizeLabel.text = "Grid Size: \(globalVariable.gridSize) X \(globalVariable.gridSize)"
        case 1:
            difficultySegmentControl.setSelectedAttribute(color: UIColor(red:0.92, green:0.80, blue:0.04, alpha:0.80))
            gridSizeSlider.value = 12
            globalVariable.gridSize = Int(gridSizeSlider.value)
            gridSizeLabel.text = "Grid Size: \(globalVariable.gridSize) X \(globalVariable.gridSize)"
        case 2:
            difficultySegmentControl.setSelectedAttribute(color: UIColor(red:1.00, green:0.61, blue:0.14, alpha:0.80))
            gridSizeSlider.value = 15
            globalVariable.gridSize = Int(gridSizeSlider.value)
            gridSizeLabel.text = "Grid Size: \(globalVariable.gridSize) X \(globalVariable.gridSize)"
        default:
            break;
        }
    }
    
    @IBAction func changeGridSize(_ sender: Any) {
        globalVariable.gridSize = Int(gridSizeSlider.value)
        gridSizeLabel.text = "Grid Size: \(globalVariable.gridSize) X \(globalVariable.gridSize)"
        if (globalVariable.gridSize < 12){
            difficultySegmentControl.selectedSegmentIndex = 0
            difficultySegmentControl.setSelectedAttribute(color: UIColor(red:0.40, green:0.74, blue:0.12, alpha:0.80))
        } else if (globalVariable.gridSize < 14) {
            difficultySegmentControl.selectedSegmentIndex = 1
            difficultySegmentControl.setSelectedAttribute(color: UIColor(red:0.92, green:0.80, blue:0.04, alpha:0.80))
        } else {
            difficultySegmentControl.selectedSegmentIndex = 2
            difficultySegmentControl.setSelectedAttribute(color: UIColor(red:1.00, green:0.61, blue:0.14, alpha:0.80))
        }
    }
    
    //For The main menu we want to prevent rotation
    //since on smaller screen current layout causes problem
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        globalVariable.gridSize = Int(gridSizeSlider.value)
        gridSizeLabel.text = "Grid Size: \(globalVariable.gridSize) X \(globalVariable.gridSize)"
        
        // Do any additional setup after loading the view.
        difficultySegmentControl.setInitialStyle()
    }

}


extension UISegmentedControl {
    func setInitialStyle(){
        self.backgroundColor = .clear
        self.tintColor = .clear
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        self.setSelectedAttribute(color: UIColor(red:0.40, green:0.74, blue:0.12, alpha:0.80))
    }
    
    func setSelectedAttribute(color: UIColor){
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color,
                                     NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)],
                                    for: .selected)
    }
}
