//
//  CryptodATA.swift
//  ByteCoin
//
//  Created by Seun Ogundipe on 27/03/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CryptodATA: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
