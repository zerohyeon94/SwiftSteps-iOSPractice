//
//  SecondViewController.swift
//  ViewLifeCycle
//
//  Created by 조영현 on 5/19/25.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        print("[SecondVC] viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[SecondVC] viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[SecondVC] viewDidAppear")
    }

    deinit {
        print("[SecondVC] deinit")
    }
}
