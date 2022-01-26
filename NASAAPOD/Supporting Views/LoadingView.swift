//
//  LoadingPhotoInfoView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct LoadingView: View {
    
    let message: String
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            
            Text(message)
            
            Spacer()
        }
    }
}

struct LoadingPhotoInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(message: "Loading")
    }
}
