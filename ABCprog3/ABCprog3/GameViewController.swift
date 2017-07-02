//
//  GameViewController.swift
//  ABCprog3
//
//  Created by Lawrence Herman on 6/26/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        
        let radians = degreesToRadians(degrees: -10.0)
        
        let eulerVector = SCNVector3Make(radians, 0, 0)
        cameraNode.eulerAngles = eulerVector
        
        // place the camera
        cameraNode.position = SCNVector3(x: 50, y: 5, z: 100)
        
//
        
        let x = cameraNode.rotation
        let y = cameraNode.orientation
        let z = cameraNode.eulerAngles
//        let i = cameraNode.position
//        let j = cameraNode.transform
//        let k = cameraNode.scale
        
        print("rotation \(x) \n\n")
        print("orientation \(y) \n\n")
        print("eulerangle \(z) \n\n")
//        print("position \(i) \n\n")
//        print("transform \(j) \n\n")
//        print("scale \(k) \n\n")
        
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 30, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let directionalLight = SCNNode()
        directionalLight.light = SCNLight()
        directionalLight.light!.type = .directional
        directionalLight.position = SCNVector3(x: 9, y: 10, z: 100)
        scene.rootNode.addChildNode(directionalLight)
        
        
        let floor = SCNFloor()
        
        
        
        let grass1 = SCNMaterial()
        grass1.diffuse.contents = UIImage(named: "grass1")
        
        floor.reflectivity = 0
        
        
        floor.firstMaterial = grass1
        
        
        
        let floorNode = SCNNode(geometry: floor)
        
        scene.rootNode.addChildNode(floorNode)
        
        
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
//        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        
//        scene.background.contents = UIImage(named: "playground2")
        
        

        let letterA = SCNText(string: "A", extrusionDepth: 2.0)
        letterA.font = UIFont.init(name: "Ariel", size: 12.0)
        let letterANode = SCNNode(geometry: letterA)
        letterANode.position = SCNVector3(x: 0, y: -3, z: 20)
        scene.rootNode.addChildNode(letterANode)
        
        let letterB = SCNText(string: "B", extrusionDepth: 2.0)
        letterB.font = UIFont.init(name: "Ariel", size: 12.0)
        letterB.flatness = 0
        let letterBNode = SCNNode(geometry: letterB)
        letterBNode.position = SCNVector3(x: 10, y: -3, z: 20)
        scene.rootNode.addChildNode(letterBNode)
        
        let letterC = SCNText(string: "C", extrusionDepth: 2.0)
        letterC.font = UIFont.init(name: "Ariel", size: 12.0)
        letterC.flatness = 0
        let letterCNode = SCNNode(geometry: letterC)
        letterCNode.position = SCNVector3(x: 20, y: -3, z: 20)
        scene.rootNode.addChildNode(letterCNode)

      
      
        
        
        
        let runForward = SCNAction.moveBy(x: 0.0, y: 0.0, z: 90.0, duration: 2.0)
        let runBackward = SCNAction.moveBy(x: 0.0, y: 0.0, z: -90.0, duration: 2.0)
        let runRight = SCNAction.moveBy(x: 100.00, y: 0, z: 0, duration: 1.0)
        
        let actionArray = [runForward, runRight, runBackward]
        
        let sequence = SCNAction.sequence(actionArray)
        
        
        
        // animate the 3d object
//        letterANode.runAction(runBackward)
        
        
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        
        
        
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = false
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.blue
        
        
        
        letterANode.runAction(sequence)
//        letterANode.runAction(runForward)
//        letterANode.runAction(runBackward)
        
        
        // add a tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        scnView.addGestureRecognizer(tapGesture)
    }
    
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / 180
    }
    
    func radiansToDegress(radians: Float) -> Float {
        return radians * 180 / Float.pi
    }
    
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
