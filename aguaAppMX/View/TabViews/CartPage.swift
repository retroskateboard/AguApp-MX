//
//  ProfilePage.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//
import SwiftUI

struct CartPage: View {
    @State var showHabitQuestion: Bool = false

    @FetchRequest(entity: Habit.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Habit.dateAdded, ascending: false)], predicate: nil, animation: .easeInOut) var habits: FetchedResults<Habit>
    @StateObject var habitModel: HabitViewModel = .init()
    @StateObject var habitQuestion: HabitViewModel = .init()

    
    
    var body: some View {
        VStack(spacing: 0){
            Text("Crea un hábito")
                .font(.custom(customFont, size: 22))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button {
                        habitQuestion.addNewHabit.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom,10)
            
            // MAKING ADD BUTTON CENTER WHEN HABITS EMPTY
            ScrollView(habits.isEmpty ? .init() : .vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    ForEach(habits){habit in
                        HabitCardView(habit: habit)
                    }
                    
                    // MARK: Add Habit Button
                    Button {
                        habitModel.addNewHabit.toggle()
                    } label: {
                        Label {
                            Text("Agregar hábito")
                                .font(.custom(customFont, size: 20))
                                .fontWeight(.light)

                        } icon: {
                            Image(systemName: "plus.circle")
                        }
                        .font(.callout.bold())
                        .foregroundColor(.primary)
                    }
                    .padding(.top,15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .padding(.vertical)
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [ Color(.white), Color(red: 0.655, green: 0.725, blue: 0.761)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        )
    
        
        .sheet(isPresented: $habitModel.addNewHabit) {
            // MARK: Erasing All Existing Content
            habitModel.resetData()
        } content: {
            AddNewHabit()
                .environmentObject(habitModel)
        }
        
        .sheet(isPresented: $habitQuestion.addNewHabit) {
        } content: {
            HabitQuestion()
                .environmentObject(habitQuestion)
        }
    }
    
    // MARK: Habit Card View
    @ViewBuilder
    func HabitCardView(habit: Habit)->some View{
        VStack(spacing: 6){
            HStack{
                Text(habit.title ?? "")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                Image(systemName: "bell.badge.fill")
                    .font(.callout)
                    .foregroundColor(Color(habit.color ?? "Card-1"))
                    .scaleEffect(0.9)
                    .opacity(habit.isRemainderOn ? 1 : 0)
                
                Spacer()
                
                let count = (habit.weekDays?.count ?? 0)
                Text(count == 7 ? "Cada día" : "\(count) veces a la semana")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal,10)
            
            // MARK: Displaying Current Week and Marking Active Dates of Habit
            let calendar = Calendar.current
            let currentWeek = calendar.dateInterval(of: .weekOfMonth, for: Date())
            let symbols = calendar.weekdaySymbols
            let startDate = currentWeek?.start ?? Date()
            let activeWeekDays = habit.weekDays ?? []
            let activePlot = symbols.indices.compactMap { index -> (String,Date) in
                let currentDate = calendar.date(byAdding: .day, value: index, to: startDate)
                return (symbols[index],currentDate!)
            }
            
            HStack(spacing: 0){
                ForEach(activePlot.indices,id: \.self){index in
                    let item = activePlot[index]
                    
                    VStack(spacing: 6){
                        // MARK: Limiting to First 3 letters
                        Text(item.0.prefix(3))
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        let status = activeWeekDays.contains { day in
                            return day == item.0
                        }
                        
                        Text(getDate(date: item.1))
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .padding(8)
                            .foregroundColor(status ? .white : .primary)
                            .background{
                                Circle()
                                    .fill(Color(habit.color ?? "Card-1"))
                                    .opacity(status ? 1 : 0)
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top,15)
        }
        .padding(.vertical)
        .padding(.horizontal,6)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color("TFBG").opacity(0.5))
        }
        .onTapGesture {
            // MARK: Editing Habit
            habitModel.editHabit = habit
            habitModel.restoreEditData()
            habitModel.addNewHabit.toggle()
        }
    }
    
    // MARK: Formatting Date
    func getDate(date: Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        
        return formatter.string(from: date)
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

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}
