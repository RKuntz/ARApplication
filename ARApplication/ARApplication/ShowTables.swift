//
//  ShowTables.swift
//  ARApplication
//
//  Created by Ryker Kuntz on 4/20/23.
//

import SwiftUI
import RealityKit

struct ShowTables : View {
    var body: some View {
        ARTablesContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARTablesContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let ballAnchor = try! Experience.loadBall()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(ballAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

/*struct ShowTables_Previews: PreviewProvider {
    static var previews: some View {
        ShowTables()
    }
}*/
