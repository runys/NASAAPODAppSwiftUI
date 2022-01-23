//
//  ContentView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 02/12/21.
//

import SwiftUI

struct ContentView: View {
    
    let photoInfoStore = PhotoInfoStore()
    
    @State var photoInfo: PhotoInfo?
    @State var error: Error?
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let photoInfo = photoInfo {
                    PhotoInfoView(photoInfo: photoInfo)
                        .padding()
                } else {
                    LoadingPhotoInfoView()
                }
            }
            .navigationTitle("NASA APOD")
        }
        .task {
            if self.photoInfo == nil {
                await fetchPhotoInfo()
            }
        }
        
    }
    
    func fetchPhotoInfo() async {
        do {
            self.photoInfo = try await photoInfoStore.fetchPhotoInfo()
        } catch {
            self.error = error
            print("Failed to load photo: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(photoInfo: testPhotoInfo3, error: nil)
        }
    }
}
