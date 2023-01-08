//
//  ForthSpinner.swift
//  SpinnerCustom
//
//  Created by mark me on 1/8/23.
//

import SwiftUI

struct ForthSpinner: View {
    
    @State var rotation: Double = 0
    @Binding var isAnimating: Bool
    
    var body: some View {
        ZStack {
            ForEach(0..<12) { i in
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 22, height: 22)
                    .offset(x: 20 * cos(.pi / 6 * Double(i)) , y: 20 * sin(.pi / 6 * Double(i)))
                    .rotationEffect(.degrees(Double(i) * 30 + rotation))
                    
            }
        }
        .frame(width: 50 , height: 50)
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.rotation = 360
            }
        }
        
    }
}

struct ForthSpinner_Previews: PreviewProvider {
    static var previews: some View {
        ForthSpinner(isAnimating: .constant(false))
    }
}
