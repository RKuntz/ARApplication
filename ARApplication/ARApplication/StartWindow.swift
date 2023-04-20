//
//  StartWindow.swift
//  ARApplication
//
//  Created by Ryker Kuntz on 4/20/23.
//

import SwiftUI

struct StartWindow: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("First, are you comfortable waiting in a line?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                HStack{
                    NavigationLink(destination:ContentView()){
                        Text("Yes")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            
                    }
                    .padding(.trailing, 30.0)
                    NavigationLink(destination:ShowTables()){
                        Text("No")
                            .font(.title)
                            .multilineTextAlignment(.trailing)
                            
                    }
                    .padding(.leading, 30.0)
                    
                }
                .padding(.top)
                
            }
            
        }
            
            
    }
}

struct StartWindow_Previews: PreviewProvider {
    static var previews: some View {
        StartWindow()
    }
}
