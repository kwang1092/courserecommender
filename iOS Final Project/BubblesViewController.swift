//
//  BubblesViewController.swift
//  iOS Final Project
//
//  Created by Robert Li on 5/3/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit
import Magnetic
import DynamicButton

class BubblesViewController: UIViewController, MagneticDelegate {
    
    var magnetic: Magnetic!
    //var magneticDelegate: MagneticDelegate? // magnetic delegate
    var allowsMultipleSelection: Bool = true // controls whether you can select multiple nodes. defaults to true
    var selectedChildren: [Node] = [] // returns selected chidren
    var instructions: UILabel!
    
    var dynamicButton: DynamicButton = DynamicButton ()
    
//    override func loadView() {
//        super.loadView()
//
//        let magneticView = MagneticView()
//        magnetic = magneticView.magnetic
//        self.view.addSubview(magneticView)
//
//        let node = Node(text: "Italy", image: UIImage(named: "italy"), color: .red, radius: 30)
//        magnetic.addChild(node)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        instructions = UILabel()
        instructions.text = "What are your interests in CS?"
        instructions.font = UIFont.boldSystemFont(ofSize: 18)
        instructions.translatesAutoresizingMaskIntoConstraints = false
        
        dynamicButton.setStyle(.checkMark, animated: true)
        dynamicButton.lineWidth           = 3
        dynamicButton.strokeColor         = .red
        dynamicButton.highlightStokeColor = .gray
        dynamicButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        dynamicButton.translatesAutoresizingMaskIntoConstraints = false
        
        let magneticView = MagneticView(frame: self.view.bounds)
        magnetic = magneticView.magnetic
        let node8 = Node(text: "Machine Learning", image: UIImage(named: "ml.png"), color: .red, radius: 60)
        let node9 = Node(text: "Graphic Design", image: UIImage(named: "graphics.jpg"), color: .green, radius: 60)
        let node10 = Node(text: "Networks", image: UIImage(named: "networks.jpg"), color: .orange, radius: 60)
        let node11 = Node(text: "Programming Langs", image: UIImage(named: "ocaml.jpg"), color: .blue, radius: 60)
        let node12 = Node(text: "Systems/Databases", image: UIImage(named: "honeypot.png"), color: .orange, radius: 60)
        let node13 = Node(text: "Theory", image: UIImage(named: "graph1.png"), color: .red, radius: 60)
        let node14 = Node(text: "Computational Science", image: UIImage(named: "comp.jpg"), color: .green, radius: 60)
        let node15 = Node(text: "Natural Language Processing", image: UIImage(named: "NLP.png"), color: .blue, radius: 60)
        
        
//        let node = Node(text: "Geography", image: UIImage(named: "Geography"), color: .red, radius: 60)
//        let node2 = Node(text: "History", image: UIImage(named: "History"), color: .green, radius: 60)
//        let node3 = Node(text: "Languages", image: UIImage(named: "Languages"), color: .blue, radius: 60)
//        let node4 = Node(text: "Physics", image: UIImage(named: "Physics"), color: .orange, radius: 60)
//        let node5 = Node(text: "Biology", image: UIImage(named: "Biology"), color: .red, radius: 60)
//        let node6 = Node(text: "Chemistry", image: UIImage(named: "Chemistry"), color: .green, radius: 60)
//        let node7 = Node(text: "Math", image: UIImage(named: "Artificial Intelligence"), color: .blue, radius: 60)
        
//        magnetic.addChild(node)
//        magnetic.addChild(node2)
//        magnetic.addChild(node3)
//        magnetic.addChild(node4)
//        magnetic.addChild(node5)
//        magnetic.addChild(node6)
//        magnetic.addChild(node7)
        magnetic.addChild(node8)
        magnetic.addChild(node9)
        magnetic.addChild(node10)
        magnetic.addChild(node11)
        magnetic.addChild(node12)
        magnetic.addChild(node13)
        magnetic.addChild(node14)
        magnetic.addChild(node15)
        
        magnetic.magneticDelegate = self
        
        view.addSubview(magneticView)
        view.addSubview(instructions)
        view.addSubview(dynamicButton)
        
        setUpConstraints ()
        
        

        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints () {
        NSLayoutConstraint.activate([
            instructions.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            instructions.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            instructions.heightAnchor.constraint(equalToConstant: 44)
            ])
        NSLayoutConstraint.activate([
            dynamicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dynamicButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            dynamicButton.heightAnchor.constraint(equalToConstant:44)
            ])
    }
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        selectedChildren.append(node)
        print(selectedChildren)
    }
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        //remove from array if exists
        let indexOfNode = selectedChildren.index(of: node)!
        selectedChildren.remove(at: indexOfNode)
        print (node.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func doneButtonPressed (sender:UIButton) {
        let modalVC = BubblesViewController2()
        modalVC.nodesFromB1 = selectedChildren
        modalVC.modalTransitionStyle = .crossDissolve
        //modalVC.labelTitle = blueButton.title(for: .normal)
        //modalVC.delegate = self
        present(modalVC, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
