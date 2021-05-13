//
//  ContentView.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 03.03.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        
            TabView{
                        HomeScreen().tabItem {
                            VStack{
                                Image(systemName: "person.fill")
                                Text("Мой долг")
                            }
                        }
                        Shareholder().tabItem {
                            VStack{
                                Image(systemName: "person.fill.badge.plus")
                                Text("Выручатель")
                            }
                        }
                        DebtorScreen().tabItem {
                            VStack{
                                Image(systemName: "person.fill.badge.minus")
                                Text("Должник")
                            }
                        }
                }
                .accentColor(Color("purple"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
