//
//  PhotoInfo.swift
//  NASAAPOD
//
//  Created by Tiago Pereira on 02/12/21.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
        case date
    }
}

extension PhotoInfo {
    var dateObject: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        
        return dateFormatter.date(from: self.date)!
    }
}
