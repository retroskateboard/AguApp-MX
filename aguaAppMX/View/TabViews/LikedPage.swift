//
//  ProfilePage.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

struct LikedPage: View {
    @State var currentIndex: Int = 0
    @State var detailMovie: Movie?
    @State var showDetailView: Bool = false
    @State var currentCardSize: CGSize = .zero
    
    @Namespace var animation
    
    @Environment(\.colorScheme) var scheme
    var body: some View {
        ZStack{

            VStack{

                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: movies) { movie in
                    
                    GeometryReader{proxy in
                        let size = proxy.size
                        
                        Image(movie.artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: movie.id, in: animation)
                            .onTapGesture {
                                currentCardSize = size
                                detailMovie = movie
                                withAnimation(.easeInOut){
                                    showDetailView = true
                                }
                            }
                        
                        Text(movie.movieTitle)
                            .frame(width: size.width, height: size.height, alignment: .bottom)
                            .font(.custom(customFont, size: 24))
                            .fontWeight(.semibold)
                        }
                }
                .padding(.bottom,100)
                .padding(.top,150)
                
                // Custom Indicator
                CustomIndicator()
                    .padding(.top,-70)
                
                

            }
            .overlay {
                if let movie = detailMovie,showDetailView{
                    DetailView(movie: movie, showDetailView: $showDetailView, detailMovie: $detailMovie, currentCardSize: $currentCardSize, animation: animation)
                }
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .background(LinearGradient(colors: [ Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        )
    }
    
    // MARK: Custom Indicator
    @ViewBuilder
    func CustomIndicator()->some View{
        HStack(spacing: 5){
            ForEach(movies.indices,id: \.self){index in
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    
}


struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        LikedPage()
    }
}



