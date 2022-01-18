//
//  ViewController.swift
//  FirstCalc
//
//  Created by MacBook on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcExpression: UILabel!
    
    @IBOutlet weak var calcAnswer: UILabel!
    
    var curExp:String = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        clearAll()
    }
    
    
    func validInput() ->Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in curExp{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)//saving indexes of chars
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes{
            if(index == 0){// first element is speacial char
            
                return false
            }
            
            if(index == curExp.count - 1){//last element is special char
            
                return false
            }
            
            if (previous != -1){
                if(index - previous == 1){//2 consecutive special chars
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    
    func clearAll(){
        curExp = ""
        calcExpression.text = ""
        calcAnswer.text=""
    }
    
    
    func addToCurExp(value:String){
        curExp = curExp+value
        calcExpression.text=curExp
    }
    
    
    func specialCharacter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){//checking if number is interger
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    
    func showAnswer(){
        if(validInput()){
            let checkedWorkingsForPercent = curExp.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calcAnswer.text = resultString
        }
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func deleteAll(_ sender: Any) {
        clearAll()
    }
    
    
    @IBAction func deleteOne(_ sender: Any) {
        if(!curExp.isEmpty){
            curExp.removeLast()
            calcExpression.text = curExp
        }
    }
    
    @IBAction func percent(_ sender: Any) {
        addToCurExp(value:"%")
    }
    @IBAction func divide(_ sender: Any) {
        addToCurExp(value:"/")
    }
    @IBAction func product(_ sender: Any) {
        addToCurExp(value:"*")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToCurExp(value:"-")
    }
    @IBAction func plus(_ sender: Any) {
        addToCurExp(value:"+")
    }
    @IBAction func equal(_ sender: Any) {
        showAnswer()
    }
    @IBAction func nine(_ sender: Any) {
        addToCurExp(value:"9")
    }
    @IBAction func eight(_ sender: Any) {
        addToCurExp(value:"8")
    }
    @IBAction func seven(_ sender: Any) {
        addToCurExp(value:"7")
    }
    @IBAction func six(_ sender: Any) {
        addToCurExp(value:"6")

    }
    @IBAction func five(_ sender: Any) {
        addToCurExp(value:"5")
    }
    @IBAction func four(_ sender: Any) {
        addToCurExp(value:"4")
    }
    @IBAction func three(_ sender: Any) {
        addToCurExp(value:"3")
    }
    @IBAction func two(_ sender: Any) {
        addToCurExp(value:"2")
    }
    @IBAction func one(_ sender: Any) {
        addToCurExp(value:"1")
    }
    @IBAction func dot(_ sender: Any) {
        addToCurExp(value:".")

    }
    @IBAction func zero(_ sender: Any) {
        addToCurExp(value:"0")

    }
}

