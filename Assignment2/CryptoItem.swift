//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Zach Evetts on 3/11/23.
//

import SwiftUI

struct CryptoItem: View {
    
    var crypto : CryptoItemModel
    @Binding var bitcoinAmount: Double
    
    var body: some View {
        HStack {
            Text("\(crypto.cryptoName)")
            Spacer()
            Text("\(bitcoinAmount * crypto.multiplier, specifier: "%.2f")")
        }
        .padding()
    }
}
