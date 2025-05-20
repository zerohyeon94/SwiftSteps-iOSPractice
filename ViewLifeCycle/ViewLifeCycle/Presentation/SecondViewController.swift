//
//  SecondViewController.swift
//  ViewLifeCycle
//
//  Created by 조영현 on 5/19/25.
//

import UIKit

class SecondViewController: UIViewController {
    private let goBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 생성자 (초기화)
    init() {
        super.init(nibName: nil, bundle: nil)
        print("[SecondVC] init")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("[SecondVC] init(coder:)")
    }

    // 뷰 로딩 (뷰를 코드로 구성하는 경우 필요)
    override func loadView() {
        super.loadView()
        print("[SecondVC] loadView")
    }

    // 뷰가 메모리에 로드되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[SecondVC] viewDidLoad")

        view.backgroundColor = .blue
        
        setupUI()
        setupConstraints()
    }

    // 뷰가 나타나기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[SecondVC] viewWillAppear")
    }

    // 뷰가 완전히 나타난 직후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[FirstVC] viewDidAppear")
    }

    // 뷰가 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[SecondVC] viewWillDisappear")
    }

    // 뷰가 완전히 사라진 직후
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[SecondVC] viewDidDisappear")
    }

    // 메모리 해제 시점
    deinit {
        print("[SecondVC] deinit")
    }
    
    private func setupUI() {
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(goBackButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goBackButton.widthAnchor.constraint(equalToConstant: 120),
            goBackButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // 이전 화면으로 이동
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
