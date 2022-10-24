//
//  Constants.swift
//  15MDz
//
//  Created by Matilda Davydov on 16.07.2022.
//

import UIKit

enum Constants {
    enum Colors {
        static var blackColor: UIColor {
            UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        static var grayColor: UIColor {
            UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        }
    }
    
    enum Fonts {
        static var ui14Regular: UIFont? {
            UIFont(name: "Inter-Regular", size: 14)
        }
        static var semiBold: UIFont? {
            UIFont(name: "Inter-SemiBold", size: 16)
        }
    }
    
    enum Image {
        static var imageBlock = String()
    }
    
    enum Text {
        static var header: String {
            let header = "Header"
            return header
        }
        static var text: String {
            let text = "He'll want to use your yacht, and I don't want this thing smelling like fish."
            return text
        }
        static var time: String {
            let time = "8m ago"
            return time
        }
        
    }
    
}
