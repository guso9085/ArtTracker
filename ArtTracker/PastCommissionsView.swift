//
//  PastCommissionsView.swift
//  ArtTracker
//
//  Created by Gustav Solis on 2/29/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import SwiftUI

struct PastCommissionsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: DoneItem.getAllDoneItems()) var doneItems:FetchedResults<DoneItem>
    
    @State private var commissionTitle = ""
    @State private var client = ""
    @State private var rate = ""
    @State private var info = ""

    
    var body: some View {
        List {
            Section(header: (Text(""))) {
                ForEach(self.doneItems) {doneItem in
                    DoneItemView(title: doneItem.title!, client: doneItem.client!, finalRate: doneItem.finalRate!, info: doneItem.info!, finishedAt: "\(doneItem.finishedAt!)", notes: doneItem.notes!, hours: doneItem.hours!)
                }.onDelete {indexSet in
                    let deleteItem = self.doneItems[indexSet.first!]
                    self.managedObjectContext.delete(deleteItem)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                }
            }
        }.navigationBarTitle(Text("Past Commissions"))
           
    
    }
}

struct PastCommissionsView_Previews: PreviewProvider {
    static var previews: some View {
        PastCommissionsView()
    }
}
