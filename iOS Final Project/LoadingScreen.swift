//
//  LoadingScreen.swift
//  iOS Final Project
//
//  Created by Robert Li on 4/28/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingScreen: UIViewController {
    
    var courseRecommender: UILabel!
    var bearLogo: UIImageView!
    var loadingIcon: NVActivityIndicatorView!
    var bearLogo2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  UIColor(red:0.65, green:0.66, blue:0.67, alpha:1.0)
    
        
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "Background-2.jpg")
//        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
//
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-2.jpg")!)
        
        courseRecommender = UILabel()
        courseRecommender.text = "CourseRecommender"
        courseRecommender.font = UIFont.boldSystemFont(ofSize: 30)
        courseRecommender.translatesAutoresizingMaskIntoConstraints = false
        
        
        bearLogo = UIImageView ()
        bearLogo.image = UIImage(named: "Icon_Final.png")
        bearLogo.translatesAutoresizingMaskIntoConstraints = false
        
        bearLogo2 = UIImageView()
        bearLogo2.image = UIImage(named: "bear2.jpg")
        bearLogo2.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIcon = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadingIcon.center.x = view.frame.width/2
        loadingIcon.center.y = view.frame.height/2
        loadingIcon.type = .pacman
        loadingIcon.startAnimating()
        
        //let delayInSeconds = 5.0
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) {
            self.loadingIcon.stopAnimating()
            let modalVC = BubblesViewController ()
            modalVC.modalTransitionStyle = .crossDissolve
            self.present(modalVC, animated: true, completion: nil)
        }
        
        view.addSubview(bearLogo)
        view.addSubview (loadingIcon)
        view.addSubview(courseRecommender)
        view.addSubview(bearLogo2)
        
        setUpConstraints ()
        // Do any additional setup after loading the view.
    }
    
    private func setUpConstraints () {
        
        NSLayoutConstraint.activate([
            bearLogo.topAnchor.constraint(equalTo: view.centerYAnchor),
            bearLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bearLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bearLogo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        NSLayoutConstraint.activate([
            courseRecommender.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            courseRecommender.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            //courseRecommender.widthAnchor.constraint(equalTo: view.widthAnchor),
            courseRecommender.heightAnchor.constraint(equalToConstant: 120)
            ])
        NSLayoutConstraint.activate([
            bearLogo2.topAnchor.constraint(equalTo: courseRecommender.bottomAnchor, constant: 32),
            bearLogo2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -60),
            bearLogo2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 60),
            bearLogo2.heightAnchor.constraint(equalToConstant: 120)
            ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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
