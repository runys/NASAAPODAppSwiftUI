//
//  PhotosOfTheWeekListView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 17/01/22.
//

import SwiftUI

struct PhotosOfTheWeekListView: View {
    @EnvironmentObject var photoInfoStore: PhotoInfoStore
    
    var dates: [Date] {
        return photoInfoStore.photosOfThePastWeek.keys.map { $0 }.sorted { $0 > $1 }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if photoInfoStore.photosOfThePastWeek.isEmpty {
                // Loading State
                LoadingPhotoInfoView(message: "Loading photos of the week")
            } else {
                // Info Loaded Successfully
                ForEach(dates, id: \.self) { date in
                    if let photoInfo = photoInfoStore.photosOfThePastWeek[date],
                       let photo = photoInfo {
                        PhotoInfoRowView(photoInfo: photo)
                            .padding()
                            .background(Color(uiColor: UIColor.systemGray6))
                            .cornerRadius(10)
                    } else {
                        NoInfoRowView(date: date)
                            .padding()
                            .background(Color(uiColor: UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
    
}

struct PhotosOfTheWeekListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosOfTheWeekListView()
    }
}
