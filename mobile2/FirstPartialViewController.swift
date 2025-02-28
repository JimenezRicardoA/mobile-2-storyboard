//
//  FirstPartialViewController.swift
//  mobile2
//
//  Created by ITIT on 25/02/25.
//

import UIKit

class FirstPartialViewController: UIViewController {
    
    @IBOutlet weak var txtkilograms: UITextField!
    @IBOutlet weak var txtmeters: UITextField!
    @IBOutlet weak var lblresult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First Partial Exam"
    }
    
    
    @IBAction func Calculate( sender: Any ) {
        var weightInKg = Double ( txtkilograms.text ?? "0.0" ) ?? 0.0
        var meters = Double ( txtmeters.text ?? "0.0" ) ?? 0.0
        var patientStatus = ""
        
        let result = weightInKg / pow (meters, 2)
        
        if (result >= 19 && result <= 24.9){
            patientStatus = "The patient is at a healthy weight."

            
        } else {
            patientStatus = "The patient is NOT at a healthy weight."

        }
        
        let alert = UIAlertController(title: "BMI",
                                      message: patientStatus,
                                      preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Close",
                                   style: UIAlertAction.Style.default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) { if motion == .motionShake { 
        txtkilograms.text = ""
        txtmeters.text = ""
    } }
    
    @objc func dissmisKeyboard(){
        view.endEditing(true)
    }
    
    
}
