//
//  CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by Seun Ogundipe on 27/03/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didGetApi(price: Double)
    func onFetchApiError()
}
