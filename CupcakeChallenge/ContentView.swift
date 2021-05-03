// MARK: ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var order: Order = Order()
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header : Text("cake type")) {
                    Picker("Flavor :" ,
                           selection: $order.data.cupcakeTypeIndex) {
                        ForEach(0..<Order.Data.cupcakeTypes.count) {
                            Text(Order.Data.cupcakeTypes[$0])
                        }
                    }
                }
                Section(header : Text("order quantity")) {
                    Stepper("\(order.data.orderQuantity) cupcakes" ,
                            value : $order.data.orderQuantity ,
                            in : 3...5)
                }
                Section(header : Text("extras")) {
                    Toggle("Show cake toppings :" ,
                           isOn : $order.data.isShowingCakeToppings)
                    if order.data.isShowingCakeToppings == true {
                        Toggle("Frosting :" ,
                               isOn : $order.data.hasFrosting)
                        Toggle("Sprinkles :" ,
                               isOn : $order.data.hasSprinkles)
                    }
                }
                .animation(.default)
                Section(header : Text("delivery details")) {
                    NavigationLink("Address" ,
                                   destination : AddressView(order : order))
                }
            }
            .navigationBarTitle(Text("Cupcake Challenge"))
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
