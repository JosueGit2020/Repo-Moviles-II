//
//  ViewController.swift
//  INFCovid-19
//
//  Created by Mac4 on 16/12/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CovidManagerDelegate {
    
    @IBOutlet weak var info: UILabel!
    
    func errorOcurrido(cualError: Error) {
        if cualError.localizedDescription == "The data couldn’t be read because it is missing."{
            DispatchQueue.main.async {
                //self.paisLabel.text = "No hay datos o"
                self.banderaImageView.image = UIImage(named: "error.png")
                
                
            }
  
        }
    }
    
    func actualizarInfo(covid: CovidModelo) {
        print(covid.bandera)
        DispatchQueue.main.async {
            let urlImagen:NSURL? = NSURL(string:covid.bandera)
            let data:NSData? = NSData(contentsOf : urlImagen! as URL)
            let image = UIImage(data : data! as Data)
            self.casosConfirmadosLabel.text = "Casos confirmados"
            self.muertesLabel.text = "Muertes"
            self.recuperadosLabel.text = "Recuperados"
            self.banderaImageView.image = image
            //self.paisLabel.text = covid.nombrePais
            self.casosNumeroLabel.text = covid.casosCadena
            self.numeroMuertesLabel.text = covid.muertesCadena
            self.numeroRecuperadosLabel.text = covid.recuperadosCadena
        }
    }
    
    var covidManager = CovidManager()
 
    @IBOutlet weak var barraBusquedaTextField: UITextField!
    @IBOutlet weak var banderaImageView: UIImageView!
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var casosConfirmadosLabel: UILabel!
    @IBOutlet weak var casosNumeroLabel: UILabel!
    @IBOutlet weak var muertesLabel: UILabel!
    @IBOutlet weak var numeroMuertesLabel: UILabel!
    @IBOutlet weak var recuperadosLabel: UILabel!
    @IBOutlet weak var numeroRecuperadosLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        barraBusquedaTextField.delegate = self

        //self.banderaImageView.image = UIImage(named: "celula-coronavirus-dos-cientificos-laboratorio_1639-12580.jpg")
        
       
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
        covidManager.delegado = self
    }
    @objc func tapGestureHandler() {
            barraBusquedaTextField.endEditing(true)
      }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //paisLabel.text = buscarTextField.text
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if barraBusquedaTextField.text != ""{
            return true
        }else{
            barraBusquedaTextField.placeholder = "Ingresa un país"
            return false
        }
    }
    
    @IBAction func buscarButton(_ sender: UIButton) {
        //paisLabel.text = buscarTextField.text
        if barraBusquedaTextField.text != ""{
            covidManager.fetchCovid(nombrePais: barraBusquedaTextField.text!)
        }else{
            paisLabel.text = "Ingresa un país"
            banderaImageView.image = UIImage(named:"328ff48684eef92268d8e22b173925ac-hombre-de-dibujos-animados-pensando-by-vexels.png")
            casosNumeroLabel.text = ""
            numeroMuertesLabel.text = ""
            numeroRecuperadosLabel.text = ""
            casosConfirmadosLabel.text = ""
            muertesLabel.text = ""
            recuperadosLabel.text = ""
        }
       
    }
    

}

