//
//  ModelPost.swift
//  Novigation
//
//  Created by Александр Хмыров on 14.06.2022.
//

import UIKit


protocol ModelPost {
    var author: String { get set }
    var image: String  { get set }
    var description: String  { get set }
    var likes: Int  { get set }
    var views: Int  { get set }
}

struct Post1: ModelPost {
var author: String = "AleksandrSiberia"

var image: String = "sun"

var description: String = "ddddddddd"

var likes: Int = 132_044

var views: Int = 345_505
}
var post1 = Post1()


struct Post2: ModelPost {
    var author: String = "AleksandrSiberia"

    var image: String = ""

    var description: String = "2"

    var likes: Int = 150_310

    var views: Int = 590_143
}
var post2 = Post2()

struct Post3: ModelPost {
    var author: String = ""

    var image: String = ""

    var description: String = ""

    var likes: Int = 385_000

    var views: Int = 1_244_344
}
var post3 = Post3()

struct Post4: ModelPost {
    var author: String = ""

    var image: String = ""

    var description: String = ""

    var likes: Int = 233_578

    var views: Int = 987_433
}
var post4 = Post4()


var arrayModelPost: [ModelPost] = [post1, post2, post3, post4]




