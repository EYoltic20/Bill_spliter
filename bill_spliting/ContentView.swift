//
//  ContentView.swift
//  bill_spliting
//
//  Created by Emilio Y Martinez on 26/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var total_amaunt = ""
    @State var tip = 5
    @State var split_persons=2
    @State var isActive = false
    var body: some View {
        VStack(alignment:.center){
            Spacer()
            Text("Enter bill").padding().font(.title)
            
            TextField("Amount",text:$total_amaunt).padding().frame(width:300).font(.title2)
            
            VStack(alignment:.leading){
                Text("Select a tip ").padding(.all,20).foregroundColor(.gray).font(.title2)
                
                HStack{
                    Spacer()
                    
                    Button(action:{tip=5}, label: {
                        Text("5%").foregroundColor((tip==5) ? .white:Color("BUTTON")).font(.title3)
                        
                    }).frame(width:50,height:40).background(Color((tip==5) ? "BUTTON":"BK")).clipShape(RoundedRectangle(cornerRadius: 4))
                    Spacer()
                    
                    Button(action:{tip=10}, label: {
                        Text("10%").foregroundColor((tip==10) ? .white:Color("BUTTON")).font(.title3)
                        
                    }).frame(width:50,height:40).background(Color((tip==10) ? "BUTTON":"BK")).clipShape(RoundedRectangle(cornerRadius: 4))
                    Spacer()
                    
                    Button(action:{tip=15}, label: {
                        Text("15%").foregroundColor((tip==15) ? .white:Color("BUTTON")).font(.title3)
                        
                    }).frame(width:50,height:40).background(Color((tip==15) ? "BUTTON":"BK")).clipShape(RoundedRectangle(cornerRadius: 4))
                    Spacer()
                }.padding()
                Text("Split amount").padding(.all,20).foregroundColor(.gray).font(.title2)
                HStack{
                    Spacer()
                    Text("\(split_persons)").font(.title).bold().foregroundColor(Color("BUTTON"))
                    Spacer()
                    Button(action:{split_persons+=1},label: {
                        Image(systemName:"plus").foregroundColor(Color.white)
                    }).frame(width:50,height:40).background(Color("BUTTON"))
                    Button(action:{
                        if(split_persons>2){
                            split_persons-=1
                        }
                        else{
                            split_persons=0
                        }
                        
                    },label: {
                        Image(systemName:"minus").foregroundColor(Color.white)
                    }).frame(width:50,height:40).background(Color("BUTTON"))
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action:{isActive.toggle()},label:{
                        Text("Calculate").font(.title).foregroundColor(.white)
                    }).frame(width:150).padding().background(Color("BUTTON"))
                    Spacer()
                }
                Spacer()
            }.frame(maxWidth:.infinity,maxHeight: .infinity)
                .background(Color("BK"))
        }.sheet(isPresented: $isActive){
            SplitedBill(tip:tip ,split:split_persons,amount:Int(total_amaunt) ?? 0)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

