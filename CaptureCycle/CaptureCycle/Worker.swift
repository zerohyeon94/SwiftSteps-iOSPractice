//
//  Worker.swift
//  CaptureCycle
//
//  Created by 조영현 on 6/3/25.
//

class Worker {
    var name: String
    var task: (() -> Void)? // 클로저 저장 (주의!)

    init(name: String) {
        self.name = name
        print("👷‍♂️ \(name) initialized")
    }

//    func startTask() {
//        task = {
//            // self를 강하게 캡처 → 순환 참조 발생 가능
//            print("🔁 \(self.name) is working")
//        }
//    }
    
    // 순환 참조가 해결된 
    func startTask() {
        task = { [weak self] in
            guard let self = self else { return }
            print("✅ \(self.name) is working")
        }
    }

    deinit {
        print("💀 \(name) deinitialized")
    }
}
