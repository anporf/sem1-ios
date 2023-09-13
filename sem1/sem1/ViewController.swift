//
//  ViewController.swift
//  sem1
//
//  Created by Anton Porfirev on 13.09.2023.
//

import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
      }
}

let eps = 1e-10

class ViewController: UIViewController {

    var float_val = 0.0;
    var old_val = 0.0;
    var operationType: String? = nil;
    override func viewDidLoad() {
        result.text = "0"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func DoubleStringDecorator(_ function: @escaping () -> Void) -> Void {
        if result.text! != "Error" {
            float_val = Double(result.text!)!
            function()
            if result.text! != "Error" {
                if abs(Double(Int(float_val + eps)) - float_val) < 2 * eps {
                    result.text = String(Int(float_val + eps))
                } else if abs(Double(Int(float_val - eps)) - float_val) < 2 * eps {
                    result.text = String(Int(float_val - eps))
                } else {
                    result.text = String(float_val)
                }
            }
        }
    }
    
    func OperationCommon(val: String){
        float_val = Double(result.text!)!
        old_val = float_val
        float_val = 0
        result.text = "0"
        operationType = val
    }

    func mySign() {
        float_val *= -1
    }
    
    func myGetProcent() {
        float_val /= 100
        print(float_val)
    }
    
    func myAdd() {
        var old_float = float_val
        float_val += old_val
        old_val = old_float
    }
    
    func mySub() {
        var old_float = float_val
        float_val = old_val - float_val
        old_val = old_float
    }
    
    func myMul() {
        var old_float = float_val
        float_val *= old_val
        old_val = old_float
    }
    
    func myDiv() {
        var old_float = float_val
        print(float_val)
        if abs(float_val) < eps {
            result.text = "Error"
            float_val = 0
            old_val = 0
        }
        else {
            float_val = old_val / float_val
            old_val = old_float
        }
    }
    
    func addNum(val: Int) {
        if result.text! == "0" || result.text == "Error" {
            result.text = String(val)
        } else {
            result.text = result.text! + String(val)
        }
    }
    
    @IBOutlet weak var result: UILabel!
    @IBAction func clear(_ sender: Any) {
        result.text = "0"
        float_val = 0
        old_val = 0
    }
    
    @IBAction func getPercent(_ sender: Any) {
        DoubleStringDecorator(myGetProcent)
    }
    
    @IBAction func sign(_ sender: Any) {
        DoubleStringDecorator(mySign)
    }
    
    @IBAction func zero(_ sender: Any) {
        addNum(val: 0)
    }
    
    
    @IBAction func one(_ sender: Any) {
        addNum(val: 1)
    }
    @IBAction func two(_ sender: Any) {
        addNum(val: 2)
    }
    @IBAction func three(_ sender: Any) {
        addNum(val: 3)
    }
    @IBAction func four(_ sender: Any) {
        addNum(val: 4)
    }
    @IBAction func five(_ sender: Any) {
        addNum(val: 5)
    }
    @IBAction func six(_ sender: Any) {
        addNum(val: 6)
    }
    @IBAction func seven(_ sender: Any) {
        addNum(val: 7)
    }
    @IBAction func eight(_ sender: Any) {
        addNum(val: 8)
    }
    @IBAction func nine(_ sender: Any) {
        addNum(val: 9)
    }
    
    @IBAction func point(_ sender: Any) {
        if !(result.text!.contains(".")) {
             result.text = result.text! + "."
        }
    }
    
    @IBAction func div(_ sender: Any) {
        OperationCommon(val: "/")
    }
    
    
    @IBAction func mul(_ sender: Any) {
        OperationCommon(val: "*")
    }
    
    @IBAction func sub(_ sender: Any) {
        OperationCommon(val: "-")
    }
    @IBAction func add(_ sender: Any) {
        OperationCommon(val: "+")
    }
    
    @IBAction func eval(_ sender: Any) {
        switch operationType {
        case "+":
            DoubleStringDecorator(myAdd)
        case "-":
            DoubleStringDecorator(mySub)
        case "*":
            DoubleStringDecorator(myMul)
        case "/":
            DoubleStringDecorator(myDiv)
        default:
            break
        }
    }
}

