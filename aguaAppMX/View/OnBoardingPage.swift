//
//  OnBoardingPage.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

let customFont = "Raleway-Regular"

struct OnBoardingPage: View {
    @State var showLoginPage: Bool = false
    var body: some View {
        
        VStack(alignment: .leading){
            Text("AguaApp MX")
                .font(.custom(customFont, size: 45))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(y:-130)
                .offset(x:37)
                .padding(.top,10)
                .padding(.vertical,10)

            Image(systemName: "drop.fill")
                .resizable()
                .frame(width: 80.0, height: 120.0)
                .offset(y:-10)
                .offset(x:140)
                .foregroundColor(Color.cyan)
            
            Button{
                withAnimation {
                    showLoginPage = true
                }
            }label: {
                Text("Entrar")
                    .font(.custom(customFont, size: 25))
                    .fontWeight(.semibold)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(Color.cyan)
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
                    .foregroundColor(Color.white)
                    .padding(.top,30)

            }
            .padding(.horizontal,60)
            .offset(y:100)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.184, green: 0.431, blue: 0.553)
        )
        .overlay(
        
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .trailing))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}
