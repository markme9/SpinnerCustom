//
//  ContentView.swift
//  SpinnerCustom
//
//  Created by mark me on 1/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isListRefreshing = true
    @State var items = [1, 2, 3, 4, 5]
    
    var body: some View {
        NavigationView {
            VStack {
                if isListRefreshing {
                    HStack {
                        ForthSpinner(isAnimating: $isListRefreshing)
                        
                        Spacer()
                        
                        ThirdSpinner(isAnimating: $isListRefreshing)
                        
                        Spacer()
                        
                        LastSpinner(isAnimating: $isListRefreshing)
                    }
                    .padding([.leading, .trailing], 50)
                    
                    
                    HStack(spacing: 50) {
                        FirstSpinner(isAnimating: $isListRefreshing)
                        
                        SecondSpinner(isAnimating: $isListRefreshing)
                    }
                    
                }else {
                    List(items, id: \.self) { item in
                        Text("Item \(item)")
                    }
                }
            }
            .navigationTitle(Text("Five Spinner"))
            .onAppear {
                // REFRESH THE LIST
                self.refreshList()
            }
        }
    }
    func refreshList() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.isListRefreshing = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FirstSpinner: View {
    
    @Binding var isAnimating: Bool
    @State var roatation = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(roatation ? 360 : 0))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.roatation.toggle()
                    }
                }
        }
    }
}
