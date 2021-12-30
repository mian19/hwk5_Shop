//
//  ShopManager.swift
//  hwk5_Shop
//
//  Created by Kyzu on 26.12.21.
//

import Foundation

class ShopManager {
    static let shared = ShopManager()
    
    var inTheShopGoods: [Goods : Int] = [:]
   lazy var inTheCart: [Goods : Int] = [:]
   lazy var allSoldGoods: [Goods : Int] = [:]
   lazy var income: Double = 0
       
}
