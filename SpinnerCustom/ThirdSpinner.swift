//
//  ThirdSpinner.swift
//  SpinnerCustom
//
//  Created by mark me on 1/8/23.
//

import SwiftUI

struct ThirdSpinner: View {
    
    @Binding var isAnimating: Bool
    @State var rotation = false
    @State var currentNumber = 1
    
    var body: some View {
        VStack {
            Text("\(currentNumber)")
                .font(.largeTitle.bold())
                .rotationEffect(.degrees(rotation ? 360 : 0))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.rotation.toggle()
                        
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                            self.currentNumber = (self.currentNumber + 1) % 10
                        }
                    }
                }
            Text("Loading...")
                .font(.headline)
        }
    }
}

struct ThirdSpinner_Previews: PreviewProvider {
    static var previews: some View {
        ThirdSpinner(isAnimating: .constant(false))
    }
}
