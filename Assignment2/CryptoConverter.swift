//
//  CryptoExchangeView.swift
//  Assignment2
//
//  Created by Zach Evetts on 3/9/23.
//

import SwiftUI

struct CryptoConverter: View {
    
    @ObservedObject var viewModel = CryptoViewModel()
    @State var bitcoinAmount: Double = 1.0
    
    var body: some View {
        List {
            Group {
                HStack {
                    Text("Bitcoin: ")
                        .padding(.leading)
                    Spacer()
                    TextField("", value: $bitcoinAmount, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section{}
                
                VStack {
                    ForEach(viewModel.listOfCrypto) { crypto in
                        CryptoItem(crypto: crypto.cryptoContent, bitcoinAmount: self.$bitcoinAmount)
                        Divider()
                    }
                }
            } .onAppear {
                viewModel.fetchCrypto()
            }
        } .onTapGesture() {
            self.hideKeyboard()
        }
    }
}

struct CryptoConverter_Previews: PreviewProvider {
    static var previews: some View {
        CryptoConverter()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
