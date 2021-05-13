//
//  NewDataScreen.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 07.03.2021.
//

import SwiftUI
import CoreData

struct NewDataScreen: View {
    @ObservedObject var homeData: HomeViewModel
    @State var fullOn = false
    @Environment(\.managedObjectContext) var context
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                VStack {
                    Form{
                        Section(header: Text(homeData.typeperson.isEmpty ? "Кто вы? «Выручатель» или «Должник»" : "")){
                            Picker(homeData.typeperson.isEmpty ? "Выбрать" : "Вы: " , selection: $homeData.typeperson){
                                ForEach(homeData.typepersons, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                        
                        if !homeData.typeperson.isEmpty {
                            Section(header: Text(homeData.typeperson == homeData.typepersons[0] ? "Человек, которому вы дали деньги": "Человек, которому вам дали деньги"), footer: Text("Введите сумму только по цифру !!!").foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))){
                                TextField("Имя Фамилия", text: $homeData.name)
                                HStack(alignment: .center) {
                                    Text("Номер телефона:")
                                        .font(.callout)
                                        .bold()
                                    TextField("+7 9999 02 002 7", text: $homeData.number)
                                    
                                }
                                TextField("Сумма", text: $homeData.sum)
                            }
                            Toggle(isOn: $fullOn, label: {
                                Text("Вводить дополнительная информация")
                            })
                            if fullOn {
                                Section {
                                    Picker("Согласованная валюта" , selection: $homeData.typecurrency){
                                        ForEach(homeData.typescurrency, id: \.self){
                                            Text($0)
                                        }
                                    }
                                    DatePicker("Cогласованный срок", selection: $homeData.date, displayedComponents: .date)
                                    
                                    
                                    Button(action: {
                                        homeData.done.toggle()
                                    }, label: {
                                        Image(systemName: homeData.done ? "checkmark.circle.fill" :  "checkmark.circle")
                                            .renderingMode(.original)
                                            .resizable()
                                            .padding(0)
                                            .frame(width: 14.0, height: 14.0)
                                        Text(homeData.typeperson == homeData.typepersons[0] ? "Долг возвращен" : "Деньги отдано").padding(0)
                                    })
                                    .buttonStyle(PlainButtonStyle())
                                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0.02))
                                    .cornerRadius(0)
                                }
                                Section(header: Text("Заметка!!!")){
                                    TextEditor(text: $homeData.comment)
                                        .frame(height: 150)
                                    
                                }
                            }
                        }
                        
                    }
                    //shu yerda
                    
                    
                    Divider()
                    
                    Button(action: {
                        homeData.writeData(context: context)
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Spacer()
                        Text(homeData.updateItem == nil ? "Добавить" : "Обновить")
                            .fontWeight(.bold)
                        Spacer()
                    })
                    .frame(height:45)
                    .background(Color("purple")).foregroundColor(Color("white")).cornerRadius(10).padding()
                    .disabled(homeData.name == "")
                    .opacity(homeData.name == "" ? 0.45 : 1)
                    .navigationBarTitle("\(homeData.updateItem == nil ? "Добавить новый" : "Обновить") долг", displayMode: .inline)
                }
                
            }
        }
        .accentColor(Color("purple"))
        
    }
}

struct NewDataScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewDataScreen(homeData: HomeViewModel())
    }
}
