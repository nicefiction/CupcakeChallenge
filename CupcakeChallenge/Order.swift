// MARK: Order.swift

import SwiftUI



class Order: ObservableObject {
    
     // ///////////////////
    //  MARK: NESTED TYPES
    
    struct Data: Codable {
        
        static let cupcakeTypes: [String] = [
            "Apple cinnamon" , "Chocolate" , "Vanilla" , "Pear ginger"
        ]
        
        var cupcakeTypeIndex: Int = 0
        var orderQuantity: Int = 3
        
        
        var isShowingCakeToppings: Bool = false {
            didSet {
                if isShowingCakeToppings == false {
                    hasSprinkles = false
                    hasFrosting = false
                }
            }
        }
        
        
        var hasFrosting: Bool = false
        var hasSprinkles: Bool = false
        
        var name: String = ""
        var streetAddress: String = ""
        var city: String = "Oz"
        var zipCode: String = ""
        
        
        var hasValidAddress: Bool {
            
            if name.trimmingCharacters(in : .whitespaces).isEmpty
                || streetAddress.trimmingCharacters(in : .whitespaces).isEmpty
                || city.trimmingCharacters(in : .whitespaces).isEmpty
                || zipCode.trimmingCharacters(in: .whitespaces).isEmpty {
                return false
                
            } else {
                return true
            }
        }
        
        
        var basePrice: Double = 2.22
        
        var totalPrice: Double {
            
            var calculatedPrice: Double = basePrice * Double(orderQuantity)
            calculatedPrice += hasSprinkles ? Double(orderQuantity / 2) : 0.00
            calculatedPrice += hasFrosting ? Double(orderQuantity) : 0.00
            
            return calculatedPrice
        }
    }
    
    
    @Published var data: Data = Data()
}
