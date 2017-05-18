//
//  Calcolatrice.swift
//  Primo
//
//  Created by Ospite on 02/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import Foundation

class Calcolatrice{
    
    var valoreDisplay:Double
    
    init(val:Double) {
        self.valoreDisplay=val
    }
    
    func somma(valore:Double) -> Double {
        return valoreDisplay+valore
    }
    func sottrazione(valore:Double) -> Double {
        return valoreDisplay-valore
    }
    func moltiplicazione(valore:Double) -> Double {
        return valoreDisplay*valore
    }
    func divisione(valore:Double) -> Double {
        return valoreDisplay/valore
    }
}
