//
//  HomeScreen.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 07.03.2021.
//

import SwiftUI
import CoreData

struct HomeScreen: View {
    @StateObject var homeData = HomeViewModel()
    @FetchRequest(entity: Loan.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Loan>
    @Environment(\.managedObjectContext) var context
    @State var isDetail = false
    
    var body: some View {
        //View
        NavigationView {
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                VStack{
                    if results.isEmpty {
                        Spacer()
                        Text("Нет долгов !!!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }else{
                        ScrollView(.vertical, showsIndicators: false, content: {
                            LazyVStack(alignment: .leading, spacing: 5, content: {
                                ForEach(results, id: \.id) { res in
                                    VStack {
                                        VStack{
                                            ListCell(res: res)
                                            
                                            HStack{
                                                Text("Cогласованный срок: ")
                                                    .font(.callout)
                                                    .fontWeight(.light)
                                                    .foregroundColor(Color("description"))
                                                Text(res.date!, style: .date)
                                                    .font(.callout)
                                                    .fontWeight(.light)
                                                    .foregroundColor(Color("description"))
                                                Spacer()
                                                Menu {
                                                    Button(action: {
                                                        homeData.EditItem(item: res)
                                                        homeData.isNewData.toggle()
                                                    }) {
                                                        Label("Редактировать", systemImage: "pencil.circle")
                                                    }.sheet(isPresented: $homeData.isNewData, content: {
                                                        NewDataScreen(homeData: homeData)
                                                    })
                                                    Button(action: {
                                                        context.delete(res)
                                                        try! context.save()
                                                    }) {
                                                        Label("Удалить", systemImage: "minus.circle")
                                                    }
                                                } label: {
                                                    Image(systemName: "ellipsis.circle").foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                                                }
                                            }
                                            
                                        }.padding()
                                    }.background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color("rectangle"))
                                            .shadow(color: Color(#colorLiteral(red: 0.2414824665, green: 0.273966521, blue: 0.5216231346, alpha: 0.2)), radius: 7, x: 0.0, y: 10.0)
                                                 , alignment: .center)
                                    .padding()
                                }
                            })
                        })
                        
                    }
                    
                    Button(action: {
                        homeData.isNewData.toggle()
                    }, label: {
                        Spacer()
                        Text("Добавить долг")
                            .fontWeight(.bold)
                        Spacer()
                    }).foregroundColor(Color("white"))
                    .frame(height: 45)
                    .background(Color("purple"))
                    .cornerRadius(5)
                    .padding()
                    .sheet(isPresented: $homeData.isNewData, content: {
                        NewDataScreen(homeData: homeData)
                    })
                }
                
                .navigationBarTitle("Мой долг", displayMode: .inline)
            }
            
        }
        //View konets
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
