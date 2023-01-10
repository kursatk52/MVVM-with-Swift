//
//  CryptoViewModel.swift
//  MVVM-Crypto
//
//  Created by Kursat Korkmaz on 10.01.2023.
//

import Foundation


class CryptoViewModel : ObservableObject{
    
    @Published var symbol : String = "-"
    @Published var buy : String = "-"
    @Published var sell : String = "-"
    @Published var high : String = "-"
    @Published var averagePrice : String = "-"
    @Published var low : String = "-"
    
    
    func load(getSymbol : String = "BTC-USDT"){
        let url = URL(string: "https://api.kucoin.com/api/v1/market/stats?symbol=\(getSymbol)")
        
        var priv_model = CryptoNestedData(symbol: "-", buy: "-", sell: "-", high: "-", averagePrice: "-", low: "-")
        
        let task = URLSession.shared.dataTask(with: url!) { data, _, error in
        
            if let _ = error{
                print("Connection to server error")
            }else{
                if let model = try? JSONDecoder().decode(CryptoModel.self, from: data!){
                    DispatchQueue.main.async {
                        self.symbol = model.data.symbol
                        self.buy = model.data.buy
                        self.sell = model.data.sell
                        self.high = model.data.high
                        self.averagePrice = model.data.averagePrice
                        self.low = model.data.low
                    }
                }else{
                    print("Missfetching data error")
                    return
                }
            }
        }
        task.resume()
    }
    
}
