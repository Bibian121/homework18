//
//  SearchRespone.swift
//  15MDz
//
//  Created by Matilda Davydov on 19.10.2022.
//

import Foundation
import UIKit

struct SearchRespone: Decodable {
    var searchType: String
    var expression: String
    var results: [Track]
}

struct Track: Decodable {
    var title: String?
    var description: String
    var image: String?
}
