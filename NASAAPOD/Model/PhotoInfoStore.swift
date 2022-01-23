//
//  PhotoInfoStore.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 02/12/21.
//

import Foundation

class PhotoInfoStore: ObservableObject {
    @Published var photoInfoOfToday: PhotoInfo?
    
    private let apodURLString = "https://api.nasa.gov/planetary/apod"
    // Key generated for tiagogomespereira@gmail.com
    private let apodAPIKey: String = "m2I4N03QGRpocrwaQvGPVSzxaDdPqFGzfWDdESHQ"
    
    private var apiURL: URL {
        var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        
        urlComponents.queryItems = [
            "api_key": apodAPIKey
        ].map{ URLQueryItem(name: $0.key, value: $0.value) }
        
        return urlComponents.url!
    }
    
    private func apiURL(for date: Date) -> URL {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Y-MM-dd"
        
        let dateAsString = dateFormatter.string(from: date)
        
        var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        
        urlComponents.queryItems = [
            "api_key": apodAPIKey,
            "date": dateAsString
        ].map{ URLQueryItem(name: $0.key, value: $0.value) }
        
        return urlComponents.url!
    }
    
    func fetchPhotoInfo() async throws -> PhotoInfo {
        let (data, _) = try await URLSession.shared.data(from: apiURL)
        return try JSONDecoder().decode(PhotoInfo.self, from: data)
    }
    
    func fetchPhotoInfoOfToday() async throws -> PhotoInfo {
        if let photoInfoOfToday = photoInfoOfToday {
            return photoInfoOfToday
        } else {
            let (data, _) = try await URLSession.shared.data(from: self.apiURL)
            return try JSONDecoder().decode(PhotoInfo.self, from: data)
        }
    }
    
    func fetchPhotoInfo(for date: Date) async throws -> PhotoInfo {
        let url = self.apiURL(for: date)
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PhotoInfo.self, from: data)
    }
    
    func fetchPhotoInfoForThePastSevenDays() async throws -> [PhotoInfo] {
        var photoInfoForThePastSevenDays: [PhotoInfo] = []
        
        let calendar = Calendar.current
        let today = Date()
        
        for i in 1...7 {
            let reduction = -i
            let day = calendar.date(byAdding: .day, value: reduction, to: today)
            
            if let day = day {
                print("Fetching photo info for \(day)")
                let photoInfo = try await fetchPhotoInfo(for: day)
                photoInfoForThePastSevenDays.append(photoInfo)
            }
        }
        
        return photoInfoForThePastSevenDays
    }
}
