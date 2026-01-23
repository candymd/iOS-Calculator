//
//  HomeViewController.swift
//  iOS Calculator
//
//  Created by Candy 💗 on 15/1/26.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberZero: UILabel!
    @IBOutlet weak var numberOne: UIButton!
    @IBOutlet weak var numberTwo: UIButton!
    @IBOutlet weak var numberThree: UIButton!
    @IBOutlet weak var numberFour: UIButton!
    @IBOutlet weak var numberFive: UIButton!
    @IBOutlet weak var numberSix: UIButton!
    @IBOutlet weak var numberSeven: UIButton!
    @IBOutlet weak var numberEight: UIButton!
    @IBOutlet weak var numberNine: UIButton!
    
    @IBOutlet weak var periodButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    
    @IBOutlet weak var operatorPercentage: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorEquals: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    
    // MARK - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Life Cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func operatorPlusMinusAction(_ sender: Any) {
    }
    
    @IBAction func operatorEqualsAction(_ sender: Any) {
    }
    
    
    @IBAction func operatorAdditionAction(_ sender: Any) {
    }
    
    
    @IBAction func operatorSubstractionAction(_ sender: Any) {
    }
    
    
    @IBAction func operatorMultiplicationAction(_ sender: Any) {
    }
    
    
    @IBAction func operatorDivisionAction(_ sender: Any) {
    }
    
    
    @IBAction func operatorPercentageAction(_ sender: Any) {
    }
    
    
    @IBAction func allClearButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func deleteButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func periodButtonAction(_ sender: Any) {
    }
}
