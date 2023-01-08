//
//  LastSpinner.swift
//  SpinnerCustom
//
//  Created by mark me on 1/8/23.
//

import SwiftUI

struct LastSpinner: View {
    
    @State var rotation: Double = 0
    @Binding var isAnimating: Bool
    
    var body: some View {
        ZStack {
            ForEach(0..<12) { i in
                Circle()
                    .fill(Color(UIColor.magenta))
                    .frame(width: 20, height: 20)
                    .offset(x: 20 * cos(.pi / 6 * Double(i)) , y: 20 * sin(.pi / 6 * Double(i)))
                    .rotationEffect(.degrees(Double(i) * 60 + rotation))
            }
        }
        .frame(width: 30, height: 30)
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.rotation = 360
            }
        }
    }
}

struct LastSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LastSpinner(isAnimating: .constant(false))
    }
}
