//
//  SumViewController.swift
//  mobile2
//
//  Created by ITIT on 11/02/25.
//

import UIKit

class SumViewController: UIViewController {
    
    @IBOutlet weak var txtFirsNumber: UITextField!
    @IBOutlet weak var txtSecondNumber: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action:
                                            #selector(dissmisKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @objc func dissmisKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func sumar (sender: Any){
        
        if let firstnumber = txtFirsNumber.text, !firstnumber.isEmpty,
           let secondNumber = txtSecondNumber.text, !secondNumber.isEmpty{
            
            let suma = sum(firstNumber: Int (firstnumber) ?? 0, secondNumber: Int (secondNumber) ?? 0)
            
            
            let alert = UIAlertController(title: "sum",
                                          message: "The sum is: \(suma) ",
                                          preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Close",
                                       style: UIAlertAction.Style.default) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            txtFirsNumber.text = ""
            txtSecondNumber.text = ""
            print ("Wgy are you shaking me")
        }
    }
    
    func sum (firstNumber : Int, secondNumber : Int) -> Int{
        return firstNumber + secondNumber
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
