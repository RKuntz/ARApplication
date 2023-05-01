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
                Text("Welcome to Guru Donuts")
                    .font(.system(size: 48, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50 )
                    .padding(.bottom, 30 )
                
                Text("First, are you comfortable waiting in a line?")
                    .font(.system(size: 24, weight: .medium))
                    .multilineTextAlignment(.center)
                
                HStack{
                    NavigationLink(destination:ContentView()){
                        Text("Yes")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 160, height: 60)
                            .background(Color.orange)
                            .cornerRadius(30)
                    }
                    .padding(.trailing, 30.0)
                    NavigationLink(destination:ShowTables()){
                        Text("No")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 160, height: 60)
                            .background(Color.orange)
                            .cornerRadius(30)
                            
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
