//
//  SecondSpinner.swift
//  SpinnerCustom
//
//  Created by mark me on 1/8/23.
//

import SwiftUI

struct SecondSpinner: View {
    
    let dots = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
    @State var currentDot = 0
    @Binding var isAnimating: Bool
    
    var body: some View {
        Text(dots[currentDot % dots.count])
            .font(.system(size: 100))
            .foregroundStyle(Gradient(colors: [.red, .yellow, .green, .blue, .purple]))
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.currentDot = 0
                    
                    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
                        self.currentDot += 1
                    }
                }
            }
    }
}

struct SecondSpinner_Previews: PreviewProvider {
    static var previews: some View {
        SecondSpinner(isAnimating: .constant(false))
    }
}
