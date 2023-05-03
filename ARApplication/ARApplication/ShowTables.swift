//
//  ShowTables.swift
//  ARApplication
//
//  Created by Ryker Kuntz on 4/20/23.
//

import SwiftUI
import RealityKit
import ARKit
import UIKit

struct ShowTables : View {
    var body: some View {
        ARTablesContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARTablesContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        let config = ARWorldTrackingConfiguration()
       
        
        guard ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            fatalError("People occlusion is not supported on this device.")
        }
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)else{
            fatalError("Missing expected asset catalog resources.")
        }

        config.frameSemantics.insert(.personSegmentationWithDepth)
        config.planeDetection = [.vertical]
        config.detectionImages = referenceImages
        arView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
        
        return arView
        
         }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    func makeCoordinator() -> Coordinator2 {
            Coordinator2()
        }
}

class Coordinator2: NSObject, ARSessionDelegate
{
    weak var view: ARView?
    weak var myScene: Experience.Line?
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors{
            if (anchor.name == "Accessability_donut3"){
                let newAnchor = AnchorEntity(world: anchor.transform)
                let tableAnchor = try! Experience.loadTables()
                newAnchor.addChild(tableAnchor)
                view!.scene.anchors.append(tableAnchor)
                print("hey help me")
            }
        }
    }
}
/*struct ShowTables_Previews: PreviewProvider {
    static var previews: some View {
        ShowTables()
    }
}*/
