//
//  TipCalculatorBrain.swift
//  Tipsy
//
//  Created by Ara Gamaliel on 5/21/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculatorBrain {
    private var tipValue: Double = 0.1
    private var billValue: Double = 0
    private var splitValue: Int = 2
    private var result: Double = 0
    
    mutating func setTipValue(_ value: Double){
        self.tipValue = value
    }
    
    mutating func setBillValue(_ value: Double){
        self.billValue = value
    }
    
    mutating func setSplitValue(_ value: Int){
        self.splitValue = value
    }
    
    mutating func calculate(){
        let totalBill = (billValue * (1 + tipValue)) / Double(splitValue)
        
        self.result = totalBill
    }
    
    func getResult() -> Double {
        return self.result
    }
    
    func getSplitValue() -> Int {
        return self.splitValue
    }
    
    func getTipValue() -> Double {
        return self.tipValue
    }
}
