//
//  ProfilePage.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

struct HabitQuestion: View {
    @State var showHabitQuestionSe: Bool = false
    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
    @StateObject var habitModel: HabitViewModel = .init()
    
    // MARK: Environment Values
    @Environment(\.self) var env
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                    Image(systemName: "chevron.left")
                        .font(.custom(customFont, size: 25).italic())
                        .foregroundColor(.primary)
                        .padding(.leading,10)
                        .rotationEffect(.degrees(-90))
                
                Text("Crea un hábito")
                    .font(.custom(customFont, size: 33))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, -10)
                
                Text("¿Qué es un hábito?")
                    .fontWeight(.semibold)
                    .font(.custom(customFont, size: 22))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,15)
                    .padding(.bottom,10)
                
                Text("Un hábito es una acción que realizamos de manera repetitiva en nuestra vida cotidiana. Estas acciones se vuelven automáticas con el tiempo y se integran en nuestra rutina diaria.")
                    .fontWeight(.light)
                    .font(.custom(customFont, size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                    .padding(.bottom,5)
                
                Text("¿Para que crear un hábito?")
                    .fontWeight(.semibold)
                    .font(.custom(customFont, size: 22))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,10)
                    .padding(.bottom,10)
                
                Text("La sección de ''Hábitos'' en AguApp MX te permitirá establecer hábitos diarios para el cuidado del agua, dividiéndolos por colores y estableciendo recordatorios diarios.\n\nDe esta manera, podrás crear una rutina para cuidar el agua de manera consciente y sostenible.")
                    .fontWeight(.light)
                    .font(.custom(customFont, size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                    .padding(.bottom,10)
                
                Text("Recuerda, cada acción cuenta y tú puedes marcar la diferencia.")
                    .fontWeight(.semibold)
                    .font(.custom(customFont, size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,25)
                    .padding(.bottom,10)
                

                
            }
            .frame(maxHeight: .infinity,alignment: .top)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [ Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            )
            
            .overlay(
            
                Group{
                    if showHabitQuestionSe{
                        CartPage()
                            .transition(.move(edge: .top))
                    }
                }
            )
            
        }
    }
}

struct HabitQuestion_Previews: PreviewProvider {
    static var previews: some View {
        HabitQuestion()
    }
}
