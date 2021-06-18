//
//  DealBusiness.swift
//  gameDealsApp
//
//  Created by Deyvidy Luã F.S on 17/06/21.
//

import Foundation


class DealBusiness {
    
    let SUMMARY_REQUEST_URL: String = "https://gamedeals-vapor.herokuapp.com/getAllGameDeals"
    let DETAILS_REQUEST_URL: String = "https://gamedeals-vapor.herokuapp.com/getProductDetail"
    
    enum Platforms : String {
        case xbx = "Xbox"
        //case ps = "PlayStation" - not implemented yet
    }
    
    func fetchDealsSummary (platform: String, completionHandler: @escaping ([Deal]) -> Void) {
        
        do {
            
            let jsonData = try JSONEncoder().encode(DealsSummaryRequestData(platform: platform))
            
            Service.request(url: URL(string: SUMMARY_REQUEST_URL)!, httpMethod: "GET", jsonData: jsonData) { (data, response) in
                
                do {
                    if let data = data {
                        let dealsSummary = try JSONDecoder().decode([DealSummary].self, from: data)
                        let deals: [Deal] = dealsSummary.map{
                            Deal(dealSummary: $0, productDetail: nil)
                        }
                        completionHandler(deals)
                        
                    }
                } catch let exception {
                    print("DealBusiness.fetchDealsSummary - Service Call Exception: " + exception.localizedDescription)
                }
                
            }
        } catch let exception {
            print("DealBusiness.fetchProductDetail - Method Exception: " + exception.localizedDescription)
        }
        
        
    }
    
    func fetchProductDetail (deal: Deal, completionHandler: @escaping (Deal) -> Void) {
        
        do {
            
            let jsonData = try JSONEncoder().encode(ProductDetailRequestData(productId: deal.dealSummary.productId))
            
            Service.request(url: URL(string: DETAILS_REQUEST_URL)!, httpMethod: "GET", jsonData: jsonData) { (data, response) in
                
                do {
                    if let data = data {

                        deal.productDetail = try JSONDecoder().decode(ProductDetail.self, from: data)
                         
                        completionHandler(deal)
                        
                    }
                } catch let exception {
                    print("DealBusiness.fetchProductDetail - Service Call Exception: " + exception.localizedDescription)
                }
                
            }
        } catch let exception {
            print("DealBusiness.fetchProductDetail - Method Exception: " + exception.localizedDescription)
            
        }
        
        
    }
    
    
}

struct DealsSummaryRequestData : Codable {
    var platform: String
}

struct ProductDetailRequestData : Codable {
    var productId: String
}

//TO-DO: Implement Custom Errors

//enum CustomError: Error {
//    case platformNotFound
//    case productNotFound
//    case unexpected(code: Int)
//}
//
//extension CustomError: CustomStringConvertible {
//    public var description: String {
//        switch self {
//        case .platformNotFound:
//            return "The specified platform could not be found."
//
//        case .productNotFound:
//            return "The specified product could not be found"
//        case .unexpected(_):
//            return "An unexpected error occurred."
//        }
//    }
//}
