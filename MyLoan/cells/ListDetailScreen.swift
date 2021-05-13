//
//  ListDetailScreen.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 07.03.2021.
//

import SwiftUI
import CoreData

struct ListDetailScreen: View {
    @StateObject var homeData = HomeViewModel()
    @State var calendar = Calendar.current
    var item: Loan!
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10){
                HStack{
                    HStack {
                        Spacer()
                        Text("ВЫ:")
                            .font(.caption)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.typeperson!)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                HStack{
                    HStack {
                        Spacer()
                        Text("КОМУ:")
                            .font(.caption)
                    }.frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.name!)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }.frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                HStack{
                    HStack {
                        Spacer()
                        Text("СРОК:")
                            .font(.caption)
                    }.frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.date!, style: .date)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }.frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                HStack{
                    HStack {
                        Spacer()
                        Text("СУММА:")
                            .font(.caption)
                    }.frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.sum!)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }.frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                HStack{
                    HStack {
                        Spacer()
                        Text("СОГЛАСОВАННАЯ ВАЛЮТА:")
                            .font(.caption)
                            .multilineTextAlignment(.trailing)
                    }.frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.typecurrency!)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }.frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                HStack{
                    HStack {
                        Spacer()
                        Text("ТЕЛЕФОН НОМЕР:")
                            .font(.caption)
                    }.frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.number!)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }.frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                HStack{
                    HStack {
                        Spacer()
                        Text("ЗАМЕТКА:")
                            .font(.caption)
                    }.frame(maxWidth: UIScreen.main.bounds.width / 2.5)
                    HStack {
                        Text(item.comment!)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        Spacer()
                    }.frame(maxWidth: UIScreen.main.bounds.width / 1)
                }
                //MARK: - Notification!
                
            }
            .padding()
        }
        
        
    }
}

struct ListDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailScreen()
    }
}
