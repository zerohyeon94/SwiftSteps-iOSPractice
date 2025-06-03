# 🧠 Swift ARC & 클로저 순환 참조 예제

이 프로젝트는 **Swift의 Automatic Reference Counting(ARC)**과  
**클로저에서 발생할 수 있는 순환 참조(Capture Cycle)**를 실습하고 이해하기 위한 학습용 예제입니다.

---

## 📌 목표

- 클로저가 `self`를 강하게 캡처할 때 순환 참조가 어떻게 발생하는지 확인
- `[weak self]`를 사용해 순환 참조를 방지하는 방법 실습
- `deinit`을 통해 메모리 해제 여부를 눈으로 확인

---

## 📁 구성

| 파일명 | 설명 |
|--------|------|
| `MainViewController.swift` | 버튼 클릭 시 Worker 인스턴스를 생성하여 작업 실행 |
| `Worker.swift` | 클로저 속에서 self를 참조하여 순환 참조 실험 |
| `deinit 로그` | 인스턴스가 메모리에서 해제될 때 로그로 확인 가능 |

---
