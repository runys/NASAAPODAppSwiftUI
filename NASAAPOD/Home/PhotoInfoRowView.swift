//
//  PhotoInfoRowView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct PhotoInfoRowView: View {
    var photoInfo: PhotoInfo
    
    var formattedDate: String {
        // TODO: Actually format the date
        return photoInfo.date
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(photoInfo.title)
                .font(.headline)
            HStack {
                Text("By \(photoInfo.copyright ?? "-")")
                Spacer()
                Text(formattedDate)
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
    }
}

struct PhotoInfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoInfoRowView(photoInfo: testPhotoInfo1)
    }
}
