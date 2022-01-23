//
//  LoadingPhotoInfoView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct LoadingPhotoInfoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            
            Text("Loading photo")
            
            Spacer()
        }
    }
}

struct LoadingPhotoInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPhotoInfoView()
    }
}
