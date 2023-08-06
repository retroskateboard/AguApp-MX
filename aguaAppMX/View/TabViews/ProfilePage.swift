//
//  ProfilePage.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//
import SwiftUI

struct ProfilePage: View {

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text("Mi perfil")
                        .font(.custom(customFont, size: 30).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 10){
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                            .offset(y: -50)
                            .padding(.bottom,-45)
                        
                        Text("Eric Rojas Pech")
                            .font(.custom(customFont, size: 18))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10){
                            Text("Agua total ahorrada: 100 lts")
                                .font(.custom(customFont, size: 15))
                            
                            Image(systemName: "drop.fill")
                                .foregroundColor(.cyan)

                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding([.horizontal,.bottom])
                    .background(
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    //Links de navegacion
                    
                    customNavigationLink(title: "Editar Perfil"){
                        Text("")
                            .navigationTitle("Editar Perfil")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(LinearGradient(colors:[Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom).ignoresSafeArea())
                    }
                    
    
                    
                    customNavigationLink(title: "Desafios logrados"){
                        Text("")
                            .navigationTitle("Desafios logrados")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(LinearGradient(colors:[Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom).ignoresSafeArea())
                    }
                
            
                    customNavigationLink(title: "Notificaciones"){
                        Text("")
                            .navigationTitle("Notificaciones")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(LinearGradient(colors:[Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom).ignoresSafeArea())
                    }
                    
                    customNavigationLink(title: "Cerrar Sesión"){
                    }
                    
                    customNavigationLink(title: "Acerca de la aplicación"){
                        Text("")
                            .navigationTitle("Acerca de la aplicación")
                            .font(.custom(customFont, size: 30))
                        
                        VStack{
                            
                            Text("Diseño y desarrollo: @retroskateboard")
                                .font(.custom(customFont, size: 20))
                                //.frame(height: 10)
                                .padding(.top,30)
                                .padding(.bottom,30)
                            
                            Text("Ilustraciones: @caracoldelmar_")
                                .font(.custom(customFont, size: 20))
                                //.frame(height: 10)
                                .padding(.top,30)
                                .padding(.bottom)
                            
                        }
                                                            
                        
                        Text("")
                            .font(.custom(customFont, size: 20))
                            .frame(height: 10)
   
                        
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(LinearGradient(colors:[Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint:
                                .bottom).ignoresSafeArea())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                    
                }
                .padding(.horizontal,22)
                .padding(.vertical,10)
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [ Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func customNavigationLink<Detail: View>(title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
        
        NavigationLink{
            content()
        }label: {
            
            HStack{
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal,25)
            .padding(.top,10)
        }
    }
    
    
    
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
