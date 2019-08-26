//
//  JSONModel.swift
//  Home Work 2.10 JSON
//
//  Created by Maksim Grebenozhko on 23/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let CompanyID: Int?
    let LastPriceDate: String?
    let LastExchangeDate: String?
    let MarketCapitalization: Int?
    let FrankfurtLastPrice: Float?
    let LastUpdated: String?
    let Price: String?
    let Close: Float?
    let PreviousClose: Float?
    let Id: Int?
}

struct Data:Decodable {
    let ID: Int?
    let Symbol: String?
    let Name: String?
    let ISIN: String?
    let CIK: Int?
    let TradeCount: Int?
    let ViewCount: Int?
    let Stock: Stock?
    let Stream: String?
    let LogoPath: String?
}

struct JSONModel: Decodable {
    let Data: Data?
    let EventMessage: String?
}
