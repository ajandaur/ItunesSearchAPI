//
//  BuyButtonStyle.swift
//  ItunesSearchApp
//
//  Created by Anmol  Jandaur on 2/18/23.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.accentColor, lineWidth: 1.0))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct BuyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            Button("1.99 USD") {
                
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
}
