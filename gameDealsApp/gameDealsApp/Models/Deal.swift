//
//  Deal.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 17/06/21.
//

import Foundation

class Deal{
    
    var dealSummary: DealSummary
    var productDetail: ProductDetail?
    
    init(dealSummary: DealSummary, productDetail: ProductDetail?){
        self.dealSummary = dealSummary
        self.productDetail = productDetail
    }
    
}

class DealSummary : Codable{
    
    var productId: String
    var productName: String
    var platform: String
    var coverImageUrl: String
    
    private(set) var priceInfo: PriceInfo
    
    enum CodingKeys: String, CodingKey {
        case productId
        case productName = "product_title"
        case platform
        case coverImageUrl = "gameCoverURL"
        case priceInfo
    }
    
}

class PriceInfo : Codable{
    var currency: String
    var originalPrice: Double
    var discountPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case currency = "currencyCode"
        case originalPrice = "orginalMSRP"
        case discountPrice
    }
    
}

class ProductDetail: Codable{
    var description: String
    var type: String
    var publisher: String
    var storeUrl: String
    var compatibleConsoles: [String]
    var relatedMedia: [Media]?
    
    //TO-DO: Implement Custom Decoder for API
}

class Media : Codable{
    var mediaUrl: String
    var type: String
}
