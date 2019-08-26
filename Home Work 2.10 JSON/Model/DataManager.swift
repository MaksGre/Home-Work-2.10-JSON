//
//  CompanySymbols.swift
//  Home Work 2.10 JSON
//
//  Created by Maksim Grebenozhko on 23/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let symbols = [
        "",
        "A",
        "AAPL",
        "BRK.A",
        "C",
        "GOOG",
        "HOG",
        "HPQ",
        "INTC",
        "KO",
        "LUV",
        "MMM",
        "MSFT",
        "T",
        "TGT",
        "TXN",
        "WMT"
    ]
    
    let companies = [
        "",
        "Agilent Technologies",
        "Apple Inc.",
        "Berkshire Hathaway",
        "Citigroup",
        "Alphabet Inc.",
        "Harley-Davidson Inc.",
        "Hewlett-Packard",
        "Intel",
        "The Coca-Cola Company",
        "Southwest Airlines",
        "Minnesota Mining and Manufacturing",
        "Microsoft",
        "AT&T",
        "Target Corporation",
        "Texas Instruments",
        "Walmart"
    ]
    
    func symbolAndCompanyAt(index: Int) -> String {
        if index == 0 {
            return ""
        }
        return "\(symbols[index]) - \(companies[index])"
    }
}
