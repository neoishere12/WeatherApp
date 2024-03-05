//
//  post.swift
//  WeatherApp
//
//  Created by Nitin Singh Manhas on 04/03/24.
//


import Foundation

struct Posts: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
