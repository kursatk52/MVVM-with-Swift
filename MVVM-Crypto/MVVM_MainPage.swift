//
//  MVVM_MainPage.swift
//  MVVM-Crypto
//
//  Created by Kursat Korkmaz on 10.01.2023.
//

import SwiftUI

struct MVVM_MainPage: View {
    
    init(){
        CryptoViewModel().load()
    }
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(alignment: .center) {
                
                Text("Crypto Currency")
                    .font(.system(size: 32).bold())
                    .foregroundColor(.yellow)
                    .shadow(color: .yellow, radius: 10, x: 0, y: 0)
                    .padding(.vertical,15)
                
                
                ScrollView(.vertical, showsIndicators: false){
                    CryptoView()
                        .padding(15)
                    CryptoView(symbol: "ETH-USDT")
                        .padding(15)
                    CryptoView(symbol: "BNB-USDT")
                        .padding(15)
                    CryptoView(symbol: "MATIC-USDT")
                        .padding(15)
                    CryptoView(symbol: "DOGE-USDT")
                        .padding(15)
                    CryptoView(symbol: "SOL-USDT")
                        .padding(15)
                }
            }
        }
    }
}

struct MVVM_MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MVVM_MainPage()
    }
}
