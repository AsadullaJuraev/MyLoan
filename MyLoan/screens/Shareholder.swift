//
//  Shareholder.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 07.03.2021.
//

import SwiftUI
import CoreData

struct Shareholder: View {
    @StateObject var homeData = HomeViewModel()
    @FetchRequest(entity: Loan.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],animation: .spring()) var results : FetchedResults<Loan>
    @Environment(\.managedObjectContext) var context
    @State var isDetail = false
    
    var body: some View {
        //begining
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
                                    
                                    if res.typeperson == homeData.typepersons[0] {
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
                                                }
                                            }.padding()
                                        }.background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color("rectangle"))
                                                .shadow(color: Color(#colorLiteral(red: 0.2414824665, green: 0.273966521, blue: 0.5216231346, alpha: 0.2)), radius: 7, x: 0.0, y: 10.0)
                                                     , alignment: .center)
                                        .padding()
                                    }
                                    else{
                                        
                                            Text("Нет долгов !!!")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("purple"))
                                                .padding()
                                        
                                    }
                                    
                                }
                            })
                        })
                        
                    }
                }
                
                .navigationTitle("Выручатель")
            }
        }
        //ending
    }
}

struct Shareholder_Previews: PreviewProvider {
    static var previews: some View {
        Shareholder()
    }
}
