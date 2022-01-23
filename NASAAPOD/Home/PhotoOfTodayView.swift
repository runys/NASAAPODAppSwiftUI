//
//  PhotoOfTodayView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct PhotoOfTodayView: View {
    @EnvironmentObject var photoInfoStore: PhotoInfoStore
    
    @State var photoInfoOfToday: PhotoInfo?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Photo of Today")
                .font(.title)
                .fontWeight(.bold)
            
            if let photoInfo = photoInfoOfToday {
                VStack(alignment: .center, spacing: 8.0) {
                    AsyncImage(url: photoInfo.url) { image in
                        image
                            .resizable()
                            .aspectRatio(16.0/9.0, contentMode: .fit)
                            .cornerRadius(10)
                    } placeholder: {
                        LoadingPhotoInfoView()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(16.0/9.0, contentMode: .fit)
                    }
                    
                    Text(photoInfo.title)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(16.0/9.0, contentMode: .fit)
                    .foregroundColor(.gray)
                
                Text("Placeholder")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
        .task {
            if photoInfoOfToday == nil {
                await fetchPhotoInfo()
            }
        }
    }
    
    func fetchPhotoInfo() async {
        do {
            photoInfoOfToday = try await photoInfoStore.fetchPhotoInfo()
        } catch {
            print("Failed to load photo: \(error.localizedDescription)")
        }
    }
}

struct PhotoOfTodayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoOfTodayView(photoInfoOfToday: testPhotoInfo1)
        }
    }
}
