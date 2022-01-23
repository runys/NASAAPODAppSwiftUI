//
//  PhotosListView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct PhotosListView: View {
    
    var listOfPhotos: [PhotoInfo] = []
    
    var body: some View {
        ScrollView {
            ForEach(listOfPhotos, id: \.title) { photoInfo in
                PhotoInfoRowView(photoInfo: photoInfo)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }
}

struct PhotosListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PhotosListView(listOfPhotos: [
                testPhotoInfo1,
                testPhotoInfo2,
                testPhotoInfo3
            ])
                .navigationTitle("List of Photos")
        }
    }
}
