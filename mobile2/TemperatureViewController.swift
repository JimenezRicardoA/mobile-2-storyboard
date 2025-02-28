//
//  TemperatureViewController.swift
//  mobile2
//
//  Created by ITIT on 05/02/25.
//

import UIKit

class TemperatureViewController: UIViewController {
    @IBOutlet weak var txtCelcius: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgResult: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Temperature Converter"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculate( sender: Any) {
        var celcius = Double (txtCelcius.text ?? "0.0") ?? 0.0
        
        lblResult.text = "El Resultado es \(conveter(celciusParameter: celcius)) grados fahrenheit"
        
        let result = conveter(celciusParameter: celcius)
        
        if result <= 32.0 {
            imgResult.image = UIImage(named: "snowman")
        } else if result > 32.0 && result < 86.0 {
            imgResult.image = UIImage(named: "beach")
        } else {
            imgResult.image = UIImage(named : "sun")
        }
        
    }
    
    func conveter (celciusParameter : Double) -> Double {
        return ((celciusParameter * 9) / 5) + 32
    }
    
    @IBAction func reset(_ sender: Any) {
        txtCelcius.text = ""
        lblResult.text = ""
    }
}
