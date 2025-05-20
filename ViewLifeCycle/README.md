# 📘 ViewLifecycle 실습 정리

## ✅ 실습 흐름

1. 앱 시작 시 `FirstViewController`가 화면에 표시됨  
2. 버튼을 눌러 `SecondViewController`로 `navigationController.pushViewController` 호출  
3. `SecondViewController`가 완전히 표시되면, `FirstViewController`는 화면에서 사라짐  
4. 다시 `popViewController`로 돌아옴

---

## 📌 생명주기 로그

```text
[FirstVC] init
[FirstVC] loadView
[FirstVC] viewDidLoad
[FirstVC] viewWillAppear
[FirstVC] viewDidAppear

(pushViewController 실행)

[SecondVC] init
[SecondVC] loadView
[SecondVC] viewDidLoad
[FirstVC] viewWillDisappear
[SecondVC] viewWillAppear
[FirstVC] viewDidDisappear
[SecondVC] viewDidAppear

(popViewController 실행)

[SecondVC] viewWillDisappear
[FirstVC] viewWillAppear
[SecondVC] viewDidDisappear
[FirstVC] viewDidAppear
[SecondVC] deinit
```

## 🧠 내가 느낀 점 및 궁금했던 점
### ✅ 이해한 내용 요약
- viewDidLoad()는 ViewController가 생성되고 나서 단 1번만 호출
- viewWillAppear와 viewDidAppear는 화면이 다시 나타날 때마다 반복 호출
- SecondViewController는 popViewController()로 되돌아오면 메모리에서 제거됨 (deinit 호출됨)
    반면, FirstViewController는 네비게이션 스택에 계속 유지되므로 deinit이 호출되지 않음

### ❓ 궁금했던 점 정리 및 해석
1. [FirstVC] viewDidAppear가 왜 다시 호출되었는가?
    viewDidDisappear 후 다시 화면으로 돌아오면, 그 ViewController는 여전히 메모리에 존재하고 있기 때문에 다시 보여질 때 viewWillAppear → viewDidAppear 순서로 재호출됩니다.
    (✅ 정상적인 동작입니다.)

3. FirstViewController는 왜 deinit되지 않았는가?
    FirstVC는 여전히 navigationController의 루트로 남아 있음.
    따라서 strong reference가 유지되고 있어 deinit이 호출되지 않음.
    (✅ 반대로 SecondVC는 pop되면 스택에서 제거되고 참조도 없어져서 deinit이 호출됩니다.)

## ✍️ 결론
- viewDidLoad는 초기 설정을 위한 곳이며, 이후 화면 재등장에는 호출되지 않는다.
- 화면 전환(push/present) 시에는 viewWillDisappear → viewDidDisappear 호출
- pop/dismiss 시에는 다시 이전 VC의 viewWillAppear → viewDidAppear 호출
- deinit은 navigation stack에서 완전히 제거되고, 참조가 해제된 경우에만 호출된다.
