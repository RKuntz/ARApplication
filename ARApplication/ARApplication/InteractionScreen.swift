//
//  InteractionScreen.swift
//  ARApplication
//
//  Created by Ryker Kuntz on 5/3/23.
//

import SwiftUI
import UIKit
import NearbyInteraction
import MultipeerConnectivity

struct InteractionScreen: View {
    var body: some View {
        storyboardview().edgesIgnoringSafeArea(.all)
    }
}

struct storyboardview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "NearbyInteraction")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

/*struct InteractionScreen_Previews: PreviewProvider {
    static var previews: some View {
        InteractionScreen()
    }
}*/
