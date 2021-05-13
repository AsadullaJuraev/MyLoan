//
//  ListCell.swift
//  MyLoan
//
//  Created by Asadulla Juraev on 08.03.2021.
//

import SwiftUI
import CoreData

struct ListCell: View {
    var res: Loan
    @State var isDetail = false
    @StateObject var homeData = HomeViewModel()
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Button(action: {
                    isDetail.toggle()
                }, label: {
                    Text(res.name ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(Color("font"))
                }).sheet(isPresented: $isDetail, content: {
                    ListDetailScreen(item: res)
                        .foregroundColor(Color("font"))
                })
                Spacer()
                Text(res.sum ?? "")
                    .fontWeight(.bold)
                    .foregroundColor(Color("font"))
                
                Text(res.typecurrency ?? "").fontWeight(.light)
                
                
                if res.done {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
                
            }
        }.padding(.bottom, 3)
        
    }
}


struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(res: Loan())
    }
}
