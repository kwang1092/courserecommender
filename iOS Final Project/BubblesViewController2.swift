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

class BubblesViewController2: UIViewController, MagneticDelegate {
    
    var magnetic: Magnetic!
    //var magneticDelegate: MagneticDelegate? // magnetic delegate
    var allowsMultipleSelection: Bool = true // controls whether you can select multiple nodes. defaults to true
    var selectedChildren: [Node] = [] // returns selected chidren
    var instructions: UILabel!
    var nodesFromB1: [Node] = []
    
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
        instructions.text = "What are your interests outside of CS?"
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
        
        
        let node = Node(text: "Geography", image: UIImage(named: "globe.png"), color: .red, radius: 50)
        let node2 = Node(text: "History", image: UIImage(named: "history.jpg"), color: .green, radius: 50)
        let node3 = Node(text: "Languages", image: UIImage(named: "bonjour.jpg"), color: .blue, radius: 50)
        let node4 = Node(text: "Physics", image: UIImage(named: "physics.jpg"), color: .orange, radius: 50)
        let node5 = Node(text: "Chem/Bio", image: UIImage(named: "dna.jpg"), color: .red, radius: 50)
        let node6 = Node(text: "CogSci/Psych", image: UIImage(named: "brain.jpg"), color: .green, radius: 50)
        let node7 = Node(text: "Linguistics", image: UIImage(named: "lang.jpg"), color: .blue, radius: 50)
        let node8 = Node(text: "Economics", image: UIImage(named: "econ.jpg"), color: .red, radius: 50)
        let node9 = Node(text: "Government", image: UIImage(named: "govt.png"), color: .green, radius: 50)
        let node10 = Node(text: "Math", image: UIImage(named: "math.jpg"), color: .blue, radius: 50)
        let node11 = Node(text: "Arts", image: UIImage(named: "arts.jpg"), color: .orange, radius: 50)
        let node12 = Node(text: "ECE", image: UIImage(named: "mips.png"), color: .orange, radius: 50)
        
        magnetic.addChild(node)
        magnetic.addChild(node2)
        magnetic.addChild(node3)
        magnetic.addChild(node4)
        magnetic.addChild(node5)
        magnetic.addChild(node6)
        magnetic.addChild(node7)
        magnetic.addChild(node8)
        magnetic.addChild(node9)
        magnetic.addChild(node10)
        magnetic.addChild(node11)
        magnetic.addChild(node12)
        
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
        //print(selectedChildren)
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        //remove from array if exists
        let indexOfNode = selectedChildren.index(of: node)!
        selectedChildren.remove(at: indexOfNode)
        //print (node.text!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func doneButtonPressed (sender:UIButton) {
        let vc = ViewController()
        let navVC = UINavigationController(rootViewController: vc)
        vc.nodesFromB1 = nodesFromB1
        vc.nodesFromB2 = selectedChildren
        navVC.modalTransitionStyle = .crossDissolve
        present(navVC, animated: true, completion: nil)
        
        //navigationController?.pushViewController(navVC, animated: true)
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

