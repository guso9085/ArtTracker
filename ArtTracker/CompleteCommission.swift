//
//  CompleteCommission.swift
//  ArtTracker
//
//  Created by Gustav Solis on 4/3/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import SwiftUI

struct CompleteCommission: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: DoneItem.getAllDoneItems()) var DoneItems:FetchedResults<DoneItem>
    //@State private var commissionTitle = ""
    @State private var hours = ""
    @State private var finalRate = ""
    @State private var notes = ""
    
    var title:String = ""
    var client:String = ""
    var rate:String = ""
    var info:String = ""
    
    
    var body: some View {
        List {
            HStack {
                VStack(alignment: .leading){
                    Text(title)
                        .font(.headline)
                    Text("Client: \(client)")
                    .font(.subheadline)
                    Text("Rate: \(rate)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    Text("Info: \(info)")
                    .font(.body)
                }
            }
            Section(header: (Text("Final Commission Details"))) {
                VStack{
                    //TextField("Commission Title", text: self.$commissionTitle)
                    
                    TextField("Hours Spent", text: self.$hours)
                    TextField("Final Rate", text: self.$finalRate)
                    TextField("Final Notes", text: self.$notes)
                    Button(action: {
                        
                        let doneItem = DoneItem(context: self.managedObjectContext)
                        doneItem.title = self.title
                        doneItem.client = self.client
                        doneItem.finalRate = self.finalRate
                        doneItem.info = self.info
                        doneItem.hours = self.hours
                        doneItem.notes = self.notes
                        doneItem.finishedAt = Date()
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                        
                        self.hours = ""
                        self.finalRate = ""
                        self.notes = ""
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle")
                                .font(.title)
                            Text("Complete")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(40)
                    }
                    
                }
                
            }.font(.headline)
        }.navigationBarTitle(Text("Complete Commission"))
        
    }
}

struct CompleteCommission_Previews: PreviewProvider {
    static var previews: some View {
        CompleteCommission()
    }
}
