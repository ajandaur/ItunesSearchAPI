//
//  BuyButton.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/18/23.
//

import SwiftUI

struct BuySongButton: View {
    
    var urlString: String
    
    var price: Double?
    var currency: String
    
    var body: some View {
        if let price = price {
            BuyButton(urlString: urlString, price: price, currency: currency)
        } else {
            Text("ALBUM ONLY")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
   
}

struct BuyButton: View {
    
    var urlString: String
    
    var price: Double?
    var currency: String
    
    var body: some View {
        if let url = URL(string: urlString), let priceText = formattedPrice() {
        
            Link(destination: url) {
                Text(priceText)
            }
                .buttonStyle(BuyButtonStyle())
           
        }
            
    }
    
    func formattedPrice() -> String? {
        
        guard let price = price else { return nil }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        
        formatter.string(from: NSNumber(value: price))
        
        let priceString = formatter.string(from: NSNumber(value: price))
        return priceString
    }
}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        BuyButton(urlString: "", price: 2.00, currency: "")
    }
}
