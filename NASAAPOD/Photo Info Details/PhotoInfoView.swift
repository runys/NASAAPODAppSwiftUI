//
//  PhotoInfoView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct PhotoInfoView: View {
    let photoInfo: PhotoInfo
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            Text(photoInfo.title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            if let copyright = photoInfo.copyright {
                Text("By \(copyright)")
                    .font(.caption)
            }
            
            AsyncImage(url: photoInfo.url) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(10)
            } placeholder: {
                Color.gray
                    .cornerRadius(10)
                    .aspectRatio(1, contentMode: .fill)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(photoInfo.description)
                    .font(.body)
                
                HStack {
                    Spacer()
                    
                    Text("\(photoInfo.date)")
                }
                .font(.caption)
            }
            
        }
    }
}

struct PhotoInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoInfoView(photoInfo: testPhotoInfo1)
    }
}
