//
//  HomeView.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 03/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var photoInfoStore: PhotoInfoStore
    
    var body: some View {
        ScrollView {
            VStack {
                PhotoOfTodayView()
                
                Divider()
                
                PhotosOfTheWeekListView()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
