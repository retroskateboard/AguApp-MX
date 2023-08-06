//
//  DetailView.swift
//  AguaAppMX
//
//  Created by Eric Rojas Pech on 03/12/22.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie
    @Binding var showDetailView: Bool
    @Binding var detailMovie: Movie?
    @Binding var currentCardSize: CGSize
    
    
    var animation: Namespace.ID
    
    @State var showDetailContent: Bool = false
    @State var offset: CGFloat = 0
    @State private var showAlert = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: currentCardSize.width, height: currentCardSize.height)
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: movie.id, in: animation)
                    .padding(.bottom,-60)
                
                VStack(spacing: 15){
                    Text(movie.movieTitle)
                        .font(.custom(customFont, size: 28))
                        .fontWeight(.semibold)
                        .padding(.top,25)
                        .foregroundColor(.black)
                    
                    Text(movie.challengeDescription)
                        .font(.custom(customFont, size: 22))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                        .padding(.bottom,10)
                    
                    
                        
        
                    Button {
                        showAlert = true
                    } label: {
                     
                        Text("Acepta el reto")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
                            .background{
                                RoundedRectangle(cornerRadius: 80, style: .continuous)
                                    .fill(Color(red:0.3137254901960784, green:0.4549019607843137, blue:0.5647058823529412))
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Aceptaste el reto"),
                                    message: Text("Recuerda que pequeñas acciones, nos llevan a grandes cambios."),
                                    dismissButton: .default(Text("¡Ahorremos!"))
                                )
                            }
                    }
                    .padding(.top,10)
                    .padding(.horizontal,80)
                    .padding(.bottom,30)
                    
                }
                .offset(y: showDetailContent ? 0 : 200)
            }
            .padding()
            .modifier(OffsetModifier(offset: $offset))
            .frame(maxHeight: .infinity,alignment: .top)
            .background(Color(red: 0.655, green: 0.725, blue: 0.761))
                .ignoresSafeArea()
            
        }
        .coordinateSpace(name: "SCROLL")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.655, green: 0.725, blue: 0.761))
        .onAppear {
            withAnimation(.easeInOut){
                showDetailContent = true
            }
        }
        .onChange(of: offset) { newValue in
            if newValue > 120{
                withAnimation(.easeInOut){
                    showDetailContent = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    withAnimation(.easeInOut){
                        showDetailView = false
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
