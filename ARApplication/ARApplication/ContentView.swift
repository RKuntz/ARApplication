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
        config.planeDetection = [.horizontal]
        config.detectionImages = referenceImages
        arView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    func makeCoordinator() -> Coordinator {
            Coordinator()
        }

}
class Coordinator: NSObject, ARSessionDelegate
{
    weak var view: ARView?
    weak var myScene: Experience.Line?
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        
        anchors.compactMap { $0 as? ARImageAnchor }.forEach{
            for anchor in anchors{
                if (anchor.name == "Accessability_donut3"){
                    
                    
                    let newAnchor = AnchorEntity(.image(group: "AR Resources", name: "Accessability_donut3"))
                    
                    newAnchor.transform.matrix = $0.transform
                    
                    print(newAnchor.orientation)
                    print(anchor.transform)
                    //newAnchor.transform.rotation = anchor.transform
                    
                    let lineAnchor = try! Experience.loadLine()
                    newAnchor.addChild(lineAnchor)
                    view!.scene.anchors.append(lineAnchor)
                    print("hey help me")
                }
            }
        }
    }
}
/*#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif*/
