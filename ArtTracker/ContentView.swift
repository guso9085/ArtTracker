//
//  ContentView.swift
//  ArtTracker
//
//  Created by Gustav Solis on 2/29/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var commissionTitle = ""
    @State private var client = ""
    @State private var rate = ""
    @State private var info = ""

    
    var body: some View {
        NavigationView {
            List {
                Section(header: (Text("New Commission"))) {
                    VStack{
                        TextField("Commission Title", text: self.$commissionTitle)
                        TextField("Client", text: self.$client)
                        TextField("Rate", text: self.$rate)
                        HStack {
                            TextField("Info", text: self.$info)
                            Button(action: {
                                let toDoItem = ToDoItem(context: self.managedObjectContext)
                                toDoItem.title = self.commissionTitle
                                toDoItem.client = self.client
                                toDoItem.rate = self.rate
                                toDoItem.info = self.info
                                
                            
                                toDoItem.createdAt = Date()
                                
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                                
                                self.commissionTitle = ""
                                self.client = ""
                                self.rate = ""
                                self.info = ""
                                
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                            
                            
                        }
                    }
                    
                }.font(.headline)
                Section(header: (Text("Commissions"))) {
                    ForEach(self.toDoItems) {todoItem in
                        ToDoItemView(title: todoItem.title!, client: todoItem.client!, rate: todoItem.rate!, info: todoItem.info!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
        }.navigationBarTitle(Text("Commissions"))
            .navigationBarItems(trailing: EditButton())
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
