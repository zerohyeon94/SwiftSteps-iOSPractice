//
//  FirstViewController.swift
//  ViewLifeCycle
//
//  Created by 조영현 on 5/19/25.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("[HomeVC] viewDidLoad")
        
        let button = UIButton(type: .system)
        button.setTitle("Go to Next", for: .normal)
        button.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        button.center = view.center
        button.frame.size = CGSize(width: 120, height: 40)
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[HomeVC] viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[HomeVC] viewDidAppear")
    }
    
    @objc private func goToNext() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    deinit {
        print("[HomeVC] deinit")
    }
}

