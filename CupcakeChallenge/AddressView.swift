// MARK: AddressView.swift

import SwiftUI



struct AddressView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var order: Order
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Form {
            Section(header : Text("address")) {
                TextField("Name :" ,
                          text : $order.data.name)
                TextField("Street name and house number :" ,
                          text : $order.data.streetAddress)
                TextField("City :" ,
                          text : $order.data.city)
                TextField("ZIP code :" ,
                          text : $order.data.zipCode)
            }
            Section(header : Text("order details")) {
                NavigationLink("Checkout" ,
                               destination : CheckoutView(order : order))
            }
            .disabled(order.data.hasValidAddress == false)
        }
        .navigationBarTitle(Text("Address") , displayMode : .inline)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct AddressView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddressView(order: Order())
    }
}
