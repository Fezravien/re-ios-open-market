# 🏬 Fezz Market 

[REST API](https://docs.google.com/spreadsheets/d/1_l6aPfEUchSF_ymIp0DjyH8Ic00GIoqvd8dO9f7_sx4/edit#gid=1153044612)를 이용한 상품 `목록 조회`, `상세 조회`, `등록`, `수정`, `삭제` 기능을 할 수 있는 앱이다. 

<img src="https://user-images.githubusercontent.com/44525561/136771549-10d4b706-f10a-4aad-bf55-90f305051286.gif" width="30%"> <img src="https://user-images.githubusercontent.com/44525561/136771745-6a012d4d-c1b9-4261-af35-83770e4c14f7.gif" width="30%"> <img src="https://user-images.githubusercontent.com/44525561/136771649-1759ce47-a9a0-4868-8d15-b97b87a363d3.gif" width="30%">


## 목차.

[1. 프로젝트 개요](#프로젝트-개요)

[2. 기능](기능)

[3. 설계](#설계)

[4. 사용자 경험을 고려한 개선 사항](#사용자-경험을-고려한-개선-사항)

[5. 유닛 테스트](#유닛-테스트)

[6. 트러블 슈팅](#트러블-슈팅)

<br>

## 프로젝트 개요
### Index

[- 프로젝트 관리](#프로젝트-관리)

[- 설계](#설계)

[- 기술 스택](#기술-스택)

<br>

### 프로젝트 관리

#### 깃헙 프로젝트로 Issue, PR 관리하기

[Market 기능 구현 프로젝트](https://github.com/Fezravien/re-ios-open-market/projects/1)

[Market 리팩토링 및 테스트 프로젝트](https://github.com/Fezravien/re-ios-open-market/projects/2)

<br>

[Issue](https://github.com/Fezravien/re-ios-open-market/issues) 

- To Do 관리 
- 프로젝트 진행하며 생각
- 프로젝트 버그

[PR](https://github.com/Fezravien/re-ios-open-market/pulls?q=is%3Apr+is%3Aclosed)

- 기능 단위 브랜치 정리

<br>


#### 기능 단위 브랜치 

목적에 따라 `feature`, `test` 로 나누고 각각의 기능에 따라 브랜치를 나눠서 개발을 진행했다.

완료된 브랜치는 `develop` 브랜치에 합쳐 하나의 버전(기능)을 만들고 `Master`에 merge했다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%201.22.13.png" alt="스크린샷 2021-10-11 오전 1.22.13" width="70%;" />  

##### 브랜치 별 요약 내용

- feature : 기능 구현 

`feature/Model` : REST API의 요구사항에 맞는 Model 기능 구현

`feature/NetworkandItemList` : 서버로 부터 상품 목록 데이터을 받아 UICollectionView에 띄우기 기능 구현 (GET)

`feature/ItemGrid` : 서버로 부터 상품 목록 데이터를 Grid 형식의 UICollectionView에 띄우기 기능 구현 (GET)

`feature/Registration` : 서버에 등록 상품 정보를 보내서 등록 기능 구현 (POST)

`feature/DetailPage` : 서버에 상품 조회를 요청하여 상세 정보 띄우기 기능 구현 (GET)

`feature/Edit` : 상품 상세 페이지에서 상품 수정 기능 구현 (PATCH)

`feature/Delete` : 상품 상세 페이지에서 상품 삭제 기능 구현 (DELETE)

`feature/ImageCache` 상품 목록에서 이미지 캐싱 구현


<br>


- test : 리팩토링 및 Unit Test

`test/MainPageTest` : 상품 목록 페이지, 모델 리팩토링 및 코드 개선 그리고 Unit Test 수행

`test/RegisterAndEditPage` : 상품 등록, 수정 페이지 리팩토링 및 코드 개선 그리고 Unit Test 수행

`test/DetailPage` : 상품 상세 페이지 리팩토링 및 코드 개선

<br>

#### ✏️ Commit Message

기능 단위로 나눠 개발하는 과정의 커밋 메시지는 `깃 이모지`를 활용해서 가시성과 일관성을 높혔다. 


| Type     | Emoji | Description                                                  |
| :------- | :---: | :----------------------------------------------------------- |
| Feat     |   ✨   | 기능 (새로운 기능)                                           |
| Fix      |   🐛   | 버그 (버그 수정)                                             |
| Refactor |   ♻️   | 리팩토링 `기능 변경 없음`                                    |
| Style    |   🚚   | 파일 형식/네이밍, 폴더 구조/네이밍 수정하거나 옮기는 작업 `비즈니스 로직에 변경 없음` |
| Style    |   💄   | 스타일 (UI 스타일 변경)  `비즈니스 로직에 변경 없음`         |
| Docs     |   📝   | 문서 (문서 추가, 수정, 삭제)                                 |
| Test     |   ✅   | 테스트 (테스트 코드 추가, 수정, 삭제) `비즈니스 로직에 변경 없음` |
| Chore    |   🔧   | 기타 (빌드, 시스템 파일 및 설정 변경)                        |
| Comment  |   💡   | 필요한 주석 추가 및 변경                                     |
| Remove   |   🔥   | 파일, 폴더 삭제 작업                                         |



<br>

### 기술 스택

##### 코드를 통한 레이아웃

레이아웃을 코드로 작성한 이유는 `응집도`을 높혀 각각의 구성요소의 설정을 직관적으로 보고 싶었다.  

| UI                                                           | Network              | Decoing / Encoding                                           | Caching | Test   |
| :----------------------------------------------------------- | :------------------- | :----------------------------------------------------------- | :------ | :----- |
| UICollectionView <br />UITextField<br />UITextView <br />UIImageVIew<br />UIAlert<br />UIActivityIndicatorView<br />UIScrollView | URLSession<br />Data | Codable <br />JSONEncoder <br />JSONDecoder <br />Data(multipart/form-data) | NSCache | XCTest |

<br>

## 기능

### Index

[- 상품 목록 조회](#상품-목록-조회)

[- 상품 상세 조회](#상품-상세-조회)

[- 상품 등록](#상품-등록)

[- 상품 수정](상품-수정)

[- 상품 삭제](#상품-삭제)

<br>

### 상품 목록 조회

 #### 시나리오

- 앱을 실행하게 되면 서버로 `GET` 메소드를 통해 상품 목록을 요청하게 된다.
- 서버로 부터 데이터를 전달 받으면 상품 리스트, 그리드 모드에 따라 `UICollectionViewCell`에 업데이트 시켜준다.
- 한번에 서버로 부터 받는 상품 목록은 20개로 하단으로 스크롤 시 다음 페이지를 서버에 요청하게 된다 **(Infinite Scroll)**

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2011.31.31.png" alt="스크린샷 2021-10-11 오전 11.31.31" width="90%;" />   

<br>

#### 시뮬레이션 

최초의 서버로 부터 받은 상품 목록(20개)을 스크롤로 내려서 다음 상품 목록을 요청하게 되며,

성공적으로 요청되면 스크롤링을 통해 연속적으로 상품을 볼 수 있다.


<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-11%20at%2002.32.18.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 02.32.18" width="30%;" /> <img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-11%20at%2002.32.51.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 02.32.51" width="30%;" />  

<br>

---

### 상품 상세 조회

#### 시나리오

- 상품 목록 페이지에서 특정한 상품을 누르게 되면 서버에 누른 상품의 `id` 로 상품 상세 정보를 요청하게 된다.
- 서버로 부터 받은 상품 상세 정보를 `UIImageView`, `UILabel` 에 띄워준다.
- 이미지는 1개 이상의 배열로 `Image Paging` 로 스와이프를 통해 볼 수 있게 구성했다. 

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2011.35.34.png" alt="스크린샷 2021-10-11 오전 11.35.34" width="90%;" /> 

<br>

#### 시뮬레이션

상품 목록 페이지에서 특정 상품을 누르게 되면 서버에 상품 조회를 요청하게 되고,

응답 받은 데이터를 상세 페이지에서 보여주게 된다.

<img src="https://user-images.githubusercontent.com/44525561/136769132-2f871fe1-09c8-44b1-ab14-0c61e87e6044.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 02.52.01" width="30%;" /> 

<br>

---

### 상품 등록

#### 시나리오

- 상품 목록 페이지 우측 상단에 `+` 버튼을 누르게 되면 상품 등록, 수정 페이지로 이동할 수 있다.

<img src="https://user-images.githubusercontent.com/44525561/136769408-d2cfec16-c454-4421-ba20-0e9d77e6f337.png" alt="스크린샷 2021-10-11 오전 3.02.30" width="60%;" /> 


<br>

- 이미지 추가 버튼을 눌러 이미지를 최대 5장까지 선택이 가능하다. 

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%203.10.57.png" alt="스크린샷 2021-10-11 오전 3.10.57" width="100%;" />


<br>

- 이미지는 스크롤을 통해 좌우로 확인할 수 있으며, 눌러서 삭제가 가능하다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%203.21.22.png" alt="스크린샷 2021-10-11 오전 3.21.22" width="50%;" /> 

<br>

- 상품 정보 입력이 완료되면 서버에 등록 후 Alert로 등록 완료를 알린다.
- 완료 알림 확인 버튼을 누르게 되면 Request에 상품 입력정보를 포함시켜 서버에 `POST` 메소드로 상품을 등록한다.
- 등록이 완료되면 서버로 부터 등록된 상품의 정보를 받게 되고, 그것을 상품 상세 페이지로 이동해서 보여준다.

<img src="https://user-images.githubusercontent.com/44525561/136769557-4da6dc2a-ea28-4485-8501-0c82ad9f1871.png" alt="스크린샷 2021-10-11 오전 11.52.32" width="80%;" /> 

<br>

#### 시뮬레이션

상품 등록이 성공하게 되면 상품 목록 페이지를 거쳐 상품 상세 페이지에 등록된 상품을 보여주게 된다.

또한, 상품 상세 정보 입력에 키보드 간섭을 없앴다.


<img src="https://user-images.githubusercontent.com/44525561/136769763-dbacf4ed-b3dd-41aa-9e61-9ac73d0c7e25.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 03.33.12" width="30%;" /> <img src="https://user-images.githubusercontent.com/44525561/136769781-62be1921-aa5e-4153-9358-d94cbd120a97.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 03.34.11" width="30%;" />

<br>

---

### 상품 수정

#### 시나리오

- 상품 목록에서 수정하고자 하는 상품을 누르면 서버에 특정 상품을 `GET/id` 로 요청하고, 받은 데이터를 통해 상품 상세 페이지로 이동하여 보여준다
- 상품 상세 페이지의 우측 상단의 `Edit` 버튼을 통해 Action Sheet로 상품 수정이 가능하다.
- 상품 수정을 하기 위해서는 현재 상품의 비밀번호를 알아야한다. 서버에 `PATCH/id` 로 Request에 password를 담아 보내고 비밀번호를 검증한다.
- 비밀번호를 틀리면 확인 알림이 뜨고, 정상적으로 비밀번호를 입력하면 수정 페이지로 이동한다.

<img src="https://user-images.githubusercontent.com/44525561/136769898-4b2e76b8-3690-4ec3-b8d3-e7ff31639abf.png" alt="스크린샷 2021-10-11 오후 12.08.51" width="100%;" />

<br>

- 상품의 정보를 수정하고 우측 상단에 `Done` 버튼을 통해 등록할 수 있는데 여기서도 현재 상품을 `비밀번호를 검증`한다.
- 틀리면 상품 수정이 불가하며, 성공시 수정된 상품의 업데이트된 상태를 상세 페이지에서 보여준다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2012.19.51.png" alt="스크린샷 2021-10-11 오후 12.19.51" width="75%;" />   

<br>

#### 시뮬레이션

<img src="https://user-images.githubusercontent.com/44525561/136770068-cc86a1c8-a89b-4736-b8c8-93c94f406edf.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 04.01.37" width="30%;" /> 

<br>

---

### 상품 삭제

#### 시나리오

- 상품 목록에서 삭제하고 싶은 상품을 누르게 되면 상세 페이지로 이동하게 된다
- 상세 페이지의 우측 상단의 `Edit` 버튼을 눌러 액션 시트의 삭제버튼을 누르게 되면 현재 상품의 비밀번호를 검증한다.
- 비밀번호를 틀리게되면 알람이 뜨게되고, 비밀번호가 맞다면 상품 목록이 초기화되며 최상단으로 스크롤된다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2012.19.36.png" alt="스크린샷 2021-10-11 오후 12.19.36" width="100%;" />

<br>

#### 시뮬레이션

<img src="https://user-images.githubusercontent.com/44525561/136770224-3bff415d-a1e6-4aa5-992e-23063b783ac3.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 04.26.06" width="30%;" /> 

<br>

## 설계

### Index

[- MVVM 아키텍처](#mvvm-아키텍처)

[- 상품 목록 조회 구현](#상품-목록-조회-구현)

[- 상품 상세 조회 구현](#상품-상세-조회-구현)

[- 상품 등록 구현](#상품-등록-구현)

[- 상품 수정 구현](#상품-수정-구현)

[- 상품 삭제 구현](상품-삭제-구현)

<br>

### MVVM 아키텍처

MVVM 아키텍처는 추후 `유지보수`를 진행하거나 앱의 기능을 `확장`시킬 때 의존성이 낮아 비용면에서 장점이 있고, 협업에 있어서도 분리 되어있어 편하게 작업할 수 있다. 그리고 View의 로직이 분리되어 `테스트`가 수월해진다. 

프로토콜을 통해 `의존성을 역전`시키고, 외부에서 `의존성을 주입`받는 방식으로 네트워크, 기본 타입과 무관한 테스트를 진행해볼 수 있었다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%203.16.58.png" alt="스크린샷 2021-10-11 오후 3.16.58" width="100%;" />

<br>

---

### 상품 목록 조회 구현

#### 데이터 바인딩

<img src="https://user-images.githubusercontent.com/44525561/136770371-44931d1a-6fc5-418e-b6fa-ea8fe94824ad.png" alt="스크린샷 2021-10-11 오후 3.35.32" width="70%;" /> 

`1번` : 사용자가 앱을 실행시켰을 때 `MarketViewController`가 초기화되는데, 이때 `MarketViewModel`에 서버에서 상품 목록을 요청한다.

`2번` : `MarketViewModel` 은 요청에 따라 서버에 상품 목록을 비동기로 요청하게 되고, 서버로 부터 데이터가 오면 가지고 있는 `Model` 을 변화시킨다.

`3번` : `Model` 의 변화로 프로퍼티 옵져버가 사용되며 `View` 와 바인딩된 클로저가 호출되게 되고, View에서 작업이 이뤄지게된다.

`MarketModel`에는 상품 목록의 모델인 **이미지, 텍스트** 두 가지가 존재한다.

그 이후의 MarketCollectionViewCell에서 View를 업데이트 시켜준다.


<br>


#### UICollectionView Pagination

무한 스크롤을 하는 벙법에서는 3가지가 존재했다.

- ScrollYOffset

  UICollectionView는 UIScrollView를 상속하기 때문에 CollectionView Delegate 위임만으로도 ScrollView Delegate를 위임 받을 수 있다.

   ScrollView delegate 중 Scroll의 변화를 감지할 수 있는 `scrollViewDidScroll`을 사용할 수 있다.

  ```swift
  func scrollViewDidScroll(_ scrollView: UIScrollView) {        
    let height: CGFloat = scrollView.frame.size.height            
    let contentYOffset: CGFloat = scrollView.contentOffset.y            
    let scrollViewHeight: CGFloat = scrollView.contentSize.height            
    let distanceFromBottom: CGFloat = scrollViewHeight - contentYOffset
              
    if distanceFromBottom < height {
      self.page += 1
      fetchMarketData(page: self.page)       
    }
  }
  ```

  스크롤의 변화를 감지하여 더이상 내릴 곧이 없음을 판단하여 새로운 데이터를 받아온다. 

  동작은 확실하지만 스크롤을 할때 빠르게 내리게 되면 다른 것들에 비해 딜레이가 있는것 처럼 느껴진다.

  

- willDisplayCell

  UICollectionView Delegate에 CollectionView Willdisplay Cell 함수가 존재한다.

  ```swift
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          if indexPath.row > self.marketViewModel.marketItemsCount - 5 {
              // willDisplay 만으로는 cell이 screen에 보여졌다고 보장되지 않음.
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                  if self.marketCollectionView.visibleCells.contains(cell) {
                      self.page += 1
                      self.fetchMarketData(page: self.page)
                  }
              }
          }
      }
  ```

  약간에 문제가 발생될 여지가 있어보였다. `WillDisplay`는 호출이 Cell을 다시 draw 할때가 맞긴 하지만 "배경 색상과 같이 뷰에서 이전에 설정한 상태 기반 속성을 재정의 할 수 있다" 라는 [Apple Document](https://developer.apple.com/documentation/uikit/uitableviewdelegate/1614883-tableview) 것을 읽어보면 우선시 되지 않아서 스크롤 시 못 보여줄 가능성이 있다고 판단됐다. 

  이러한 이슈는 [스텍오버플로우](https://stackoverflow.com/questions/48136553/tableview-willdisplaycell-called-for-cells-that-are-not-on-the-screen-tableview)에서도 볼 수 있었다.

- PrefetchRow

  iOS 10 이상부터 사용할 수 있으며 셀을 구성하는 데이터를 불러오는 작업을 미리 할 수 있는 프로토콜인 `UICollectionViewDataSourcePrefetching`로 사용할 수 있다.

  ```swift
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if marketViewModel.marketItemsCount == indexPath.row + 2 {
                self.page += 1
                fetchMarketData(page: page)
            }
        }
  }
  ```

  모델의 데이터 수랑 2개 차이 나는 상황(아래로 드래그)에 새로운 데이터를 받는다.

  서버 통신과 같은 비동기 상황에서 자연스럽게 `Pagination`을 구현할 수 있는 함수라 생각이 든다. [Apple Document](https://developer.apple.com/documentation/uikit/uicollectionviewdatasourceprefetching)를 보면 용량이 큰 데이터나 포퍼먼스에 부담이 될 수 있는 큰 작업에 효과적인 것 같다. 

  **이 방법이 위의 방법들보다 이 프로젝트에 적합하다고 생각되서 사용했다.**

<br>

---

### 상품 상세 조회 구현

#### 데이터 바인딩

<img src="https://user-images.githubusercontent.com/44525561/136770497-894630ef-4b58-4b3d-ad57-73aa04eaec14.png" alt="스크린샷 2021-10-11 오후 4.23.17" width="90%;" /> 

`1번` : 사용자가 특정 상품을 누르게 되면 `MarketRegisterAndEditViewModel`에서 서버로 상품의 `id` 값을 가지고 요청을 보내게된다. 

`2번` : 서버로 부터 받은 데이터를 `MarketModel`에 저장하게 된다.

`3번` : `MarketModel` 의 프로퍼티 옵져버를가 Model의 변화를 감지하고 View와 바인딩된 클로저를 실행시키게 된다.

<br>

#### Image Pagination

 서버로 부터 받은 이미지의 갯수만큼 반복문을 돌며 `UIImageView` 객체를 생성하여 X, Y 위치를 맞춘다.

그리고 다음 이미지는 동일한 크기로 X축을 index만큼 곱해 옆으로 쌓게 된다. 몇개의 이미지가 들어 있는지 `.numberOfPages`를 사용했다.

```swift
    private func updateImage(image: [Data]) {
        for index in 0..<image.count {
            DispatchQueue.main.async {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                let positionX = self.imageScrollView.frame.width * CGFloat(index)
                let positionY = self.imageScrollView.frame.origin.y
                imageView.frame = CGRect(x: positionX, 
                                         y: positionY, 
                                         width: self.imageScrollView.bounds.width, 
                                         height: self.imageScrollView.bounds.height)
                imageView.image = UIImage(data: image[index])
                self.imageScrollView.addSubview(imageView)
                self.imageScrollView.contentSize.width = imageView.frame.width * CGFloat(index + 1)
            }
        }
        
        DispatchQueue.main.async {
            self.imageScrollViewPageControl.numberOfPages = image.count
        }
    }
```

<br>

---

### 상품 등록 구현

#### 데이터 바인딩

<img src="https://user-images.githubusercontent.com/44525561/136770602-6ee15332-d9ab-4dfa-8124-8f8824735d1b.png" alt="스크린샷 2021-10-11 오후 4.25.25" width="70%;" />  

`1번` 

 이미지, 제목, 화폐, 가격, 할인가격, 수량, 상세정보 각각 데이터 바인딩이 되어있어 사용자 인풋에 따라 각각 `MarketRegisterAndEditViewModel` 을 호출게 된다.

`2번` 

각각의 사용자 인풋의 따라 값이 들어오게 되면 각각에 모델에 값들을 저장하게된다.

`3번` 

사용자 인풋에 따라 각각의 모델에는 프로퍼티 옵져버가 있으며, 모델이 변경되면 바인딩 되어있던 클로저가 호출되서 View에 UI를 업데이트하게 된다.


<br>

### multipart/form-data로 POST 요청하기

`multipart/form-data` JSON과 다르게 포멧을 맞춰야 POST를 정상적으로 수행할 수 있다.

```swift
    private func createMultipartFormRequest<T: MultiPartForm>(url: URL, type: T, method: NetworkConstant.Method) -> URLRequest {
        let boundary = baseBoundary()
        let encodeBody = createBody(dictionaryData: type.asDictionary, boundary)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodeBody
        
        return request
    }
    
    private func baseBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    private func createBody(dictionaryData: [String: Any?], _ boundary: String) -> Data {
        var body = Data()
        
        for (key, value) in dictionaryData {
            if value == nil {
                continue
            } else if let value = value as? [Data] {
                body.append(convertMulitPartForm(imageName: key, images: value, boundary: boundary))
            } else if let value = value {
                body.append(convertMulitPartForm(name: key, value: value, boundary: boundary))
            }
        }
    
        body.append("--\(boundary)--\r\n")
        
        return body
    }
    
    private func convertMulitPartForm(name: String, value: Any, boundary: String) -> Data {
        var element = Data()
        
        element.append("--\(boundary)\r\n")
        element.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        element.append("\(value)\r\n")
        
        return element
    }
    
    private func convertMulitPartForm(imageName: String, images: [Data], boundary: String) -> Data {
        var element = Data()
        
        for image in images {
            element.append("--\(boundary)\r\n")
            element.append("Content-Disposition: form-data; name=\"images[]\"; filename=\"\(imageName)\"\r\n")
            element.append("Content-Type: image/png\r\n\r\n")
            element.append(image)
            element.append("\r\n")
        }
        
        return element
    }
}
```

<br>

#### 사용자 입력 제약사항

<img src="https://user-images.githubusercontent.com/44525561/136770675-fd3c2d0c-f642-4a26-a1ca-5b797673ff83.png" alt="스크린샷 2021-10-11 오후 4.49.18" width="90%;" /> 

<br>

#### 상세 정보 입력시 키보드 조정

<img src="https://user-images.githubusercontent.com/44525561/136770771-4187e89e-9c14-4b8a-bd3f-cf9e5279aa03.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 03.34.11" width="30%;" /> 

```swift
// 키보드 옵저버 등록
    private func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, 
                                               selector: #selector(adjustForKeyboard), 
                                               name: UIResponder.keyboardWillChangeFrameNotification, 
                                               object: nil)
        NotificationCenter.default.addObserver(self, 
                                               selector: #selector(adjustForKeyboard), 
                                               name: UIResponder.keyboardWillHideNotification, 
                                               object: nil)
    }

// 내려가고 올라갈때 액션
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            itemDescription.contentInset = .zero
        } else {
            itemDescription.contentInset = UIEdgeInsets(top: 15, 
                                                        left: 10, 
                                                        bottom: keyboardViewEndFrame.height
                                                        - view.safeAreaInsets.bottom, 
                                                        right: 10)
        }

        itemDescription.scrollIndicatorInsets = itemDescription.contentInset

        let selectedRange = itemDescription.selectedRange
        itemDescription.scrollRangeToVisible(selectedRange)
    }
```

 상품 상세 정보 UITextView를 입력하는데 키보드가 올라와 있는 범위를 넘어서면 키보드 밑으로 커서가 내려가 무엇을 쓰고 있는지 확인이 안되는 문제가 있었다. 이 문제를 해결하기 위해 키보드가 올라오고 내려감을 인식하기 위해 키보드 옵져버를 설정했고, 이에 따라 액션을 줘서 커서가 키보드 밑으로 내려가는 것을 방지했다.

키보드가 얼마나 올라오는지 Frame을 구해서 `contentInset`를 조정했다.

UIEdgeInsets에 bottom에서 키보드 높이에서 뷰의 bottom 세이프 영역과의 차를 통해서 커서를 위치시켰다.

<br>

---

### 상품 수정 구현

#### 상품 수정 후 새로고침 (데이터 바인딩)
<img src="https://user-images.githubusercontent.com/44525561/136770891-0e764fc2-9745-4072-b547-7eedb097eed8.png" alt="스크린샷 2021-10-11 오후 5.11.43" width="80%;" /> 

```swift
// 상품 등록/수정 페이지에서 수정이 완료된 후
DispatchQueue.main.async {
    self.indicater.stopAnimating()
    self.alert(title: "수정이 완료되었습니다") {
        self.modificationDelegate?.refreshDetailItem(item: item)
        self.navigationController?.popViewController(animated: true)
    }
}

// 델리게이트 패턴으로 상품 등록/수정 페이지로부터 받은 이벤트
func refreshDetailItem(item: Item) {
    self.marketDetailViewModel.refreshItem(item: item)
    self.updateDelegate?.refreshMainItemList()
}
```

상품 등록/수정 페이지에서 등록이 완료되게 되면 델리게이트 패턴으로 상품 상세페이지로 업데이트를 요청하게 된다.

여기서 주의 해야하는 점은 비동기 참조에 대해 조심해야되는데 상품 등록/수정이 사라지고 나면 데이터를 업데이트 하라는 명령조차 의미가 없어지기 떄문에 여기서는 강한 참조를 가지고 있어야 한다.

<br>

---

### 상품 삭제 구현

삭제는 입력받은 `password` 를 JSONEncode을 활용하여 서버에 POST 해서 비밀번호 검증 후 비밀번호가 맞다면 서버에서 그 상품을 삭제하게 된다.

<br>

## 사용자 경험을 고려한 개선 사항

[- 상품 등록 후 등록된 상품으로 이동 및 상품 목록 초기화](#상품-등록-후-등록된-상품으로-이동-및-상품-목록-초기화)

[- 상품 수정 후 수정된 상품으로 상세 페이지 업데이트 및 상품 목록 초기화](#상품-수정-후-수정된-상품으로-상세-페이지-업데이트-및-상품-목록-초기화)

[- 상품 목록에서 사용자 경험 향상](상품-목록에서-사용자-경험-향상)

<br>

### 상품 등록 후 등록된 상품으로 이동 및 상품 목록 초기화

상품 등록 후 완료 Alert를 띄우고 상품 목록 초기화로 등록을 끝내는 것이 아니라, 사용자에게 등록된 상품이 어떻게 표시되는지 상세 상품페이지를 통해서 확인 시켜서 잘못 등록되었으면 수정, 삭제를 다시 할 수 있게 했다. 

사용자가 등록된 상품 확인이 끝나면 상품 목록 페이지로 다시 돌아가게 되는데, 그 시점에 상품 목록을 초기화 후 서버로 새로운 목록을 요청한다. 
그 이유는 현재 사용자가 업데이트 하는 동안 다른 사용자 또한 서버에 등록, 수정, 삭제를 할 수 있으므로 상품들을 최신화 하는 시점이 필요하기 때문이다.

<img src ="https://images.velog.io/images/fezravien/post/d0e0e299-db3c-43c1-8a11-9acf298103cd/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-02%20at%2020.05.38.gif" width="30%"> 

<br>

### 상품 수정 후 수정된 상품으로 상세 페이지 업데이트 및 상품 목록 초기화

상품 상세 페이지를 통해 상품을 수정 후 사용자에게 상품이 수정된 상태를 확인시켜준다. 
사용자가 상품 확인이 끝나면 상품 목록이 초기화되고, 서버로부터 최신화된 상품 목록을 요청하게 된다. 
그 이유는 현재 사용자가 업데이트 하는 동안 다른 사용자 또한 서버에 등록, 수정, 삭제를 할 수 있으므로 상품들을 최신화 하는 시점이 필요하기 때문이다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-11%20at%2004.01.37.gif" width="30%"> 

<br>

### 상품 목록에서 사용자 경험 향상

#### 상품 목록 업데이트

서버에 상품 목록을 요청했을 때, 이미지는 URL형태로 받게 되는데 이미지, 텍스트를 각각 비동기로 하게 되면 왼쪽처럼 텍스트가 먼저 뜨고 그 다음에 이미지들이 뜨는 것을 볼 수있다. 왜냐하면 이미지는 URL을 통해 한번더 네트워크 작업을 해야되는 무거운 일이기 때문이다.

사용자 경험으로 생각했을때 앱이 조금 딜레이가 생겨도 오른쪽처럼 이미지가 다운로드 된 시점에 한번에 띄워주는것이 좀더 좋다고 판단해서 수정했다.

<img src="https://images.velog.io/images/fezravien/post/482fafb3-74e6-4566-97a0-f4b54e0aff71/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-06%20at%2021.22.07.gif" width="30%"> <img src="https://images.velog.io/images/fezravien/post/71d6d425-1a09-4d9e-b6cc-d34e7cde9eb8/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-06%20at%2022.01.22.gif" width="30%"> 



#### 이미지 캐싱

서버로 부터 데이터를 받으면 이미지는 URL로 받게되어 다시 네트워크를 통해 이미지를 네트워킹해야되어 무거운 작업일 수 밖에 없다.
왼쪽처럼 캐싱이 되지 않으면 이미 받았던 이미지를 다시 네트워크를 하기 때문에 받은 부분으로 스크롤하면 부드럽지 못한 화면을 볼 수 있다.
오른쪽 처럼 `NSCache`를 통해 캐싱을 하게되면 이미 받은 이미지 같은경우 캐시에서 가져오게 되어 사용자 경험을 향상시킬 수 있다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-29%20at%2017.03.57.gif" width="30%"> <img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-29%20at%2017.10.35.gif" width="30%">



<br>

## 유닛 테스트

### Index

[- 유닛 테스트를 진행한 이유](#유닛-테스트를-진행한-이유)

[- 유닛 테스트 진행한 부분](#유닛-테스트-진행한-부분)

<br>

### 유닛 테스트를 진행한 이유

 유닛 테스트를 하면서 작성한 코드가 의도한 대로 잘 동작하는지 검증하기 위한 절차이고, 검증을 통해 사이드 이펙트 또한 최대한 줄일 수 있는 예방책이 될 수 있다고 생각했다. 추후 개발 과정에서 요구사항의 변경이나 리팩토링으로 인해 코드가 수정된다면 더 유연하고 안정적이에 대응할 수 있게 되고, 이러한  진행하면서 코드 또한 Testable하게 수정할 수 있어 코드의 품질 또한 향상되는 효과를 가져올 수 있다고 생각한다. 

<br>

### 유닛 테스트 진행한 부분

<img src="https://user-images.githubusercontent.com/44525561/136770969-5c17f959-4ef7-4eb2-85ea-acd2c13e2109.png" alt="스크린샷 2021-10-11 오후 5.46.39" width="80%;" /> 

1. URLProtocol로 가짜 Session을 만들어 네트워크와 무관한 테스트를 진행

   - 오류가 존재하는지
   - 서버 응답은 잘 처리하는지
   - 데이터를 잘 전달해 주는지

2. URLProtocol로 네트워크와 무관한 테스트를 진행했고, 요청을 만들고 응답을 받는 테스트를 진행

   - 서버로 보낼 요청 (GET, POST, PATCH, DELETE)을 옳바르게 만드는지
   - 실패하는 네트워크, 성공하는 네트워크에 따라 핸들링을 하고 있는지
   - 성공하는 네트워크로부터 받은 데이터를 파싱은 잘하는지 
   - JSONEncoder, JSONDecoder 외부에서 의존성 주입을 받아 테스트 진행

3. URLPorotocol로 네트워크와 무관한 테스트를 진행했고, 1, 2에서 했던 것에 핸들링과 View에 올릴 비즈니스 로직 테스트

   - 가격, 수량에 상황에 따라 잘 가공하는지 (할인 가격의 유무, 수량 0개)
   - 네트워크에 대한 핸들링을 하고 있는지 
   - 네트워크로 부터 받은 데이터를 모델에 잘 저장하는지 

   

네트워크에 무관한 테스트를 중점적으로 진행했고, 각각에 객체에서 최대한 의존성을 분리했다.

프로토콜을 통해 의존성을 역전시키고, 외부에서 의존성을 주입하는 방식으로 의존성을 분리했다.

- URLSession
- JSONDecoder
- JSONEncoder
- Network(Session을 가지고 있는 네트워크 메소드)

[URLSessionDataTask init](https://developer.apple.com/documentation/foundation/urlsessiondatatask/3240618-init) 이 부분이 `Deprecated` 되어 Session의 의존성 분리로 MockSession으로 테스트 하지 못했다.

그래서 사용해본 방법이 URLProtocol을 사용한 가짜 네트워킹 방식이다.

`오류`와 `응답`을 조정해서 가짜 네트워크로써 네트워크와 무관한 테스트를 진행할 수 있다.

```swift
struct MockSession {
    static var urlSession: URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
}

final class MockURLProtocol: URLProtocol {
    static var error: Error?
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        guard let hander = MockURLProtocol.requestHandler else {
            assertionFailure("Received unexpected request with no handler set")
            return
        }
        
        do {
            let (response, data) = try hander(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
        // TODO: stop loading here
    }
}

let mockSession = MockSession.urlSession
let url = NetworkConstant.itemList(page: 1).url!
let mockNetwork = Network(session: self.mockSession!)
MockURLProtocol.error = MarketModelError.network
MockURLProtocol.requestHandler = { [unowned self] request in
    let response = HTTPURLResponse(url: url,
                                   statusCode: 200,
                                   httpVersion: nil,
                                   headerFields: ["Content-Type": "application/json"])!
            
        return (response, self.dummyItemList!)
    }
```





<br>

## 트러블 슈팅

### Index

[- 상품 목록 페이지에서 재사용 Cell의 문제](#상품-목록-페이지에서-재사용-cell의-문제)

[- 상품 등록 후 상품 목록 페이지를 통해 상품 상세 페이지로 등록된 상품 보여주기 문제](#상품-등록-후-상품-목록-페이지를-통해-상품-상세-페이지로-등록된-상품-보여주기-문제)

[- 상품 등록, 수정 페이지에 상품 수정으로 진입했을 때 이미지가 보이지 않는 문제](#상품-등록-수정-페이지에-상품-수정으로-진입했을-때-이미지가-보이지-않는-문제)

<br>

### 상품 목록 페이지에서 재사용 Cell의 문제

CollectionView Cell 재사용 문제 해결 방안으로 초기화 방식인 `prepareForReuse` 사용했다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-01%20at%2016.12.00.png" alt="Simulator Screen Shot - iPhone 12 Pro Max - 2021-09-01 at 16.12.00" width="30%;" /><img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-01%20at%2016.12.30.png" alt="Simulator Screen Shot - iPhone 12 Pro Max - 2021-09-01 at 16.12.30" width="30%;" />

동일한 시뮬레이터에서 원래 가격에 줄이 생기면 discountPrice가 존재하므로 가장 위의 Cell처럼 새로운 가격을 알려주도록 해야하지만, 아랫쪽 Cell은 `discountPrice`가 존재하지 않는데 줄이 그어지는 것을 볼 수 있다.

오른쪽 그림은 아래로 스크롤 후 다시 위치에 돌아왔을 때이다. Cell이 reuse되면 상태가 변경되는 것을 볼 수 있다 (주황 - 정상으로 돌아옴)

이러한 현상을 토대로 Cell이 Reuse되면서 초기화에 문제가 생겼다고 생각을 하게되었다.

Cell이 CollectionView에서 재사용될 때 초기화 할 수 있는 `prepareForReuse`를 override하여 사용했다. 

```swift
    override func prepareForReuse() {
        super.prepareForReuse()
        resetImageView()
        resetItemPrice()
        resetItemDiscountPrice()
        resetItemStock()
    }
    
    private func resetImageView() {
        self.itemImageView.image = nil
    }
    
    private func resetItemPrice() {
        self.itemPrice.attributedText = nil
        self.itemPrice.textColor = .systemGray
    }
    
    private func resetItemDiscountPrice() {
        self.itemDiscountPrice.isHidden = true
    }
    
    private func resetItemStock() {
        self.itemStock.text = nil
        self.itemStock.textColor = .systemGray
    }
```


<br>

---


### 상품 등록 후 상품 목록 페이지를 통해 상품 상세 페이지로 등록된 상품 보여주기 문제

#### 트러블

상품 등록 후 등록된 상품을 사용자가 확인할 수 있는 기능을 구현하려고 했다. 상품 등록 후 `상품 목록`을 거쳐 `상품 상세` 페이지에서 등록된 상품을 보여주는 기능을 구현하는데 `상품 상세`에 아무것도 보여지지 않는 현상이 발견되었다.

<img src="https://user-images.githubusercontent.com/44525561/135712413-477fa0a2-4818-487a-a70f-935d719e07a2.gif" width="30%"> 

<br>

#### 문제 인식

##### 추측

1. 서버에 데이터를 보내고(POST) 응답으로 데이터를 받지만, 이미지는 AWS에 저장되는데 시간이 걸려서 이미지를 재때 다운받지 못한 오류 
2. 네비게이션 컨트롤러의 pop, push하는 시점과 데이터를 상세 페이지에 ViewModel에 Model를 업데이트 하는 시점의 뒤바뀜 

화면이 전환되는 부분, 데이터가 델리게이트 패턴으로 전달되는 부분, 데이터가 업데이트 되는 부분 등 동작이 일어나는 부분에 **브레이크 포인트를 걸어 LLDB를 통해 디버깅**을 진행해보았다.

그 결과 추측 2번과 같이 네이게이션 컨트롤러를 pop, push (상품 등록 -> 상품 목록 -> 상품 상세) UI의 전환하는 시점보다 등록된 상품의 정보를 상품 상세에 전달하는 시점이 빨라서 백지가 띄는 현상이 되었다. 

<br>

#### 해결 방안

pop, push이 된 후에 상품 상세 페이지에 데이터를 전달하여 업데이트 시점을 맞춰주자. 

```swift
func displayRegisteratedItem(item: Item) {
    self.marketDetailViewController = MarketDetailViewController()
    self.navigationController?.pushViewController(self.marketDetailViewController, animated: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        self.marketDetailViewController?.refreshDetailItem(item: item)
    }
}
```

 `DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)` 를 통해 0.5초 딜레이를 시킨 후 데이터를 전달했다.

<img src="https://user-images.githubusercontent.com/44525561/135713506-a0eabf02-ee9f-49eb-8380-81457790bb52.gif" width="30%"> 

이 방법도 문제점이 존재하는데 0.5초 딜레이로 데이터가 잘 나타날 때도 안나타날 때도 존재했다. 그리고 다른 실행 환경에서도 딜레이 시간이 다른것을 확인했다. 그러므로 이 해결 방법은 임시방편일 뿐 오류가 날 수 있음을 내포하고 있다.

디버깅을 좀 더 촘촘하게 브레이크 포인트를 걸어서 진행해보았다.

pop, push에 따라 시점 차이가 존재하는 좀 더 근본적인 원인은 ViewController를 초기화하는 부분에서 **viewDidLoad(메모리에 올라오는 시점) 보다 ViewModel의 Model을 변화시키는 작업이 더 빠르게** 된다는 것이다. 그래서 Model 변화에 따른 프로퍼티 옵저버의 클로저는 nil 상태로 아무것도 업데이트 해주지 않는 것이다. 바인딩으로써 클로저는 viewDidLoad에서 바인딩되기 때문이다.

```swift
// viewDidLoad이 실행되기 전이라 바인딩되지 않아 detailItemHandler = nil
// 그래서 상품의 정보가 업데이트 되지 않는 상황
private(set) var itemImages: [Data]? {
    didSet {
        self.detailItemHandler?()
    }
}
```



<br>

#### 개선

기존의 등록된 후 사용자에게 등록한 상품을 보여주는 방식은 **상품 등록 -> 상품 목록 -> 상품 상세** 이렇게 왔다갔다 하는 방식이었다.

현재 앱스토어에 앱을 참고하여 생각해봤을때 왔다갔다 하는 방식으로 인해 사용자 경험이 떨어질 수 있음을 느꼈다. 그래서 `상품 목록`에서 `상품 상세`로 보여주는 방식에서 바로 `상품 상세`로 바로 넘어가도록 수정했고, 뒤로 버튼을 `.popToRootViewController` 활용하여 바로 상품 목록으로 이동하도록 했다.

<img src="https://user-images.githubusercontent.com/44525561/137657437-4dc7a942-06f1-4fbe-a9be-6503b9a78207.gif" width="30%">  

 `DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)`를 통한 해결방안에 잠재적인 오류 또한 해결하기 위해서 딜레이를 통한 viewDidLoad 호출을 기다리는 것이 아닌, viewDidLoad가 호출 될때 업데이트 시켜주도록 하여 실행 환경에 따라 발생될 수 있는 오류를 제거했다.

상품 상세에 프로퍼티에 등록된 데이터를 저장하고 viewDidLoad가 호출될 때 프로퍼티를 확인하여 ViewModel의 Model을 변경시켜줌으로써 정상적인 바인딩을 통해 업데이트 시켜주도록 했다.

```swift
private var registeredItem: Item?

override func viewDidLoad() {
    ...
    setRegisteredItem()
}

func displayRegisteredItem(item: Item) {
    self.displayMode = .registered
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, 
                                                            target: self, 
                                                            action: #selector(tappedCloseButton))
    self.registeredItem = item
}

private func setRegisteredItem() {
    guard let item = self.registeredItem else { return }
    refreshDetailItem(item: item)
}

func refreshDetailItem(item: Item) {
    self.marketDetailViewModel.refreshItem(item: item)
    self.updateDelegate?.refreshMainItemList()
}
```

<br>

---


### 상품 등록, 수정 페이지에 상품 수정으로 진입했을 때 이미지가 보이지 않는 문제

#### 트러블

사용자가 등록한 상품을 수정하기 위해 `상품 상세 페이지`의 `Action Sheet`를 통해 `상품 수정 페이지`로 이동하게 된다.
`상품 수정 페이지`에는 이미지, 제목, 화폐, 가격, 할인 가격(옵셔널), 수량, 상세 정보가 기존의 정보로 채워져 있어야 하지만, 
처음 앱을 구동했을 때 최초의 등록화면에 진입하면 이미지가 보여지는 것을 볼 수 있지만, 그 이후에 동일한 작업을 하게되면 이미지가 없는 현상이 생겼다.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-19%20at%2013.08.41.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-19 at 13.08.41" width="30%" /> <img src="https://images.velog.io/images/fezravien/post/01e27727-7162-4aa0-8aca-130fb2801d83/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-19%20at%2011.55.47-46(%EB%93%9C%EB%9E%98%EA%B7%B8%ED%95%A8).tiff" width="30%;" />

<br>

#### 문제 인식

##### 추측

1. 서버에 등록된 이미지를 가져오는 것(네트워크)에 딜레이로 인해 이미지가 업데이트 되지 못했다.
2. 서버에 이미지가 AWS 서버에 등록되는 시점과 이미지를 화면에 띄워주는 시점이 맞지 않았다.
3. ViewController가 생성되어 메모리에 올라오기 전에 데이터를 업데이트 시켜줬다. (MVVM 이키텍처 - Model의 변화로 ViewModel과 View간의 바인딩을 통해 업데이트를 한다.)

<br>

#### 해결

상품 수정 페이지에서 이미지를 다운로드 할 때 `DispatchQueue.main.asyncAfter`를 통해 딜레이를 시켜서 해결할 수 있었다.

```swift
    func downloadImage(imageURL: [String]) {
        var images: [UIImage] = []
        if imageURL.isEmpty { return }
        for index in 0..<imageURL.count {
            guard let url = URL(string: imageURL[index]) else { return }
            
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
                if let image = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        images.append(UIImage(data: image) ?? UIImage())
                        if images.count == imageURL.count {
                            self.itemImages = images
                        }
                    }
                }
            }
        }
```

하지만 이미지의 갯수에 따라 동작하지 않는 상황이 존재했다. 딜레이를 1초로 주고 이미지가 5개가 존재한다면, 똑같이 이미지가 반영되지 않는 모습이 보였다. 다만 2초에 딜레이를 둔다면 5개도 동작이 정상정으로 수행됨을 알 수 있었다,

딜레이를 넉넉하게 줌으로써 기능이 동작하도록 했지만, 왜 딜레이를 줘야 기능이 정상적으로 작동하는 것인지 조금 더 디버깅을 구체적으로 해보면서 생각해보았다.

![스크린샷 2021-10-19 오후 10.11.38](https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-19%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2010.11.38.png)

위의 그림처럼 서버에 비밀번호를 확인하기 위해 `PATCH` 요청을 보내게 되면 동일한 이미지를 가지고 있지만 AWS 서버에는 다른 URL로 저장되게 되는데, 이때 딜레이를 주지 않고 이미지를 다운로드하게되면 기존의 이미지 URL로 요청하게 되서 처음에는 이미지가 보여지겠지만, 두 번째 동일한 동작을 하게되면 이미지 URL이 바뀌었기 때문에 서버로부터 이미지를 불러올 수 없게된다. 

그래서 딜레이를 주게되면 서버에 비밀번호 요청과 함께 (이미지는 동일하지만) 수정되는 사항을 동기화 시킬 시간을 주게되어 이미지가 동일한 동작에도 보여질 수 있게된다.

<br>

#### 개선

비빌번호 검증으로 인한 `PATCH` 요청은 어쩔 수 없는 부분인 것 같다. 이 부분은 서버와 협업을 통해 비밀번호만 검증할 수 있도록 API를 구현해달라고 요청해야 원활하게 처리할 수 있을 것 같다. 

이 부분에서 개선해보고 싶은 부분은 딜레이를 효율적으로 사용하는 것이다.

기존의 해결방식인 `동시큐`, `비동기 작업`이다. 이미지의 순서를 고려하지 않는다.

```swift
DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
    if let image = try? Data(contentsOf: url) {
        DispatchQueue.main.async {
            images.append(UIImage(data: image) ?? UIImage())
            if images.count == imageURL.count {
                self.itemImages = images
            }
        }
    }
}
```

![스크린샷 2021-10-20 오전 12.49.24](https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-20%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2012.49.24.png)

<br>

기존의 방식에서 이미지의 순서를 고려하고, 불필요할 수도 있는 딜레이를 하지 않기 위해 개선했다.
`CustomQueue`를 사용하여 **시리얼 큐를 통한 동기적 작업**으로 이미지의 순서를 보장했고, 딜레이를 이미지 전체에 한번만 줘서 **기존에 불필요 할 수 있었던 딜레이를 줄였다.**

작업을 보장하게 할 수 있는 방법은 여러가지가 존재한다.

1. `Custom Queue` 

   커스텀 큐는 **디폴트는 시리얼 큐**이며 동시큐로 만들 수도 있다.

   현재 이슈에서 이미지의 순서를 보장하기 위해 사용했다.

2. `Dispatch Semaphore` 

   동일한 자원에 접근하는 것을 막기위한 세마포어
   현재 이슈에서도 세마포어 1개로 지정하고 wait, signal를 통해 순서를 보장할 수 있다.

   하지만 동일한 자원 접근이 아니므로 Custom Queue의 시리얼이 더 적합하다고 판단했다.

3. `Dispatch Group`

   연관된 작업을 그룹으로 묶어서 전체가 끝남을 알리거나 최대 얼마나 기다리게 데드라인을 정할 수 있다.
   현재 이슈에서 이미지 순서보장에서 적합하지 않다고 생각했다. 

   

```swift
let dispatchSerialQueue = DispatchQueue(label: "이미지 다운로드 시리얼 큐")
var images: [UIImage] = []
if imageURL.isEmpty { return }
DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + 2) {
    for index in 0..<imageURL.count {
        guard let url = URL(string: imageURL[index]) else { return }
        dispatchSerialQueue.sync {
            if let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    images.append(UIImage(data: image) ?? UIImage())
                        if images.count == imageURL.count {
                            self.itemImages = images
                        }
                    }
                }
            }
        }
    }
}
```

![스크린샷 2021-10-20 오전 1.01.28](https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-20%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%201.01.28.png)

<br>

이제 여러번 동일한 동작을 해도 이미지가 올라오는 것을 확인할 수 있다.

<img src="https://user-images.githubusercontent.com/44525561/137949992-0b5c03f5-94f6-48f8-8c8e-6b23fd277ca4.gif" width="30%"> 
