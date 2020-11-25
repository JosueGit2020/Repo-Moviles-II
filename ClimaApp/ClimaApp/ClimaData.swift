//
//  ClimaData.swift
//  Clima
//
//  Created by Mac6 on 23/11/20.
//  Copyright © 2020 Mac6. All rights reserved.
//

import Foundation
struct ClimaData: Codable{
    let name: String
    let cod: Int
    let main: Main
    let weather: [weather]
    let coord: Coord
}
struct Main: Codable{
    let temp: Double
    let humidity: Int
}
struct weather: Codable{
    let description: String
    let id: Int
}
struct Coord: Codable{
    let lat: Double
    let lon: Double
}
