//
//  DataModel.swift
//  ModelDataSwiftUI
//
//  Created by Muhammad Fikri Hadian on 11/08/22.
//  Copyright © 2022 Banyu Center. All rights reserved.
//

import Foundation

struct DataModel : Identifiable {
    let id: Int
    let namaProduk: String
    let fotoProduk: String
    let hargaProduk: Int
    let lokasi: String
    let ratingCount: Int
    let jumlahRating: Int
    
    init(id: Int, namaproduk: String, fotoproduk: String, hargaproduk: Int, lokasi: String, ratingcount: Int, jumlahrating: Int) {
        
        self.id = id
        self.namaProduk = namaproduk
        self.fotoProduk  = fotoproduk
        self.hargaProduk = hargaproduk
        self.lokasi = lokasi
        self.ratingCount = ratingcount
        self.jumlahRating = jumlahrating
    }
}
