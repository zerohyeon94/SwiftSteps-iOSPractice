# 📱 ImageLoaderViewController 예제

Swift와 UIKit을 사용하여 이미지를 URL로부터 다운로드하고, 완료 후 fade-in 애니메이션으로 표시하는 예제입니다.

---

## 📌 주요 기능

- ✅ `URLSession`을 이용한 비동기 이미지 다운로드
- ✅ `@escaping completion` 클로저를 사용한 결과 처리
- ✅ `UIView.animate`를 활용한 fade-in 효과
- ✅ `UIActivityIndicatorView`로 로딩 상태 표시
- ✅ `[weak self]`를 사용한 메모리 순환 참조 방지

---

## 📸 화면 구성

- 이미지 로딩 중: 로딩 인디케이터가 중앙에 표시됨  
- 이미지 로딩 완료: 이미지가 0.7초 후 서서히 표시됨 (`fade-in` 애니메이션)

---

## 🧠 학습 포인트

| 항목 | 학습 내용 |
|------|-----------|
| `URLSession` | 이미지 데이터를 비동기 다운로드 |
| `@escaping` | 네트워크 응답 이후에도 실행되는 클로저 처리 |
| `completion handler` | 함수 외부로 결과 전달 및 UI 업데이트 |
| `UIView.animate` | `alpha`를 활용한 시각적 트랜지션 구현 |
| `weak self` | 클로저 내부에서 순환 참조 방지를 위한 캡처 |

---

## ⚙️ 주요 코드

### 1. 이미지 다운로드 함수

```swift
func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
```
