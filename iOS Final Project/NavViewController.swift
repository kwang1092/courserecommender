//
//  NavViewController.swift
//  iOS Final Project
//
//  Created by Robert Li on 4/27/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit

protocol SaveButtonDelegate {
    func saveButtonPressed(withName name: String)
}

class NavViewController: UIViewController {
    
    var classLabel:UILabel!
    var classText: UITextField!
    
    var delegate: SaveButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        classLabel = UILabel()
        classLabel.text = "Enter class name: "
        classLabel.font = UIFont.systemFont(ofSize: 18)
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        
        classText = UITextField ()
        classText.placeholder = "CS 2110"
        classText.delegate = self
        classText.borderStyle = .roundedRect
        classText.translatesAutoresizingMaskIntoConstraints = false
        
        let saveButton = UIBarButtonItem(title: "Save", style:.plain, target: self, action: #selector(saveButtonPressed))
        self.navigationItem.rightBarButtonItem = saveButton
        
        view.addSubview(classLabel)
        view.addSubview(classText)
        
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    private func setUpConstraints () {
        NSLayoutConstraint.activate([
            classLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            classLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            classLabel.widthAnchor.constraint(equalToConstant: classLabel.intrinsicContentSize.width),
            classLabel.heightAnchor.constraint(equalToConstant: 44)
            ])
        NSLayoutConstraint.activate([
            classText.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 8),
            classText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            classText.topAnchor.constraint(equalTo: classLabel.topAnchor),
            classText.heightAnchor.constraint(equalToConstant: 44)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func saveButtonPressed (sender:UIButton) {
        if let name = classText.text{
            if name != "" {
                delegate?.saveButtonPressed(withName: name)
                //self.navigationController!.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }
            else {
                let alert = UIAlertController(title: "Alert", message: "Empty string!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
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

extension NavViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        classText.endEditing(true)
        return true
    }
}

