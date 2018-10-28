//
//  ViewController.swift
//  KnittingCount
//
//  Created by Mika Arai on 2018/10/28.
//  Copyright © 2018年 Mika Arai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var totalTextField: UITextField!

    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let numberToolbar = UIToolbar()
//        numberToolbar.items=[
//            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.bordered, target: self, action: "hoopla"),
//            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
//            UIBarButtonItem(title: "Apply", style: UIBarButtonItemStyle.bordered, target: self, action: "boopla")
//        ]

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setup() {
        countLabel.text = String(0)
    }

    @IBAction func plusCount(_ sender: Any) {
        let str = countLabel.text
        guard let _ = str else { return }
        var num: Int = Int(str!)!

        num += 1
        if num == total {
            countLabel.textColor = UIColor.countRed
        } else if num > total {
            num = 1
            countLabel.textColor = UIColor.countGray
        }
        countLabel.text = String(num)
    }

    @IBAction func minusCount(_ sender: Any) {
        guard let str = countLabel.text else { return }
        var num: Int = Int(str)!

        if num == 0 { return }
        countLabel.textColor = UIColor.countGray

        num -= 1
        countLabel.text = String(num)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)

        guard let str = totalTextField.text else { return }
        total = Int(str)!
    }
}
