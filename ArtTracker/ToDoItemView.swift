//
//  ToDoItemView.swift
//  ArtTracker
//
//  Created by Gustav Solis on 2/29/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var client:String = ""
    var rate:String = ""
    var info:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(client)
                .font(.subheadline)
                Text(rate)
                .font(.subheadline)
                Text(info)
                .font(.body)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
