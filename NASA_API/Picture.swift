//
//  Picture.swift
//  NASA_API
//
//  Created by Héctor Pablo González on 20/08/25.
//

import Foundation

struct Picture : Identifiable, Codable, Hashable {
    var id = UUID()
    var copyright : String?
    //var date : String
    var explanation : String
    var title : String
    var url : String?
    
    enum CodingKeys : String, CodingKey {
        //case copyright
        //case date
        case explanation
        case title
        case url
    }
}
