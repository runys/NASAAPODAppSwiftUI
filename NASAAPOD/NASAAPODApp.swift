//
//  NASAAPODApp.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 02/12/21.
//

import SwiftUI

@main
struct NASAAPODApp: App {
    
    let photoInfoStore = PhotoInfoStore()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(photoInfoStore)
        }
    }
}
