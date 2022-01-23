//
//  PhotosOfTheWeekListView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 17/01/22.
//

import SwiftUI

struct PhotosOfTheWeekListView: View {
    @EnvironmentObject var photoInfoStore: PhotoInfoStore
    
    @State var photoInfoForTheWeek: [PhotoInfo] = [
        testPhotoInfo1,
        testPhotoInfo2,
        testPhotoInfo3
    ]
    
    var body: some View {
        VStack {
            
            if photoInfoForTheWeek.isEmpty {
                LoadingPhotoInfoView()
            } else {
                ForEach(photoInfoForTheWeek, id: \.title) { photoInfo in
                    PhotoInfoRowView(photoInfo: photoInfo)
                        .padding()
                }
            }
        }
        .task {
            if photoInfoForTheWeek.isEmpty {
                await self.fetchPhotoInfo()
            }
        }
    }
    
    func fetchPhotoInfo() async {
        do {
            self.photoInfoForTheWeek = try await photoInfoStore.fetchPhotoInfoForThePastSevenDays()
        } catch {
            print("Failed to load photos of the previous week: \(error.localizedDescription)")
        }
        
    }
}

struct PhotosOfTheWeekListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosOfTheWeekListView()
    }
}
