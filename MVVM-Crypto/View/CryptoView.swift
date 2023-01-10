//
//  ContentView.swift
//  MVVM-Crypto
//
//  Created by Kursat Korkmaz on 9.01.2023.
//

import SwiftUI

struct CryptoView: View {
    
    var symbol : String
    @StateObject private var cryptoViewModel : CryptoViewModel = CryptoViewModel()
    
    init(symbol:String = "BTC-USDT"){
        self.symbol = symbol
    }
    
    var body: some View {
            VStack(alignment: .center){
                
                Text(cryptoViewModel.symbol.uppercased())
                    .font(.system(size: 42).bold())
                    .padding(.vertical,10)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Current: ")
                        Text("HIGH: ")
                        Text("AVG: ")
                        Text("LOW: ")
                    }.font(.title.bold())
                    
                    VStack(alignment: .leading){
                        HStack{
                            
                            Text(String(format: "%.2f", Float(cryptoViewModel.buy) ?? 0))
                                .frame(maxWidth:150)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            Text("USDT")
                        }
                        
                        HStack{
                            Text(String(format: "%.2f", Float(cryptoViewModel.high) ?? 0))
                                .frame(maxWidth:150)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            Text("USDT")
                        }
                        
                        HStack{
                            Text(String(format: "%.2f", Float(cryptoViewModel.averagePrice) ?? 0))
                                .frame(maxWidth:150)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            Text("USDT")
                        }
                        
                        HStack{
                            Text(String(format: "%.2f", Float(cryptoViewModel.low) ?? 0))
                                .frame(maxWidth:150)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            Text("USDT")
                        }
                        
                    }.font(.title)
                }
            }
            .padding(20)
            .background{
                Color.white
                    .ignoresSafeArea()
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
            }
            .onAppear(){
                self.cryptoViewModel.load(getSymbol: symbol)
            }
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView()
    }
}
