//
//  DoneItemView.swift
//  ArtTracker
//
//  Created by Gustav Solis on 4/4/20.
//  Copyright © 2020 Gustav Solis. All rights reserved.
//

import SwiftUI

struct DoneItemView: View {
    var title:String = ""
    var client:String = ""
    var finalRate:String = ""
    var info:String = ""
    var finishedAt:String = ""
    var notes:String = ""
    var hours:String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(client)
                .font(.subheadline)
                Text(finalRate)
                .font(.subheadline)
                Text(hours)
                .font(.subheadline)
                Text(info)
                .font(.body)
                Text(notes)
                .font(.body)
                Text(finishedAt)
                .font(.caption)
            }
        }
    }
}

struct DoneItemView_Previews: PreviewProvider {
    static var previews: some View {
        DoneItemView()
    }
}
