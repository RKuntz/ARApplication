//
//  ContentView.swift
//  ARApplication
//
//  Created by Ryker Kuntz on 4/20/23.
//

import SwiftUI
import RealityKit
import ARKit
import UIKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        // Load the "Box" scene from the "Experience" Reality File
        let lineAnchor = try! Experience.loadLine()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(lineAnchor)
        
        guard ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            fatalError("People occlusion is not supported on this device.")
        }
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)else{
            fatalError("Missing expected asset catalog resources.")
        }
        
        
        
        config.frameSemantics.insert(.personSegmentationWithDepth)
        //config.planeDetection = [.horizontal]
        config.detectionImages = referenceImages
        arView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

/*#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif*/
