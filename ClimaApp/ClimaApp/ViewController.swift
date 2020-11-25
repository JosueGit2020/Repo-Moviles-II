//
//  ViewController.swift
//  Clima
//
//  Created by Mac6 on 23/11/20.
//  Copyright © 2020 Mac6. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate{
    func actualizarClima(clima: ClimaModelo) {
        temperaturaLabel.text = String(clima.temperaturaDecimal)
        climaImageView.image = UIImage(named: String(clima.condicionClima))
        descripcionLabel.text = "¡"+String(clima.descripcionClima)+"!"
    }
    

    var climaManager = ClimaManager()
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var climaImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        climaManager.delegado = self
        buscarTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ciudadLabel.text = buscarTextField.text
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            buscarTextField.placeholder = "Escribe una ciudad."
            return false
        }
    }
    @IBAction func BuscarButton(_ sender: UIButton) {
        ciudadLabel.text = buscarTextField.text
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
    }
    
}

