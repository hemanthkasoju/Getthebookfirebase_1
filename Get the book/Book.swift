//
//  Book.swift
//  Get the book
//
//  Created by Hemanth Kasoju on 2018-12-05.
//  Copyright © 2018 Hemanth Kasoju. All rights reserved.
//

import Foundation
class Book {
    
    var title : String?
    var author : String?
    var publisher : String?
    var genre : String?
    var language : String?
    var url : String?

    
    init(title : String?, author : String?, publisher : String?, genre : String?, language : String?, url : String?){
        
        self.title = title
        self.author = author
        self.publisher = publisher
        self.genre = genre
        self.language = language
        self.url = url
    }
    
}
