// MARK: CheckoutView.swift

import SwiftUI



struct CheckoutView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var order: Order
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            VStack {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth : .infinity)
                    .padding()
                Text("Your total order is $ \(order.data.totalPrice , specifier : "%g")")
                Button("Place Order") {
                    
                }
                .padding()
            }
            .navigationBarTitle(Text("Checkout") ,
                                displayMode : .inline)
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct CheckoutView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CheckoutView(order : Order())
    }
}
