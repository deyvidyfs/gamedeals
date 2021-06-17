//
//  Deal.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 17/06/21.
//

import Foundation

class Deal : Codable{
    
    var productId: String
    
    private(set) var dealSummary: DealSummary
    private(set) var productDetail: ProductDetail?
    
    init(productId: String, dealSummary: DealSummary, productDetail: ProductDetail?){
        self.productId = productId
        self.dealSummary = dealSummary
        self.productDetail = productDetail
    }
    
    
}

class DealSummary : Codable{
    
    var productName: String
    var platform: String
    var coverImageUrl: String
    
    private(set) var priceInfo: PriceInfo
    
    
    init(productName: String, platform:String, coverImageUrl: String, priceInfo: PriceInfo){
        self.productName = productName
        self.platform = platform
        self.coverImageUrl = coverImageUrl
        self.priceInfo = priceInfo
    }
    
    
}

class PriceInfo : Codable{
    var currency: String
    var originalPrice: Double
    var discountPrice: Double
    
    init(currency: String, originalPrice: Double, discountPrice: Double){
        self.currency = currency
        self.originalPrice = originalPrice
        self.discountPrice = discountPrice
    }
}

class ProductDetail : Codable{
    var description: String
    var publisher: String
    var mediaUrls : [String]?
    
    
}
