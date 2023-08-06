//
//  Home.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

struct Home: View {
    // MARK: Animation Properties
    @State var currentItem: Today?
    @State var showDetailPage: Bool = false
    
    // Matched Geometry Effect
    @Namespace var animation
    
    // MARK: Detail Animation Properties
    @State var animateView: Bool = false
    @State var animateContent: Bool = false
    @State var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0){
                
                ForEach(todayItems){item in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                            currentItem = item
                            showDetailPage = true
                        }
                    } label: {
                        CardView(item: item)
                        // For Matched Geometry Effect We Didnt applied Padding
                        // Instead Applying Scaling
                        // Approx Scaling Value to match padding
                            .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1 : 0.93)
                    }
                    
                    .buttonStyle(ScaledButtonStyle())
                    .opacity(showDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)
                    .zIndex(currentItem?.id == item.id && showDetailPage ? 10 : 0)
                }
            }
            .padding(.vertical)
            .padding(.horizontal)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red:0.6666666666666666, green:0.7254901960784313, blue:0.7568627450980392))
    
        .overlay {
            if let currentItem = currentItem,showDetailPage{
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        .background(alignment: .top){
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(red:0.6666666666666666, green:0.7254901960784313, blue:0.7568627450980392))
                .frame(height: animateView ? nil : 350,alignment: .top)
                .scaleEffect(animateView ? 1 : 0.93)
                .opacity(animateView ? 1 : 0)
                .ignoresSafeArea()
        }
    }
    
    // MARK: CardView
    @ViewBuilder
    func CardView(item: Today)->some View{
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {
                
                // Banner Image
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image(item.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 20))
                }
                .frame(height: 250)
                
                LinearGradient(colors: [
                
                    .black.opacity(0.5),
                    .black.opacity(0.5),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 20))
                
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.platformTitle.uppercased())
                        .font(.custom(customFont, size:15))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    Text(item.bannerTitle)
                        .font(.custom(customFont, size:28))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.primary)
                .padding()
                .offset(y: currentItem?.id == item.id && animateView ? safeArea().top : 0)
            }
            
            HStack(spacing: 12){
                Image(item.appLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(item.appName)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(item.appDescription)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                

            }
            .padding([.horizontal,.bottom])
        }
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(red:0.3137254901960784, green:0.4549019607843137, blue:0.5647058823529412))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
        .padding(.top,-20)
        .padding(.bottom,30)
    }
    
    // MARK: Detail View
    func DetailView(item: Today)->some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                CardView(item: item)
                    .scaleEffect(animateView ? 1 : 0.93)
                
                VStack(spacing: 15){
                    // Dummy Text
                    Text(item.noticia)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                        .padding(.bottom,20)
                    
                    Divider()
                    
                    Button {
                        if let url = URL(string: item.url) {
                               UIApplication.shared.open(url)
                           }
                    } label: {
                        Text("Leer mas")
                            .font(.custom(customFont, size: 18))
                            .fontWeight(.light)
                            .foregroundColor(.blue)
                            .padding(.vertical,7)
                            .padding(.horizontal,18)
                            .background{
                                Capsule()
                                    .fill(.ultraThinMaterial)
                            }
                    }
                    
                    ShareLink(item: item.url) {
                        Label("Compartir", systemImage:  "square.and.arrow.up")
                    }
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,25)
                    .background{
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color(red:0.3137254901960784, green:0.4549019607843137, blue:0.5647058823529412))
                    }

                }
                .padding()
                .offset(y: scrollOffset > 0 ? scrollOffset : 0)
                .opacity(animateContent ? 1 : 0)
                .scaleEffect(animateView ? 1 : 0,anchor: .top)
            }
            .offset(y: scrollOffset > 0 ? -scrollOffset : 0)
            .offset(offset: $scrollOffset)
        }
        .coordinateSpace(name: "SCROLL")
        .overlay(alignment: .topTrailing, content: {
            Button {
                // Closing View
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    animateView = false
                    animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.05)){
                    currentItem = nil
                    showDetailPage = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top,safeArea().top)
            .offset(y: -10)
            .opacity(animateView ? 1 : 0)
        })
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                animateView = true
            }
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)){
                animateContent = true
            }
        }
        .transition(.identity)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

// MARK: ScaledButton Style
struct ScaledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

// Safe Area Value
extension View{
    func safeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
    
    // MARK: ScrollView Offset
    func offset(offset: Binding<CGFloat>)->some View{
        return self
            .overlay {
                GeometryReader{proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value
                }
            }
    }
}

