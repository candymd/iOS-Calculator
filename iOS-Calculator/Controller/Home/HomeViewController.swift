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
    
    // MARK - Variables
    private var total: Double = 0
    private var temp: Double = 0
    private var isOperating: Bool = false
    private var isDecimal: Bool = false
    private var operation: OperationType = .none
    
    // MARK - Constants
    private let decimalSeparator = Locale.current.decimalSeparator!
    private let maxLength = 9
    private let maxValue = 9999999999
    private let minValue = 0.00000001
    
    private enum OperationType {
        case addition
        case substraction
        case multiplication
        case division
        case percentage
        case none
    }
    
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.maximumIntegerDigits = 9
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
        return formatter
    }()
    
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
        
        periodButton.setTitle(decimalSeparator, for: .normal)
    }

    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
        sender.bounce()
    }
    
    @IBAction func operatorEqualsAction(_ sender: UIButton) {
        result()
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        
        isOperating = true
        operation = .addition

        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        
        isOperating = true
        operation = .substraction
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        result()
        isOperating = true
        operation = .multiplication
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        
        isOperating = true
        operation = .division
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func operatorPercentageAction(_ sender: UIButton) {
        if operation != .percentage {
            result()
        }
        
        isOperating = true
        operation = .percentage

        result()
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func allClearButtonAction(_ sender: UIButton) {
        clear()
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        clear()
        
        sender.shine()
        sender.bounce()
    }
    
    
    @IBAction func periodButtonAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !isOperating && currentTemp.count >= maxLength {
            return
        }
        
        resultLabel.text?.append(decimalSeparator)
        isDecimal = true
        
        sender.shine()
        sender.bounce()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        allClearButton.setTitle("C", for: .normal)
        
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !isOperating && currentTemp.count >= maxLength {
            return
        }
        
        if isOperating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            isOperating = false
        }
        
        if isDecimal {
            currentTemp = "\(currentTemp)\(decimalSeparator)"
            isDecimal = false
        }
        
        let number = sender.tag
        let concatenated = currentTemp + String(number)
        if let parsed = auxFormatter.number(from: concatenated)?.doubleValue {
            temp = parsed
            resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        } else {
            return
        }

        sender.shine()
        sender.bounce()
    }
    
    private func clear() {
        operation = .none
        allClearButton.setTitle("AC", for: .normal)
        
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    private func result() {
        switch operation {
        case .none:
            break
        case .addition:
            total += temp
        case .substraction:
            total -= temp
        case .multiplication:
            total *= temp
        case .division:
            total /= temp
        case .percentage:
            total *= 0.01
        }
        
        if Int(total) >= maxValue || total >= minValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print("total: \(total)")
    }
}

