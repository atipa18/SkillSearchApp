//
//  ContentView.swift
//  SkillSearch
//
//  Created by Tipa, Adrian-Ionut on 02.12.2021.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Image("logo")
            
            Spacer()
            
            Text("SkillSearch")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            VStack{
                Text("Lorem ipsum is simply dummy text of the printing and typesetting industry.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(30)
                
                Button("Get Started") {
                    print("Button tapped!")
                }
                .frame(width: 340, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                    .background(Color(red: 0.529, green: 0.744, blue: 0.143))
                    .cornerRadius(10)

                Button("I already have an account") {
                    print("here")
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.529, green: 0.744, blue: 0.143)/*@END_MENU_TOKEN@*/)
                .font(.callout)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
