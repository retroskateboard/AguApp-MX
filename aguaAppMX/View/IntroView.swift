//
//  IntroView.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

struct IntroView: View {

    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State var showHomeView: Bool = false
    @Namespace var animation
    var body: some View {
        ZStack{
            if showHomeView{
                LoginPage()
                    .transition(.move(edge: .trailing))
            }else{
                ZStack{
                    Color(UIColor(red:0.9176470588235294, green:0.9215686274509803, blue:0.9294117647058824, alpha:1.0))
                        .ignoresSafeArea()
                    
                    IntroScreen()
                    
                    WalkThroughScreens()
                    
                    NavBar()
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showHomeView)
    }
    
    @ViewBuilder
    func WalkThroughScreens()->some View{
        let isLast = currentIndex == intros.count
        
        GeometryReader{
            let size = $0.size
            
            ZStack{
                ForEach(intros.indices,id: \.self){index in
                    ScreenView(size: size, index: index)
                }
                
                WelcomeView(size: size, index: intros.count)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .bottom, content: {
                Indicators()
                    .opacity(isLast ? 0 : 1)
                    .animation(.easeInOut(duration: 0.35), value: isLast)
                    .offset(y: -180)
            })
            
            //Next Button
            .overlay(alignment: .bottom) {
                
                //Converting Next Button Into SignUP Button
                ZStack{
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .scaleEffect(!isLast ? 1 : 0.001)
                        .opacity(!isLast ? 1 : 0)
                    
                    HStack{
                        Text("¡Inicia sesión o registrate!")
                            .font(.custom(customFont, size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .center)
                        
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal,12)
                    .scaleEffect(isLast ? 1 : 0.001)
                    .frame(height: isLast ? nil : 0)
                    .opacity(isLast ? 1 : 0)
                }
                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: isLast ? 30 : 50, style: isLast ? .continuous : .circular)
                        .fill(Color(red: 0.184, green: 0.431, blue: 0.553))
                }
                .onTapGesture {
                    if currentIndex == intros.count{
                        // Signup Action
                        showHomeView = true
                    }else{
                        // MARK: Updating Index
                        currentIndex += 1
                    }
                }
                .offset(y: isLast ? -90 : -90)
                // Animation
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
            }
            .offset(y: showWalkThroughScreens ? 0 : size.height)
        }
    }
    

    @ViewBuilder
    func Indicators()->some View{
        HStack(spacing: 8){
            ForEach(intros.indices,id: \.self){index in
                Circle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 8, height: 8)
                    .overlay {
                        if currentIndex == index{
                            Circle()
                                .fill(Color(red: 0.184, green: 0.431, blue: 0.553))
                                .frame(width: 8, height: 8)
                                .matchedGeometryEffect(id: "INDICATOR", in: animation)
                        }
                    }
            }
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: currentIndex)
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize,index: Int)->some View{
        let intro = intros[index]
        
        VStack(spacing: 10){
            Text(intro.title)
                .font(.custom(customFont, size: 28))
                .fontWeight(.bold)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text(intro.text)
                .font(.custom(customFont, size: 17))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.bottom)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom)
                .frame(height: 250,alignment: .top)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
        .offset(y: -30)
    }
    
    // MARK: Welcome Screen
    @ViewBuilder
    func WelcomeView(size: CGSize,index: Int)->some View{
        VStack(spacing: 10){
            Image(systemName: "drop.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(.cyan)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("¡Hola!")
                .font(.custom(customFont, size: 30))
                .padding(.top,35)
                .fontWeight(.bold)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("AguApp MX te da la bienvenida a la app que te ayudará a cuidar el agua de manera sencilla y efectiva.")
                .font(.custom(customFont, size: 18))
                .padding(.top)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
        }
        .offset(y: -30)
    }
    
    @ViewBuilder
    func NavBar()->some View{
        let isLast = currentIndex == intros.count
        
        HStack{
            Button {
                if currentIndex > 0{
                    currentIndex -= 1
                }else{
                    showWalkThroughScreens.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.custom(customFont, size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.184, green: 0.431, blue: 0.553))
            }

            Spacer()
            
            Button("Omitir"){
                currentIndex = intros.count
            }
            .font(.custom(customFont, size: 17))
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 0.184, green: 0.431, blue: 0.553))
            .opacity(isLast ? 0 : 1)
            .animation(.easeInOut, value: isLast)
        }
        .padding(.horizontal,30)
        .padding(.top,10)
        .frame(maxHeight: .infinity,alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }
    
    @ViewBuilder
    func IntroScreen()->some View{
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 10){
                Image("reto1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250 / 2)
                    .padding(.top,200)
                
                Text("AguApp MX")
                    .font(.custom(customFont, size: 33))
                    .fontWeight(.semibold)
                    .padding(.top,100)
                    .foregroundColor(Color(red: 0.184, green: 0.431, blue: 0.553))
                
                Text("Una solución para fomentar la responsabilidad y el cuidado del agua en México\n\n¡Agua para todos!")
                    .font(.custom(customFont, size: 20))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,30)
                    .padding(.top,30)
                
                Text("Comencemos")
                    .font(.custom(customFont, size: 20))
                    .fontWeight(.semibold)
                    .padding(.horizontal,40)
                    .padding(.vertical,19)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(Color(red: 0.184, green: 0.431, blue: 0.553))
                    }
                    .onTapGesture {
                        showWalkThroughScreens.toggle()
                    }
                    .padding(.top,30)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            // MARK: Moving Up When Clicked
            .offset(y: showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
