//
//  ViewController.swift
//  Kostprijs Calculator Tarief Medewerker
//
//  Created by Erwin Giesbers on 02-03-16.
//  Copyright © 2016 erwinscode. All rights reserved.
//  Dit is een test

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtBrutoMaandsalaris: UITextField!
    @IBOutlet weak var txtLeasetarief: UITextField!
    @IBOutlet weak var txtOverigeKosten: UITextField!
    
    
    @IBOutlet weak var lblKostprijsPerJaar: UILabel!
    @IBOutlet weak var lblKostprijsperMaand: UILabel!
    @IBOutlet weak var lblKostprijsPerWeek: UILabel!
    @IBOutlet weak var lblKostprijsPerDag: UILabel!
    @IBOutlet weak var lblKostprijsPerUur: UILabel!
    
    var brutoMaandsalaris = ""
    var leaseTarief = ""
    var overigeKosten = ""
    
    var kostprijsPerJaar : Float = 0.0
    var kostprijsPerMaand : Float = 0.0
    var kostprijsPerWeek : Float = 0.0
    var kostprijsPerDag : Float = 0.0
    var kostprijsPerUur : Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnBerekenACTION(sender: UIButton) {
        
        if txtBrutoMaandsalaris.text != "" && txtLeasetarief.text != "" && txtOverigeKosten.text != "" {
            
            
            
            
            takeInData()
            bereken()
            
            
        }
        
        
    }
    
    @IBAction func btnOpnieuwACTION(sender: UIButton) {
        
        opnieuw()
    }
    
    func takeInData(){
        
        brutoMaandsalaris = txtBrutoMaandsalaris.text!
        leaseTarief = txtLeasetarief.text!
        overigeKosten = txtOverigeKosten.text!
        
        
    }
    
    func bereken(){
        
        let fBrutoMaandsalaris = Float(brutoMaandsalaris)
        let fLeaseTarief = Float(leaseTarief)
        let fOverigeKosten = Float(overigeKosten)
        
        kostprijsPerMaand = fBrutoMaandsalaris! * 1.26 + fLeaseTarief! * 1.23 + fOverigeKosten!
            + fBrutoMaandsalaris! * 0.047
        
        // 1.26 = 26% extra werkgeverskosten op bruto salaris
        // 1.23 = 23% extra autokosten (brandstog etc)
        // 0.047 = 4,7% pensioenkosten werkgever op bruto salaris
        
        kostprijsPerJaar = kostprijsPerMaand * 12
        kostprijsPerUur = kostprijsPerJaar / 1824
        kostprijsPerWeek = kostprijsPerJaar / 45.6
        kostprijsPerDag = kostprijsPerJaar / 228
        
        print()
        
        
        
    }
    
    func opnieuw(){
        
        lblKostprijsPerJaar.text = "€ 0,00"
        lblKostprijsperMaand.text = "€ 0,00"
        lblKostprijsPerWeek.text = "€ 0,00"
        lblKostprijsPerDag.text = "€ 0,00"
        lblKostprijsPerUur.text = "€ 0,00"
        
        txtBrutoMaandsalaris.text = ""
        txtLeasetarief.text = ""
        txtOverigeKosten.text = ""
        
        
    }
    
    func print(){
        
        
        
        let sKostprijsPerJaar = String(format: "%0.2f", kostprijsPerJaar)
        let sKostprijsPerMaand = String(format: "%0.2f", kostprijsPerMaand)
        let sKostprijsPerWeek = String(format: "%0.2f", kostprijsPerWeek)
        let sKostprijsPerDag = String(format: "%0.2f", kostprijsPerDag)
        let sKostprijsPerUur = String(format: "%0.2f", kostprijsPerUur)
        
        
        
        
        lblKostprijsPerJaar.text = "€ \(sKostprijsPerJaar)"
        lblKostprijsperMaand.text = "€ \(sKostprijsPerMaand)"
        lblKostprijsPerWeek.text = "€ \(sKostprijsPerWeek)"
        lblKostprijsPerDag.text = "€ \(sKostprijsPerDag)"
        lblKostprijsPerUur.text = "€ \(sKostprijsPerUur)"
        
        
    }
    
    func hideKeyboard(){
        
        txtBrutoMaandsalaris.resignFirstResponder()
        txtLeasetarief.resignFirstResponder()
        txtOverigeKosten.resignFirstResponder()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyboard()
    }
    
    
    
    
}


