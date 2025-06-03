//
//  MainViewController.swift
//  CaptureCycle
//
//  Created by 조영현 on 6/3/25.
//

import UIKit

class MainViewController: UIViewController {
    var worker: Worker?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupButton()
    }

    func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Start Task", for: .normal)
        button.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(button)
    }

    @objc func didTapStart() {
        print("🚀 Starting task")
        worker = Worker(name: "Task A")
        worker?.startTask()

        // 👉 클로저는 실행하지 않아도 캡처된 self가 유지되므로 deinit이 안 호출됨
        // worker = nil // 이걸 주석 해제해도 deinit 안 불림 → 순환 참조 때문!
    }
}


