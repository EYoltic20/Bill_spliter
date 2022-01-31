//
//  SplitedBill.swift
//  bill_spliting
//
//  Created by Emilio Y Martinez on 30/01/22.
//

import SwiftUI

struct SplitedBill: View {
    //tip:Int ,split:Int,amount:Int
    let tip : Int
    let split : Int
    let amount : Int
    var body: some View {
        ZStack{
            Color("BK")
            VStack{
                if(amount != 0){
                    let get_the_amount = calculate(tip: tip, split: split, amount: amount)
                    let get_the_amount_format = String(format: "%.2f", get_the_amount)
                    Text("The total amount per each person is \(get_the_amount_format)").font(.title).bold().foregroundColor(Color("BUTTON")).padding()
                }
                else{
                    Text("You forget to insert the total amount ").font(.title).bold().foregroundColor(Color("BUTTON")).padding()
                    
                }
                
                
            }
            
            
            
        }
        
    }
    
    func calculate(tip:Int ,split:Int,amount:Int)-> Double{
        let bill_plus_tip:Double = Double(amount)+(Double(amount)*Double(tip))/100
        let bill_splited:Double = bill_plus_tip/Double(split)
        return bill_splited
    }
}

//
//struct SplitedBill_Previews: PreviewProvider {
//    static var previews: some View {
//        SplitedBill()
//    }
//}
