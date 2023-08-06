//
//  MainPage.swift
//  AguaAppMX
//
//  Created by Eric Rojas Pech on 03/12/22.
//

import SwiftUI

struct MainPage: View {
    
    @State var currentTab: Tab = .Home
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        
        VStack(spacing: 0){
            //Tab view
            TabView(selection: $currentTab) {
                
                Home()
                    .tag(Tab.Home)
                
                LikedPage()
                    .tag(Tab.Liked)
                
                CartPage()
                    .tag(Tab.Cart)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
            }
            
            //custom tab bar
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    Button {
                        currentTab = tab
                    } label: {
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                            .background(
                                Color(red: 0.173, green: 0.404, blue: 0.525)
                                    .opacity(0.8)
                                    .cornerRadius(20)
                                    .padding(-8)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color.white : Color.black)
                    }
                    
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.top,10)
            .padding(.bottom,-5)
        }
            .background(LinearGradient(colors: [ Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea())
            
            .overlay(
                ZStack{
                    
                }
            )
    }
        
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

//Making case Iterable
//Tab cases
enum Tab: String,CaseIterable{
    case Home = "Home_black"
    case Liked = "trophy"
    case Cart = "habits"
    case Profile = "Perfil_black"
}
