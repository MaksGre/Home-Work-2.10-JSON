//
//  ViewController.swift
//  Home Work 2.10 JSON
//
//  Created by Maksim Grebenozhko on 22/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var commonView: UIView!
    @IBOutlet var companiesView: UIView!
    @IBOutlet var companiesPicker: UIPickerView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastPriceDateLabel: UILabel!
    @IBOutlet var lastExchangeDateLabel: UILabel!
    @IBOutlet var frankfurtLastPrice: UILabel!
    @IBOutlet var closeLabel: UILabel!
    @IBOutlet var previousCloseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companiesPicker.delegate = self
        companiesPicker.dataSource = self
        companiesPicker.showsSelectionIndicator = true
        
        activityIndicator.hidesWhenStopped = true
        
        commonView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataManager.shared.symbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataManager.shared.symbolAndCompanyAt(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        commonView.isHidden = row == 0
        if row > 0 {
            fetchDataFor(symbol: DataManager.shared.symbols[row])
        }
    }
    
    private func fetchDataFor(symbol: String) {

        loadingStartIndication()
        
        let headers = [
            "x-rapidapi-host": "myallies-breaking-news-v1.p.rapidapi.com",
            "x-rapidapi-key": "6976e2adedmsha25ff2200c4f160p14bd1djsn66995eb60a7b"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://myallies-breaking-news-v1.p.rapidapi.com/GetCompanyDetailsBySymbol?symbol=\(symbol)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                self.indicationOfDownloadCompletion()
                return
            }
            do {
                let httpResponse = response as? HTTPURLResponse
                print("httpResponse\n")
                print(httpResponse ?? "nil")

                let data = try JSONDecoder().decode(JSONModel.self, from: data)
                DispatchQueue.main.async {
                    self.fillLabelsWith(data: data)
                }
            } catch let error {
                print("error\n")
                print(error)
                self.indicationOfDownloadCompletion()
            }
        }
        
        dataTask.resume()
    }
    
    private func loadingStartIndication() {
        companiesView.alpha = 0.9
        companiesPicker.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    private func indicationOfDownloadCompletion() {
        companiesView.alpha = 1
        companiesPicker.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
    }
    
    private func fillLabelsWith(data: JSONModel) {
        symbolLabel.text = data.Data?.Symbol ?? "nil"
        nameLabel.text = data.Data?.Name ?? "nil"
        lastPriceDateLabel.text = data.Data?.Stock?.LastPriceDate ?? "nil"
        lastExchangeDateLabel.text = data.Data?.Stock?.LastExchangeDate ?? "nil"
        frankfurtLastPrice.text = String(format: "%.2f", Double(data.Data?.Stock?.FrankfurtLastPrice ?? 0))
        closeLabel.text = String(format: "%.2f", Double(data.Data?.Stock?.Close ?? 0))
        previousCloseLabel.text = String(format: "%.2f", Double(data.Data?.Stock?.PreviousClose ?? 0))

        indicationOfDownloadCompletion()

        print(data.Data?.ID ?? "nil")
        print(data.Data?.Symbol ?? "nil")
        print(data.Data?.Name ?? "nil")
        print(data.Data?.ISIN ?? "nil")
        print(data.Data?.CIK ?? "nil")
        print(data.Data?.TradeCount ?? "nil")
        print(data.Data?.ViewCount ?? "nil")
        print(data.Data?.Stream ?? "nil")
        print(data.Data?.LogoPath ?? "nil")

        print(data.Data?.Stock?.CompanyID ?? "nil")
        print(data.Data?.Stock?.LastPriceDate ?? "nil")
        print(data.Data?.Stock?.LastExchangeDate ?? "nil")
        print(data.Data?.Stock?.MarketCapitalization ?? "nil")
        print(data.Data?.Stock?.FrankfurtLastPrice ?? "nil")
        print(data.Data?.Stock?.LastUpdated ?? "nil")
        print(data.Data?.Stock?.Price ?? "nil")
        print(data.Data?.Stock?.Close ?? "nil")
        print(data.Data?.Stock?.PreviousClose ?? "nil")
        print(data.Data?.Stock?.Id ?? "nil")
        
        print(data.EventMessage ?? "nil")
    }
    
}
