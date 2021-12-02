//
//  SplashScreen.swift
//  SkillSearch
//
//  Created by Tipa, Adrian-Ionut on 02.12.2021.
//

import SwiftUI

struct SplashScreenView: View {
    @State var percent = 0.0
    let uLineWidth: CGFloat = 75
    @State var uScale: CGFloat = 1
    let uZoomFactor: CGFloat = 1.2

    
    var body: some View {
        
        
        
        FuberU(percent: percent)
         .stroke(Color(red: 0.529, green: 0.744, blue: 0.143), lineWidth: uLineWidth)
         .rotationEffect(.degrees(-90))
         .aspectRatio(1, contentMode: .fit)
         .padding(20)
         .onAppear() {
           self.handleAnimations()
         }
         .scaleEffect(uScale * uZoomFactor)
         .frame(width: 45, height: 45, alignment: .center)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

struct FuberU: Shape {
    var percent: Double
    
    func path(in rect: CGRect) -> Path {
        let end = percent * 360
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: 0),
                 endAngle: Angle(degrees: end),
                 clockwise: false)
        
        return p
    }
    
    var animatableData: Double {
        get { return percent }
        set { percent = newValue }
    }
}

extension SplashScreenView {
    var uAnimationDuration: Double { return 2.0 }
    
    func handleAnimations() {
        runAnimationPart1()
        restartAnimation()
    }
    
    func runAnimationPart1() {
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            percent = 1
        }
    }
    
    func restartAnimation() {
        let deadline: DispatchTime = .now() + uAnimationDuration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.percent = 0
            self.handleAnimations()
        }
    }
}
