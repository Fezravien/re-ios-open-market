# ๐ฌ Fezz Market 

[REST API](https://docs.google.com/spreadsheets/d/1_l6aPfEUchSF_ymIp0DjyH8Ic00GIoqvd8dO9f7_sx4/edit#gid=1153044612)๋ฅผ ์ด์ฉํ ์ํ `๋ชฉ๋ก ์กฐํ`, `์์ธ ์กฐํ`, `๋ฑ๋ก`, `์์ `, `์ญ์ ` ๊ธฐ๋ฅ์ ํ  ์ ์๋ ์ฑ์ด๋ค. 

<img src="https://user-images.githubusercontent.com/44525561/136771549-10d4b706-f10a-4aad-bf55-90f305051286.gif" width="30%"> <img src="https://user-images.githubusercontent.com/44525561/136771745-6a012d4d-c1b9-4261-af35-83770e4c14f7.gif" width="30%"> <img src="https://user-images.githubusercontent.com/44525561/136771649-1759ce47-a9a0-4868-8d15-b97b87a363d3.gif" width="30%">


## ๋ชฉ์ฐจ.

[1. ํ๋ก์ ํธ ๊ฐ์](#ํ๋ก์ ํธ-๊ฐ์)

[2. ๊ธฐ๋ฅ](๊ธฐ๋ฅ)

[3. ์ค๊ณ](#์ค๊ณ)

[4. ์ฌ์ฉ์ ๊ฒฝํ์ ๊ณ ๋ คํ ๊ฐ์  ์ฌํญ](#์ฌ์ฉ์-๊ฒฝํ์-๊ณ ๋ คํ-๊ฐ์ -์ฌํญ)

[5. ์ ๋ ํ์คํธ](#์ ๋-ํ์คํธ)

[6. ํธ๋ฌ๋ธ ์ํ](#ํธ๋ฌ๋ธ-์ํ)

<br>

## ํ๋ก์ ํธ ๊ฐ์
### Index

[- ํ๋ก์ ํธ ๊ด๋ฆฌ](#ํ๋ก์ ํธ-๊ด๋ฆฌ)

[- ์ค๊ณ](#์ค๊ณ)

[- ๊ธฐ์  ์คํ](#๊ธฐ์ -์คํ)

<br>

### ํ๋ก์ ํธ ๊ด๋ฆฌ

#### ๊นํ ํ๋ก์ ํธ๋ก Issue, PR ๊ด๋ฆฌํ๊ธฐ

[Market ๊ธฐ๋ฅ ๊ตฌํ ํ๋ก์ ํธ](https://github.com/Fezravien/re-ios-open-market/projects/1)

[Market ๋ฆฌํฉํ ๋ง ๋ฐ ํ์คํธ ํ๋ก์ ํธ](https://github.com/Fezravien/re-ios-open-market/projects/2)

<br>

[Issue](https://github.com/Fezravien/re-ios-open-market/issues) 

- To Do ๊ด๋ฆฌ 
- ํ๋ก์ ํธ ์งํํ๋ฉฐ ์๊ฐ
- ํ๋ก์ ํธ ๋ฒ๊ทธ

[PR](https://github.com/Fezravien/re-ios-open-market/pulls?q=is%3Apr+is%3Aclosed)

- ๊ธฐ๋ฅ ๋จ์ ๋ธ๋์น ์ ๋ฆฌ

<br>


#### ๊ธฐ๋ฅ ๋จ์ ๋ธ๋์น 

๋ชฉ์ ์ ๋ฐ๋ผ `feature`, `test` ๋ก ๋๋๊ณ  ๊ฐ๊ฐ์ ๊ธฐ๋ฅ์ ๋ฐ๋ผ ๋ธ๋์น๋ฅผ ๋๋ ์ ๊ฐ๋ฐ์ ์งํํ๋ค.

์๋ฃ๋ ๋ธ๋์น๋ `develop` ๋ธ๋์น์ ํฉ์ณ ํ๋์ ๋ฒ์ (๊ธฐ๋ฅ)์ ๋ง๋ค๊ณ  `Master`์ mergeํ๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%201.22.13.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  1.22.13" width="70%;" />  

##### ๋ธ๋์น ๋ณ ์์ฝ ๋ด์ฉ

- feature : ๊ธฐ๋ฅ ๊ตฌํ 

`feature/Model` : REST API์ ์๊ตฌ์ฌํญ์ ๋ง๋ Model ๊ธฐ๋ฅ ๊ตฌํ

`feature/NetworkandItemList` : ์๋ฒ๋ก ๋ถํฐ ์ํ ๋ชฉ๋ก ๋ฐ์ดํฐ์ ๋ฐ์ UICollectionView์ ๋์ฐ๊ธฐ ๊ธฐ๋ฅ ๊ตฌํ (GET)

`feature/ItemGrid` : ์๋ฒ๋ก ๋ถํฐ ์ํ ๋ชฉ๋ก ๋ฐ์ดํฐ๋ฅผ Grid ํ์์ UICollectionView์ ๋์ฐ๊ธฐ ๊ธฐ๋ฅ ๊ตฌํ (GET)

`feature/Registration` : ์๋ฒ์ ๋ฑ๋ก ์ํ ์ ๋ณด๋ฅผ ๋ณด๋ด์ ๋ฑ๋ก ๊ธฐ๋ฅ ๊ตฌํ (POST)

`feature/DetailPage` : ์๋ฒ์ ์ํ ์กฐํ๋ฅผ ์์ฒญํ์ฌ ์์ธ ์ ๋ณด ๋์ฐ๊ธฐ ๊ธฐ๋ฅ ๊ตฌํ (GET)

`feature/Edit` : ์ํ ์์ธ ํ์ด์ง์์ ์ํ ์์  ๊ธฐ๋ฅ ๊ตฌํ (PATCH)

`feature/Delete` : ์ํ ์์ธ ํ์ด์ง์์ ์ํ ์ญ์  ๊ธฐ๋ฅ ๊ตฌํ (DELETE)

`feature/ImageCache` ์ํ ๋ชฉ๋ก์์ ์ด๋ฏธ์ง ์บ์ฑ ๊ตฌํ


<br>


- test : ๋ฆฌํฉํ ๋ง ๋ฐ Unit Test

`test/MainPageTest` : ์ํ ๋ชฉ๋ก ํ์ด์ง, ๋ชจ๋ธ ๋ฆฌํฉํ ๋ง ๋ฐ ์ฝ๋ ๊ฐ์  ๊ทธ๋ฆฌ๊ณ  Unit Test ์ํ

`test/RegisterAndEditPage` : ์ํ ๋ฑ๋ก, ์์  ํ์ด์ง ๋ฆฌํฉํ ๋ง ๋ฐ ์ฝ๋ ๊ฐ์  ๊ทธ๋ฆฌ๊ณ  Unit Test ์ํ

`test/DetailPage` : ์ํ ์์ธ ํ์ด์ง ๋ฆฌํฉํ ๋ง ๋ฐ ์ฝ๋ ๊ฐ์ 

<br>

#### โ๏ธ Commit Message

๊ธฐ๋ฅ ๋จ์๋ก ๋๋  ๊ฐ๋ฐํ๋ ๊ณผ์ ์ ์ปค๋ฐ ๋ฉ์์ง๋ `๊น ์ด๋ชจ์ง`๋ฅผ ํ์ฉํด์ ๊ฐ์์ฑ๊ณผ ์ผ๊ด์ฑ์ ๋ํ๋ค. 


| Type     | Emoji | Description                                                  |
| :------- | :---: | :----------------------------------------------------------- |
| Feat     |   โจ   | ๊ธฐ๋ฅ (์๋ก์ด ๊ธฐ๋ฅ)                                           |
| Fix      |   ๐   | ๋ฒ๊ทธ (๋ฒ๊ทธ ์์ )                                             |
| Refactor |   โป๏ธ   | ๋ฆฌํฉํ ๋ง `๊ธฐ๋ฅ ๋ณ๊ฒฝ ์์`                                    |
| Style    |   ๐   | ํ์ผ ํ์/๋ค์ด๋ฐ, ํด๋ ๊ตฌ์กฐ/๋ค์ด๋ฐ ์์ ํ๊ฑฐ๋ ์ฎ๊ธฐ๋ ์์ `๋น์ฆ๋์ค ๋ก์ง์ ๋ณ๊ฒฝ ์์` |
| Style    |   ๐   | ์คํ์ผ (UI ์คํ์ผ ๋ณ๊ฒฝ)  `๋น์ฆ๋์ค ๋ก์ง์ ๋ณ๊ฒฝ ์์`         |
| Docs     |   ๐   | ๋ฌธ์ (๋ฌธ์ ์ถ๊ฐ, ์์ , ์ญ์ )                                 |
| Test     |   โ   | ํ์คํธ (ํ์คํธ ์ฝ๋ ์ถ๊ฐ, ์์ , ์ญ์ ) `๋น์ฆ๋์ค ๋ก์ง์ ๋ณ๊ฒฝ ์์` |
| Chore    |   ๐ง   | ๊ธฐํ (๋น๋, ์์คํ ํ์ผ ๋ฐ ์ค์  ๋ณ๊ฒฝ)                        |
| Comment  |   ๐ก   | ํ์ํ ์ฃผ์ ์ถ๊ฐ ๋ฐ ๋ณ๊ฒฝ                                     |
| Remove   |   ๐ฅ   | ํ์ผ, ํด๋ ์ญ์  ์์                                         |



<br>

### ๊ธฐ์  ์คํ

##### ์ฝ๋๋ฅผ ํตํ ๋ ์ด์์

๋ ์ด์์์ ์ฝ๋๋ก ์์ฑํ ์ด์ ๋ `์์ง๋`์ ๋ํ ๊ฐ๊ฐ์ ๊ตฌ์ฑ์์์ ์ค์ ์ ์ง๊ด์ ์ผ๋ก ๋ณด๊ณ  ์ถ์๋ค.  

| UI                                                           | Network              | Decoing / Encoding                                           | Caching | Test   |
| :----------------------------------------------------------- | :------------------- | :----------------------------------------------------------- | :------ | :----- |
| UICollectionView <br />UITextField<br />UITextView <br />UIImageVIew<br />UIAlert<br />UIActivityIndicatorView<br />UIScrollView | URLSession<br />Data | Codable <br />JSONEncoder <br />JSONDecoder <br />Data(multipart/form-data) | NSCache | XCTest |

<br>

## ๊ธฐ๋ฅ

### Index

[- ์ํ ๋ชฉ๋ก ์กฐํ](#์ํ-๋ชฉ๋ก-์กฐํ)

[- ์ํ ์์ธ ์กฐํ](#์ํ-์์ธ-์กฐํ)

[- ์ํ ๋ฑ๋ก](#์ํ-๋ฑ๋ก)

[- ์ํ ์์ ](์ํ-์์ )

[- ์ํ ์ญ์ ](#์ํ-์ญ์ )

<br>

### ์ํ ๋ชฉ๋ก ์กฐํ

 #### ์๋๋ฆฌ์ค

- ์ฑ์ ์คํํ๊ฒ ๋๋ฉด ์๋ฒ๋ก `GET` ๋ฉ์๋๋ฅผ ํตํด ์ํ ๋ชฉ๋ก์ ์์ฒญํ๊ฒ ๋๋ค.
- ์๋ฒ๋ก ๋ถํฐ ๋ฐ์ดํฐ๋ฅผ ์ ๋ฌ ๋ฐ์ผ๋ฉด ์ํ ๋ฆฌ์คํธ, ๊ทธ๋ฆฌ๋ ๋ชจ๋์ ๋ฐ๋ผ `UICollectionViewCell`์ ์๋ฐ์ดํธ ์์ผ์ค๋ค.
- ํ๋ฒ์ ์๋ฒ๋ก ๋ถํฐ ๋ฐ๋ ์ํ ๋ชฉ๋ก์ 20๊ฐ๋ก ํ๋จ์ผ๋ก ์คํฌ๋กค ์ ๋ค์ ํ์ด์ง๋ฅผ ์๋ฒ์ ์์ฒญํ๊ฒ ๋๋ค **(Infinite Scroll)**

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2011.31.31.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  11.31.31" width="90%;" />   

<br>

#### ์๋ฎฌ๋ ์ด์ 

์ต์ด์ ์๋ฒ๋ก ๋ถํฐ ๋ฐ์ ์ํ ๋ชฉ๋ก(20๊ฐ)์ ์คํฌ๋กค๋ก ๋ด๋ ค์ ๋ค์ ์ํ ๋ชฉ๋ก์ ์์ฒญํ๊ฒ ๋๋ฉฐ,

์ฑ๊ณต์ ์ผ๋ก ์์ฒญ๋๋ฉด ์คํฌ๋กค๋ง์ ํตํด ์ฐ์์ ์ผ๋ก ์ํ์ ๋ณผ ์ ์๋ค.


<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-11%20at%2002.32.18.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 02.32.18" width="30%;" /> <img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-11%20at%2002.32.51.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 02.32.51" width="30%;" />  

<br>

---

### ์ํ ์์ธ ์กฐํ

#### ์๋๋ฆฌ์ค

- ์ํ ๋ชฉ๋ก ํ์ด์ง์์ ํน์ ํ ์ํ์ ๋๋ฅด๊ฒ ๋๋ฉด ์๋ฒ์ ๋๋ฅธ ์ํ์ `id` ๋ก ์ํ ์์ธ ์ ๋ณด๋ฅผ ์์ฒญํ๊ฒ ๋๋ค.
- ์๋ฒ๋ก ๋ถํฐ ๋ฐ์ ์ํ ์์ธ ์ ๋ณด๋ฅผ `UIImageView`, `UILabel` ์ ๋์์ค๋ค.
- ์ด๋ฏธ์ง๋ 1๊ฐ ์ด์์ ๋ฐฐ์ด๋ก `Image Paging` ๋ก ์ค์์ดํ๋ฅผ ํตํด ๋ณผ ์ ์๊ฒ ๊ตฌ์ฑํ๋ค. 

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2011.35.34.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  11.35.34" width="90%;" /> 

<br>

#### ์๋ฎฌ๋ ์ด์

์ํ ๋ชฉ๋ก ํ์ด์ง์์ ํน์  ์ํ์ ๋๋ฅด๊ฒ ๋๋ฉด ์๋ฒ์ ์ํ ์กฐํ๋ฅผ ์์ฒญํ๊ฒ ๋๊ณ ,

์๋ต ๋ฐ์ ๋ฐ์ดํฐ๋ฅผ ์์ธ ํ์ด์ง์์ ๋ณด์ฌ์ฃผ๊ฒ ๋๋ค.

<img src="https://user-images.githubusercontent.com/44525561/136769132-2f871fe1-09c8-44b1-ab14-0c61e87e6044.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 02.52.01" width="30%;" /> 

<br>

---

### ์ํ ๋ฑ๋ก

#### ์๋๋ฆฌ์ค

- ์ํ ๋ชฉ๋ก ํ์ด์ง ์ฐ์ธก ์๋จ์ `+` ๋ฒํผ์ ๋๋ฅด๊ฒ ๋๋ฉด ์ํ ๋ฑ๋ก, ์์  ํ์ด์ง๋ก ์ด๋ํ  ์ ์๋ค.

<img src="https://user-images.githubusercontent.com/44525561/136769408-d2cfec16-c454-4421-ba20-0e9d77e6f337.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  3.02.30" width="60%;" /> 


<br>

- ์ด๋ฏธ์ง ์ถ๊ฐ ๋ฒํผ์ ๋๋ฌ ์ด๋ฏธ์ง๋ฅผ ์ต๋ 5์ฅ๊น์ง ์ ํ์ด ๊ฐ๋ฅํ๋ค. 

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%203.10.57.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  3.10.57" width="100%;" />


<br>

- ์ด๋ฏธ์ง๋ ์คํฌ๋กค์ ํตํด ์ข์ฐ๋ก ํ์ธํ  ์ ์์ผ๋ฉฐ, ๋๋ฌ์ ์ญ์ ๊ฐ ๊ฐ๋ฅํ๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%203.21.22.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  3.21.22" width="50%;" /> 

<br>

- ์ํ ์ ๋ณด ์๋ ฅ์ด ์๋ฃ๋๋ฉด ์๋ฒ์ ๋ฑ๋ก ํ Alert๋ก ๋ฑ๋ก ์๋ฃ๋ฅผ ์๋ฆฐ๋ค.
- ์๋ฃ ์๋ฆผ ํ์ธ ๋ฒํผ์ ๋๋ฅด๊ฒ ๋๋ฉด Request์ ์ํ ์๋ ฅ์ ๋ณด๋ฅผ ํฌํจ์์ผ ์๋ฒ์ `POST` ๋ฉ์๋๋ก ์ํ์ ๋ฑ๋กํ๋ค.
- ๋ฑ๋ก์ด ์๋ฃ๋๋ฉด ์๋ฒ๋ก ๋ถํฐ ๋ฑ๋ก๋ ์ํ์ ์ ๋ณด๋ฅผ ๋ฐ๊ฒ ๋๊ณ , ๊ทธ๊ฒ์ ์ํ ์์ธ ํ์ด์ง๋ก ์ด๋ํด์ ๋ณด์ฌ์ค๋ค.

<img src="https://user-images.githubusercontent.com/44525561/136769557-4da6dc2a-ea28-4485-8501-0c82ad9f1871.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์ค์  11.52.32" width="80%;" /> 

<br>

#### ์๋ฎฌ๋ ์ด์

์ํ ๋ฑ๋ก์ด ์ฑ๊ณตํ๊ฒ ๋๋ฉด ์ํ ๋ชฉ๋ก ํ์ด์ง๋ฅผ ๊ฑฐ์ณ ์ํ ์์ธ ํ์ด์ง์ ๋ฑ๋ก๋ ์ํ์ ๋ณด์ฌ์ฃผ๊ฒ ๋๋ค.

๋ํ, ์ํ ์์ธ ์ ๋ณด ์๋ ฅ์ ํค๋ณด๋ ๊ฐ์ญ์ ์์ด๋ค.


<img src="https://user-images.githubusercontent.com/44525561/136769763-dbacf4ed-b3dd-41aa-9e61-9ac73d0c7e25.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 03.33.12" width="30%;" /> <img src="https://user-images.githubusercontent.com/44525561/136769781-62be1921-aa5e-4153-9358-d94cbd120a97.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 03.34.11" width="30%;" />

<br>

---

### ์ํ ์์ 

#### ์๋๋ฆฌ์ค

- ์ํ ๋ชฉ๋ก์์ ์์ ํ๊ณ ์ ํ๋ ์ํ์ ๋๋ฅด๋ฉด ์๋ฒ์ ํน์  ์ํ์ `GET/id` ๋ก ์์ฒญํ๊ณ , ๋ฐ์ ๋ฐ์ดํฐ๋ฅผ ํตํด ์ํ ์์ธ ํ์ด์ง๋ก ์ด๋ํ์ฌ ๋ณด์ฌ์ค๋ค
- ์ํ ์์ธ ํ์ด์ง์ ์ฐ์ธก ์๋จ์ `Edit` ๋ฒํผ์ ํตํด Action Sheet๋ก ์ํ ์์ ์ด ๊ฐ๋ฅํ๋ค.
- ์ํ ์์ ์ ํ๊ธฐ ์ํด์๋ ํ์ฌ ์ํ์ ๋น๋ฐ๋ฒํธ๋ฅผ ์์์ผํ๋ค. ์๋ฒ์ `PATCH/id` ๋ก Request์ password๋ฅผ ๋ด์ ๋ณด๋ด๊ณ  ๋น๋ฐ๋ฒํธ๋ฅผ ๊ฒ์ฆํ๋ค.
- ๋น๋ฐ๋ฒํธ๋ฅผ ํ๋ฆฌ๋ฉด ํ์ธ ์๋ฆผ์ด ๋จ๊ณ , ์ ์์ ์ผ๋ก ๋น๋ฐ๋ฒํธ๋ฅผ ์๋ ฅํ๋ฉด ์์  ํ์ด์ง๋ก ์ด๋ํ๋ค.

<img src="https://user-images.githubusercontent.com/44525561/136769898-4b2e76b8-3690-4ec3-b8d3-e7ff31639abf.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 12.08.51" width="100%;" />

<br>

- ์ํ์ ์ ๋ณด๋ฅผ ์์ ํ๊ณ  ์ฐ์ธก ์๋จ์ `Done` ๋ฒํผ์ ํตํด ๋ฑ๋กํ  ์ ์๋๋ฐ ์ฌ๊ธฐ์๋ ํ์ฌ ์ํ์ `๋น๋ฐ๋ฒํธ๋ฅผ ๊ฒ์ฆ`ํ๋ค.
- ํ๋ฆฌ๋ฉด ์ํ ์์ ์ด ๋ถ๊ฐํ๋ฉฐ, ์ฑ๊ณต์ ์์ ๋ ์ํ์ ์๋ฐ์ดํธ๋ ์ํ๋ฅผ ์์ธ ํ์ด์ง์์ ๋ณด์ฌ์ค๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2012.19.51.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 12.19.51" width="75%;" />   

<br>

#### ์๋ฎฌ๋ ์ด์

<img src="https://user-images.githubusercontent.com/44525561/136770068-cc86a1c8-a89b-4736-b8c8-93c94f406edf.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 04.01.37" width="30%;" /> 

<br>

---

### ์ํ ์ญ์ 

#### ์๋๋ฆฌ์ค

- ์ํ ๋ชฉ๋ก์์ ์ญ์ ํ๊ณ  ์ถ์ ์ํ์ ๋๋ฅด๊ฒ ๋๋ฉด ์์ธ ํ์ด์ง๋ก ์ด๋ํ๊ฒ ๋๋ค
- ์์ธ ํ์ด์ง์ ์ฐ์ธก ์๋จ์ `Edit` ๋ฒํผ์ ๋๋ฌ ์ก์ ์ํธ์ ์ญ์ ๋ฒํผ์ ๋๋ฅด๊ฒ ๋๋ฉด ํ์ฌ ์ํ์ ๋น๋ฐ๋ฒํธ๋ฅผ ๊ฒ์ฆํ๋ค.
- ๋น๋ฐ๋ฒํธ๋ฅผ ํ๋ฆฌ๊ฒ๋๋ฉด ์๋์ด ๋จ๊ฒ๋๊ณ , ๋น๋ฐ๋ฒํธ๊ฐ ๋ง๋ค๋ฉด ์ํ ๋ชฉ๋ก์ด ์ด๊ธฐํ๋๋ฉฐ ์ต์๋จ์ผ๋ก ์คํฌ๋กค๋๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2012.19.36.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 12.19.36" width="100%;" />

<br>

#### ์๋ฎฌ๋ ์ด์

<img src="https://user-images.githubusercontent.com/44525561/136770224-3bff415d-a1e6-4aa5-992e-23063b783ac3.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 04.26.06" width="30%;" /> 

<br>

## ์ค๊ณ

### Index

[- MVVM ์ํคํ์ฒ](#mvvm-์ํคํ์ฒ)

[- ์ํ ๋ชฉ๋ก ์กฐํ ๊ตฌํ](#์ํ-๋ชฉ๋ก-์กฐํ-๊ตฌํ)

[- ์ํ ์์ธ ์กฐํ ๊ตฌํ](#์ํ-์์ธ-์กฐํ-๊ตฌํ)

[- ์ํ ๋ฑ๋ก ๊ตฌํ](#์ํ-๋ฑ๋ก-๊ตฌํ)

[- ์ํ ์์  ๊ตฌํ](#์ํ-์์ -๊ตฌํ)

[- ์ํ ์ญ์  ๊ตฌํ](์ํ-์ญ์ -๊ตฌํ)

<br>

### MVVM ์ํคํ์ฒ

MVVM ์ํคํ์ฒ๋ ์ถํ `์ ์ง๋ณด์`๋ฅผ ์งํํ๊ฑฐ๋ ์ฑ์ ๊ธฐ๋ฅ์ `ํ์ฅ`์ํฌ ๋ ์์กด์ฑ์ด ๋ฎ์ ๋น์ฉ๋ฉด์์ ์ฅ์ ์ด ์๊ณ , ํ์์ ์์ด์๋ ๋ถ๋ฆฌ ๋์ด์์ด ํธํ๊ฒ ์์ํ  ์ ์๋ค. ๊ทธ๋ฆฌ๊ณ  View์ ๋ก์ง์ด ๋ถ๋ฆฌ๋์ด `ํ์คํธ`๊ฐ ์์ํด์ง๋ค. 

ํ๋กํ ์ฝ์ ํตํด `์์กด์ฑ์ ์ญ์ `์ํค๊ณ , ์ธ๋ถ์์ `์์กด์ฑ์ ์ฃผ์`๋ฐ๋ ๋ฐฉ์์ผ๋ก ๋คํธ์ํฌ, ๊ธฐ๋ณธ ํ์๊ณผ ๋ฌด๊ดํ ํ์คํธ๋ฅผ ์งํํด๋ณผ ์ ์์๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%203.16.58.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 3.16.58" width="100%;" />

<br>

---

### ์ํ ๋ชฉ๋ก ์กฐํ ๊ตฌํ

#### ๋ฐ์ดํฐ ๋ฐ์ธ๋ฉ

<img src="https://user-images.githubusercontent.com/44525561/136770371-44931d1a-6fc5-418e-b6fa-ea8fe94824ad.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 3.35.32" width="70%;" /> 

`1๋ฒ` : ์ฌ์ฉ์๊ฐ ์ฑ์ ์คํ์์ผฐ์ ๋ `MarketViewController`๊ฐ ์ด๊ธฐํ๋๋๋ฐ, ์ด๋ `MarketViewModel`์ ์๋ฒ์์ ์ํ ๋ชฉ๋ก์ ์์ฒญํ๋ค.

`2๋ฒ` : `MarketViewModel` ์ ์์ฒญ์ ๋ฐ๋ผ ์๋ฒ์ ์ํ ๋ชฉ๋ก์ ๋น๋๊ธฐ๋ก ์์ฒญํ๊ฒ ๋๊ณ , ์๋ฒ๋ก ๋ถํฐ ๋ฐ์ดํฐ๊ฐ ์ค๋ฉด ๊ฐ์ง๊ณ  ์๋ `Model` ์ ๋ณํ์ํจ๋ค.

`3๋ฒ` : `Model` ์ ๋ณํ๋ก ํ๋กํผํฐ ์ต์ ธ๋ฒ๊ฐ ์ฌ์ฉ๋๋ฉฐ `View` ์ ๋ฐ์ธ๋ฉ๋ ํด๋ก์ ๊ฐ ํธ์ถ๋๊ฒ ๋๊ณ , View์์ ์์์ด ์ด๋ค์ง๊ฒ๋๋ค.

`MarketModel`์๋ ์ํ ๋ชฉ๋ก์ ๋ชจ๋ธ์ธ **์ด๋ฏธ์ง, ํ์คํธ** ๋ ๊ฐ์ง๊ฐ ์กด์ฌํ๋ค.

๊ทธ ์ดํ์ MarketCollectionViewCell์์ View๋ฅผ ์๋ฐ์ดํธ ์์ผ์ค๋ค.


<br>


#### UICollectionView Pagination

๋ฌดํ ์คํฌ๋กค์ ํ๋ ๋ฒ๋ฒ์์๋ 3๊ฐ์ง๊ฐ ์กด์ฌํ๋ค.

- ScrollYOffset

  UICollectionView๋ UIScrollView๋ฅผ ์์ํ๊ธฐ ๋๋ฌธ์ CollectionView Delegate ์์๋ง์ผ๋ก๋ ScrollView Delegate๋ฅผ ์์ ๋ฐ์ ์ ์๋ค.

   ScrollView delegate ์ค Scroll์ ๋ณํ๋ฅผ ๊ฐ์งํ  ์ ์๋ `scrollViewDidScroll`์ ์ฌ์ฉํ  ์ ์๋ค.

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

  ์คํฌ๋กค์ ๋ณํ๋ฅผ ๊ฐ์งํ์ฌ ๋์ด์ ๋ด๋ฆด ๊ณง์ด ์์์ ํ๋จํ์ฌ ์๋ก์ด ๋ฐ์ดํฐ๋ฅผ ๋ฐ์์จ๋ค. 

  ๋์์ ํ์คํ์ง๋ง ์คํฌ๋กค์ ํ ๋ ๋น ๋ฅด๊ฒ ๋ด๋ฆฌ๊ฒ ๋๋ฉด ๋ค๋ฅธ ๊ฒ๋ค์ ๋นํด ๋๋ ์ด๊ฐ ์๋๊ฒ ์ฒ๋ผ ๋๊ปด์ง๋ค.

  

- willDisplayCell

  UICollectionView Delegate์ CollectionView Willdisplay Cell ํจ์๊ฐ ์กด์ฌํ๋ค.

  ```swift
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          if indexPath.row > self.marketViewModel.marketItemsCount - 5 {
              // willDisplay ๋ง์ผ๋ก๋ cell์ด screen์ ๋ณด์ฌ์ก๋ค๊ณ  ๋ณด์ฅ๋์ง ์์.
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                  if self.marketCollectionView.visibleCells.contains(cell) {
                      self.page += 1
                      self.fetchMarketData(page: self.page)
                  }
              }
          }
      }
  ```

  ์ฝ๊ฐ์ ๋ฌธ์ ๊ฐ ๋ฐ์๋  ์ฌ์ง๊ฐ ์์ด๋ณด์๋ค. `WillDisplay`๋ ํธ์ถ์ด Cell์ ๋ค์ draw ํ ๋๊ฐ ๋ง๊ธด ํ์ง๋ง "๋ฐฐ๊ฒฝ ์์๊ณผ ๊ฐ์ด ๋ทฐ์์ ์ด์ ์ ์ค์ ํ ์ํ ๊ธฐ๋ฐ ์์ฑ์ ์ฌ์ ์ ํ  ์ ์๋ค" ๋ผ๋ [Apple Document](https://developer.apple.com/documentation/uikit/uitableviewdelegate/1614883-tableview) ๊ฒ์ ์ฝ์ด๋ณด๋ฉด ์ฐ์ ์ ๋์ง ์์์ ์คํฌ๋กค ์ ๋ชป ๋ณด์ฌ์ค ๊ฐ๋ฅ์ฑ์ด ์๋ค๊ณ  ํ๋จ๋๋ค. 

  ์ด๋ฌํ ์ด์๋ [์คํ์ค๋ฒํ๋ก์ฐ](https://stackoverflow.com/questions/48136553/tableview-willdisplaycell-called-for-cells-that-are-not-on-the-screen-tableview)์์๋ ๋ณผ ์ ์์๋ค.

- PrefetchRow

  iOS 10 ์ด์๋ถํฐ ์ฌ์ฉํ  ์ ์์ผ๋ฉฐ ์์ ๊ตฌ์ฑํ๋ ๋ฐ์ดํฐ๋ฅผ ๋ถ๋ฌ์ค๋ ์์์ ๋ฏธ๋ฆฌ ํ  ์ ์๋ ํ๋กํ ์ฝ์ธ `UICollectionViewDataSourcePrefetching`๋ก ์ฌ์ฉํ  ์ ์๋ค.

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

  ๋ชจ๋ธ์ ๋ฐ์ดํฐ ์๋ 2๊ฐ ์ฐจ์ด ๋๋ ์ํฉ(์๋๋ก ๋๋๊ทธ)์ ์๋ก์ด ๋ฐ์ดํฐ๋ฅผ ๋ฐ๋๋ค.

  ์๋ฒ ํต์ ๊ณผ ๊ฐ์ ๋น๋๊ธฐ ์ํฉ์์ ์์ฐ์ค๋ฝ๊ฒ `Pagination`์ ๊ตฌํํ  ์ ์๋ ํจ์๋ผ ์๊ฐ์ด ๋ ๋ค. [Apple Document](https://developer.apple.com/documentation/uikit/uicollectionviewdatasourceprefetching)๋ฅผ ๋ณด๋ฉด ์ฉ๋์ด ํฐ ๋ฐ์ดํฐ๋ ํฌํผ๋จผ์ค์ ๋ถ๋ด์ด ๋  ์ ์๋ ํฐ ์์์ ํจ๊ณผ์ ์ธ ๊ฒ ๊ฐ๋ค. 

  **์ด ๋ฐฉ๋ฒ์ด ์์ ๋ฐฉ๋ฒ๋ค๋ณด๋ค ์ด ํ๋ก์ ํธ์ ์ ํฉํ๋ค๊ณ  ์๊ฐ๋์ ์ฌ์ฉํ๋ค.**

<br>

---

### ์ํ ์์ธ ์กฐํ ๊ตฌํ

#### ๋ฐ์ดํฐ ๋ฐ์ธ๋ฉ

<img src="https://user-images.githubusercontent.com/44525561/136770497-894630ef-4b58-4b3d-ad57-73aa04eaec14.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 4.23.17" width="90%;" /> 

`1๋ฒ` : ์ฌ์ฉ์๊ฐ ํน์  ์ํ์ ๋๋ฅด๊ฒ ๋๋ฉด `MarketRegisterAndEditViewModel`์์ ์๋ฒ๋ก ์ํ์ `id` ๊ฐ์ ๊ฐ์ง๊ณ  ์์ฒญ์ ๋ณด๋ด๊ฒ๋๋ค. 

`2๋ฒ` : ์๋ฒ๋ก ๋ถํฐ ๋ฐ์ ๋ฐ์ดํฐ๋ฅผ `MarketModel`์ ์ ์ฅํ๊ฒ ๋๋ค.

`3๋ฒ` : `MarketModel` ์ ํ๋กํผํฐ ์ต์ ธ๋ฒ๋ฅผ๊ฐ Model์ ๋ณํ๋ฅผ ๊ฐ์งํ๊ณ  View์ ๋ฐ์ธ๋ฉ๋ ํด๋ก์ ๋ฅผ ์คํ์ํค๊ฒ ๋๋ค.

<br>

#### Image Pagination

 ์๋ฒ๋ก ๋ถํฐ ๋ฐ์ ์ด๋ฏธ์ง์ ๊ฐฏ์๋งํผ ๋ฐ๋ณต๋ฌธ์ ๋๋ฉฐ `UIImageView` ๊ฐ์ฒด๋ฅผ ์์ฑํ์ฌ X, Y ์์น๋ฅผ ๋ง์ถ๋ค.

๊ทธ๋ฆฌ๊ณ  ๋ค์ ์ด๋ฏธ์ง๋ ๋์ผํ ํฌ๊ธฐ๋ก X์ถ์ index๋งํผ ๊ณฑํด ์์ผ๋ก ์๊ฒ ๋๋ค. ๋ช๊ฐ์ ์ด๋ฏธ์ง๊ฐ ๋ค์ด ์๋์ง `.numberOfPages`๋ฅผ ์ฌ์ฉํ๋ค.

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

### ์ํ ๋ฑ๋ก ๊ตฌํ

#### ๋ฐ์ดํฐ ๋ฐ์ธ๋ฉ

<img src="https://user-images.githubusercontent.com/44525561/136770602-6ee15332-d9ab-4dfa-8124-8f8824735d1b.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 4.25.25" width="70%;" />  

`1๋ฒ` 

 ์ด๋ฏธ์ง, ์ ๋ชฉ, ํํ, ๊ฐ๊ฒฉ, ํ ์ธ๊ฐ๊ฒฉ, ์๋, ์์ธ์ ๋ณด ๊ฐ๊ฐ ๋ฐ์ดํฐ ๋ฐ์ธ๋ฉ์ด ๋์ด์์ด ์ฌ์ฉ์ ์ธํ์ ๋ฐ๋ผ ๊ฐ๊ฐ `MarketRegisterAndEditViewModel` ์ ํธ์ถ๊ฒ ๋๋ค.

`2๋ฒ` 

๊ฐ๊ฐ์ ์ฌ์ฉ์ ์ธํ์ ๋ฐ๋ผ ๊ฐ์ด ๋ค์ด์ค๊ฒ ๋๋ฉด ๊ฐ๊ฐ์ ๋ชจ๋ธ์ ๊ฐ๋ค์ ์ ์ฅํ๊ฒ๋๋ค.

`3๋ฒ` 

์ฌ์ฉ์ ์ธํ์ ๋ฐ๋ผ ๊ฐ๊ฐ์ ๋ชจ๋ธ์๋ ํ๋กํผํฐ ์ต์ ธ๋ฒ๊ฐ ์์ผ๋ฉฐ, ๋ชจ๋ธ์ด ๋ณ๊ฒฝ๋๋ฉด ๋ฐ์ธ๋ฉ ๋์ด์๋ ํด๋ก์ ๊ฐ ํธ์ถ๋์ View์ UI๋ฅผ ์๋ฐ์ดํธํ๊ฒ ๋๋ค.


<br>

### multipart/form-data๋ก POST ์์ฒญํ๊ธฐ

`multipart/form-data` JSON๊ณผ ๋ค๋ฅด๊ฒ ํฌ๋ฉง์ ๋ง์ถฐ์ผ POST๋ฅผ ์ ์์ ์ผ๋ก ์ํํ  ์ ์๋ค.

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

#### ์ฌ์ฉ์ ์๋ ฅ ์ ์ฝ์ฌํญ

<img src="https://user-images.githubusercontent.com/44525561/136770675-fd3c2d0c-f642-4a26-a1ca-5b797673ff83.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 4.49.18" width="90%;" /> 

<br>

#### ์์ธ ์ ๋ณด ์๋ ฅ์ ํค๋ณด๋ ์กฐ์ 

<img src="https://user-images.githubusercontent.com/44525561/136770771-4187e89e-9c14-4b8a-bd3f-cf9e5279aa03.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-11 at 03.34.11" width="30%;" /> 

```swift
// ํค๋ณด๋ ์ต์ ๋ฒ ๋ฑ๋ก
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

// ๋ด๋ ค๊ฐ๊ณ  ์ฌ๋ผ๊ฐ๋ ์ก์
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

 ์ํ ์์ธ ์ ๋ณด UITextView๋ฅผ ์๋ ฅํ๋๋ฐ ํค๋ณด๋๊ฐ ์ฌ๋ผ์ ์๋ ๋ฒ์๋ฅผ ๋์ด์๋ฉด ํค๋ณด๋ ๋ฐ์ผ๋ก ์ปค์๊ฐ ๋ด๋ ค๊ฐ ๋ฌด์์ ์ฐ๊ณ  ์๋์ง ํ์ธ์ด ์๋๋ ๋ฌธ์ ๊ฐ ์์๋ค. ์ด ๋ฌธ์ ๋ฅผ ํด๊ฒฐํ๊ธฐ ์ํด ํค๋ณด๋๊ฐ ์ฌ๋ผ์ค๊ณ  ๋ด๋ ค๊ฐ์ ์ธ์ํ๊ธฐ ์ํด ํค๋ณด๋ ์ต์ ธ๋ฒ๋ฅผ ์ค์ ํ๊ณ , ์ด์ ๋ฐ๋ผ ์ก์์ ์ค์ ์ปค์๊ฐ ํค๋ณด๋ ๋ฐ์ผ๋ก ๋ด๋ ค๊ฐ๋ ๊ฒ์ ๋ฐฉ์งํ๋ค.

ํค๋ณด๋๊ฐ ์ผ๋ง๋ ์ฌ๋ผ์ค๋์ง Frame์ ๊ตฌํด์ `contentInset`๋ฅผ ์กฐ์ ํ๋ค.

UIEdgeInsets์ bottom์์ ํค๋ณด๋ ๋์ด์์ ๋ทฐ์ bottom ์ธ์ดํ ์์ญ๊ณผ์ ์ฐจ๋ฅผ ํตํด์ ์ปค์๋ฅผ ์์น์์ผฐ๋ค.

<br>

---

### ์ํ ์์  ๊ตฌํ

#### ์ํ ์์  ํ ์๋ก๊ณ ์นจ (๋ฐ์ดํฐ ๋ฐ์ธ๋ฉ)
<img src="https://user-images.githubusercontent.com/44525561/136770891-0e764fc2-9745-4072-b547-7eedb097eed8.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 5.11.43" width="80%;" /> 

```swift
// ์ํ ๋ฑ๋ก/์์  ํ์ด์ง์์ ์์ ์ด ์๋ฃ๋ ํ
DispatchQueue.main.async {
    self.indicater.stopAnimating()
    self.alert(title: "์์ ์ด ์๋ฃ๋์์ต๋๋ค") {
        self.modificationDelegate?.refreshDetailItem(item: item)
        self.navigationController?.popViewController(animated: true)
    }
}

// ๋ธ๋ฆฌ๊ฒ์ดํธ ํจํด์ผ๋ก ์ํ ๋ฑ๋ก/์์  ํ์ด์ง๋ก๋ถํฐ ๋ฐ์ ์ด๋ฒคํธ
func refreshDetailItem(item: Item) {
    self.marketDetailViewModel.refreshItem(item: item)
    self.updateDelegate?.refreshMainItemList()
}
```

์ํ ๋ฑ๋ก/์์  ํ์ด์ง์์ ๋ฑ๋ก์ด ์๋ฃ๋๊ฒ ๋๋ฉด ๋ธ๋ฆฌ๊ฒ์ดํธ ํจํด์ผ๋ก ์ํ ์์ธํ์ด์ง๋ก ์๋ฐ์ดํธ๋ฅผ ์์ฒญํ๊ฒ ๋๋ค.

์ฌ๊ธฐ์ ์ฃผ์ ํด์ผํ๋ ์ ์ ๋น๋๊ธฐ ์ฐธ์กฐ์ ๋ํด ์กฐ์ฌํด์ผ๋๋๋ฐ ์ํ ๋ฑ๋ก/์์ ์ด ์ฌ๋ผ์ง๊ณ  ๋๋ฉด ๋ฐ์ดํฐ๋ฅผ ์๋ฐ์ดํธ ํ๋ผ๋ ๋ช๋ น์กฐ์ฐจ ์๋ฏธ๊ฐ ์์ด์ง๊ธฐ ๋๋ฌธ์ ์ฌ๊ธฐ์๋ ๊ฐํ ์ฐธ์กฐ๋ฅผ ๊ฐ์ง๊ณ  ์์ด์ผ ํ๋ค.

<br>

---

### ์ํ ์ญ์  ๊ตฌํ

์ญ์ ๋ ์๋ ฅ๋ฐ์ `password` ๋ฅผ JSONEncode์ ํ์ฉํ์ฌ ์๋ฒ์ POST ํด์ ๋น๋ฐ๋ฒํธ ๊ฒ์ฆ ํ ๋น๋ฐ๋ฒํธ๊ฐ ๋ง๋ค๋ฉด ์๋ฒ์์ ๊ทธ ์ํ์ ์ญ์ ํ๊ฒ ๋๋ค.

<br>

## ์ฌ์ฉ์ ๊ฒฝํ์ ๊ณ ๋ คํ ๊ฐ์  ์ฌํญ

[- ์ํ ๋ฑ๋ก ํ ๋ฑ๋ก๋ ์ํ์ผ๋ก ์ด๋ ๋ฐ ์ํ ๋ชฉ๋ก ์ด๊ธฐํ](#์ํ-๋ฑ๋ก-ํ-๋ฑ๋ก๋-์ํ์ผ๋ก-์ด๋-๋ฐ-์ํ-๋ชฉ๋ก-์ด๊ธฐํ)

[- ์ํ ์์  ํ ์์ ๋ ์ํ์ผ๋ก ์์ธ ํ์ด์ง ์๋ฐ์ดํธ ๋ฐ ์ํ ๋ชฉ๋ก ์ด๊ธฐํ](#์ํ-์์ -ํ-์์ ๋-์ํ์ผ๋ก-์์ธ-ํ์ด์ง-์๋ฐ์ดํธ-๋ฐ-์ํ-๋ชฉ๋ก-์ด๊ธฐํ)

[- ์ํ ๋ชฉ๋ก์์ ์ฌ์ฉ์ ๊ฒฝํ ํฅ์](์ํ-๋ชฉ๋ก์์-์ฌ์ฉ์-๊ฒฝํ-ํฅ์)

<br>

### ์ํ ๋ฑ๋ก ํ ๋ฑ๋ก๋ ์ํ์ผ๋ก ์ด๋ ๋ฐ ์ํ ๋ชฉ๋ก ์ด๊ธฐํ

์ํ ๋ฑ๋ก ํ ์๋ฃ Alert๋ฅผ ๋์ฐ๊ณ  ์ํ ๋ชฉ๋ก ์ด๊ธฐํ๋ก ๋ฑ๋ก์ ๋๋ด๋ ๊ฒ์ด ์๋๋ผ, ์ฌ์ฉ์์๊ฒ ๋ฑ๋ก๋ ์ํ์ด ์ด๋ป๊ฒ ํ์๋๋์ง ์์ธ ์ํํ์ด์ง๋ฅผ ํตํด์ ํ์ธ ์์ผ์ ์๋ชป ๋ฑ๋ก๋์์ผ๋ฉด ์์ , ์ญ์ ๋ฅผ ๋ค์ ํ  ์ ์๊ฒ ํ๋ค. 

์ฌ์ฉ์๊ฐ ๋ฑ๋ก๋ ์ํ ํ์ธ์ด ๋๋๋ฉด ์ํ ๋ชฉ๋ก ํ์ด์ง๋ก ๋ค์ ๋์๊ฐ๊ฒ ๋๋๋ฐ, ๊ทธ ์์ ์ ์ํ ๋ชฉ๋ก์ ์ด๊ธฐํ ํ ์๋ฒ๋ก ์๋ก์ด ๋ชฉ๋ก์ ์์ฒญํ๋ค. 
๊ทธ ์ด์ ๋ ํ์ฌ ์ฌ์ฉ์๊ฐ ์๋ฐ์ดํธ ํ๋ ๋์ ๋ค๋ฅธ ์ฌ์ฉ์ ๋ํ ์๋ฒ์ ๋ฑ๋ก, ์์ , ์ญ์ ๋ฅผ ํ  ์ ์์ผ๋ฏ๋ก ์ํ๋ค์ ์ต์ ํ ํ๋ ์์ ์ด ํ์ํ๊ธฐ ๋๋ฌธ์ด๋ค.

<img src ="https://images.velog.io/images/fezravien/post/d0e0e299-db3c-43c1-8a11-9acf298103cd/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-02%20at%2020.05.38.gif" width="30%"> 

<br>

### ์ํ ์์  ํ ์์ ๋ ์ํ์ผ๋ก ์์ธ ํ์ด์ง ์๋ฐ์ดํธ ๋ฐ ์ํ ๋ชฉ๋ก ์ด๊ธฐํ

์ํ ์์ธ ํ์ด์ง๋ฅผ ํตํด ์ํ์ ์์  ํ ์ฌ์ฉ์์๊ฒ ์ํ์ด ์์ ๋ ์ํ๋ฅผ ํ์ธ์์ผ์ค๋ค. 
์ฌ์ฉ์๊ฐ ์ํ ํ์ธ์ด ๋๋๋ฉด ์ํ ๋ชฉ๋ก์ด ์ด๊ธฐํ๋๊ณ , ์๋ฒ๋ก๋ถํฐ ์ต์ ํ๋ ์ํ ๋ชฉ๋ก์ ์์ฒญํ๊ฒ ๋๋ค. 
๊ทธ ์ด์ ๋ ํ์ฌ ์ฌ์ฉ์๊ฐ ์๋ฐ์ดํธ ํ๋ ๋์ ๋ค๋ฅธ ์ฌ์ฉ์ ๋ํ ์๋ฒ์ ๋ฑ๋ก, ์์ , ์ญ์ ๋ฅผ ํ  ์ ์์ผ๋ฏ๋ก ์ํ๋ค์ ์ต์ ํ ํ๋ ์์ ์ด ํ์ํ๊ธฐ ๋๋ฌธ์ด๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-11%20at%2004.01.37.gif" width="30%"> 

<br>

### ์ํ ๋ชฉ๋ก์์ ์ฌ์ฉ์ ๊ฒฝํ ํฅ์

#### ์ํ ๋ชฉ๋ก ์๋ฐ์ดํธ

์๋ฒ์ ์ํ ๋ชฉ๋ก์ ์์ฒญํ์ ๋, ์ด๋ฏธ์ง๋ URLํํ๋ก ๋ฐ๊ฒ ๋๋๋ฐ ์ด๋ฏธ์ง, ํ์คํธ๋ฅผ ๊ฐ๊ฐ ๋น๋๊ธฐ๋ก ํ๊ฒ ๋๋ฉด ์ผ์ชฝ์ฒ๋ผ ํ์คํธ๊ฐ ๋จผ์  ๋จ๊ณ  ๊ทธ ๋ค์์ ์ด๋ฏธ์ง๋ค์ด ๋จ๋ ๊ฒ์ ๋ณผ ์์๋ค. ์๋ํ๋ฉด ์ด๋ฏธ์ง๋ URL์ ํตํด ํ๋ฒ๋ ๋คํธ์ํฌ ์์์ ํด์ผ๋๋ ๋ฌด๊ฑฐ์ด ์ผ์ด๊ธฐ ๋๋ฌธ์ด๋ค.

์ฌ์ฉ์ ๊ฒฝํ์ผ๋ก ์๊ฐํ์๋ ์ฑ์ด ์กฐ๊ธ ๋๋ ์ด๊ฐ ์๊ฒจ๋ ์ค๋ฅธ์ชฝ์ฒ๋ผ ์ด๋ฏธ์ง๊ฐ ๋ค์ด๋ก๋ ๋ ์์ ์ ํ๋ฒ์ ๋์์ฃผ๋๊ฒ์ด ์ข๋ ์ข๋ค๊ณ  ํ๋จํด์ ์์ ํ๋ค.

<img src="https://images.velog.io/images/fezravien/post/482fafb3-74e6-4566-97a0-f4b54e0aff71/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-06%20at%2021.22.07.gif" width="30%"> <img src="https://images.velog.io/images/fezravien/post/71d6d425-1a09-4d9e-b6cc-d34e7cde9eb8/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-06%20at%2022.01.22.gif" width="30%"> 



#### ์ด๋ฏธ์ง ์บ์ฑ

์๋ฒ๋ก ๋ถํฐ ๋ฐ์ดํฐ๋ฅผ ๋ฐ์ผ๋ฉด ์ด๋ฏธ์ง๋ URL๋ก ๋ฐ๊ฒ๋์ด ๋ค์ ๋คํธ์ํฌ๋ฅผ ํตํด ์ด๋ฏธ์ง๋ฅผ ๋คํธ์ํนํด์ผ๋์ด ๋ฌด๊ฑฐ์ด ์์์ผ ์ ๋ฐ์ ์๋ค.
์ผ์ชฝ์ฒ๋ผ ์บ์ฑ์ด ๋์ง ์์ผ๋ฉด ์ด๋ฏธ ๋ฐ์๋ ์ด๋ฏธ์ง๋ฅผ ๋ค์ ๋คํธ์ํฌ๋ฅผ ํ๊ธฐ ๋๋ฌธ์ ๋ฐ์ ๋ถ๋ถ์ผ๋ก ์คํฌ๋กคํ๋ฉด ๋ถ๋๋ฝ์ง ๋ชปํ ํ๋ฉด์ ๋ณผ ์ ์๋ค.
์ค๋ฅธ์ชฝ ์ฒ๋ผ `NSCache`๋ฅผ ํตํด ์บ์ฑ์ ํ๊ฒ๋๋ฉด ์ด๋ฏธ ๋ฐ์ ์ด๋ฏธ์ง ๊ฐ์๊ฒฝ์ฐ ์บ์์์ ๊ฐ์ ธ์ค๊ฒ ๋์ด ์ฌ์ฉ์ ๊ฒฝํ์ ํฅ์์ํฌ ์ ์๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-29%20at%2017.03.57.gif" width="30%"> <img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-29%20at%2017.10.35.gif" width="30%">



<br>

## ์ ๋ ํ์คํธ

### Index

[- ์ ๋ ํ์คํธ๋ฅผ ์งํํ ์ด์ ](#์ ๋-ํ์คํธ๋ฅผ-์งํํ-์ด์ )

[- ์ ๋ ํ์คํธ ์งํํ ๋ถ๋ถ](#์ ๋-ํ์คํธ-์งํํ-๋ถ๋ถ)

<br>

### ์ ๋ ํ์คํธ๋ฅผ ์งํํ ์ด์ 

 ์ ๋ ํ์คํธ๋ฅผ ํ๋ฉด์ ์์ฑํ ์ฝ๋๊ฐ ์๋ํ ๋๋ก ์ ๋์ํ๋์ง ๊ฒ์ฆํ๊ธฐ ์ํ ์ ์ฐจ์ด๊ณ , ๊ฒ์ฆ์ ํตํด ์ฌ์ด๋ ์ดํํธ ๋ํ ์ต๋ํ ์ค์ผ ์ ์๋ ์๋ฐฉ์ฑ์ด ๋  ์ ์๋ค๊ณ  ์๊ฐํ๋ค. ์ถํ ๊ฐ๋ฐ ๊ณผ์ ์์ ์๊ตฌ์ฌํญ์ ๋ณ๊ฒฝ์ด๋ ๋ฆฌํฉํ ๋ง์ผ๋ก ์ธํด ์ฝ๋๊ฐ ์์ ๋๋ค๋ฉด ๋ ์ ์ฐํ๊ณ  ์์ ์ ์ด์ ๋์ํ  ์ ์๊ฒ ๋๊ณ , ์ด๋ฌํ  ์งํํ๋ฉด์ ์ฝ๋ ๋ํ Testableํ๊ฒ ์์ ํ  ์ ์์ด ์ฝ๋์ ํ์ง ๋ํ ํฅ์๋๋ ํจ๊ณผ๋ฅผ ๊ฐ์ ธ์ฌ ์ ์๋ค๊ณ  ์๊ฐํ๋ค. 

<br>

### ์ ๋ ํ์คํธ ์งํํ ๋ถ๋ถ

<img src="https://user-images.githubusercontent.com/44525561/136770969-5c17f959-4ef7-4eb2-85ea-acd2c13e2109.png" alt="์คํฌ๋ฆฐ์ท 2021-10-11 ์คํ 5.46.39" width="80%;" /> 

1. URLProtocol๋ก ๊ฐ์ง Session์ ๋ง๋ค์ด ๋คํธ์ํฌ์ ๋ฌด๊ดํ ํ์คํธ๋ฅผ ์งํ

   - ์ค๋ฅ๊ฐ ์กด์ฌํ๋์ง
   - ์๋ฒ ์๋ต์ ์ ์ฒ๋ฆฌํ๋์ง
   - ๋ฐ์ดํฐ๋ฅผ ์ ์ ๋ฌํด ์ฃผ๋์ง

2. URLProtocol๋ก ๋คํธ์ํฌ์ ๋ฌด๊ดํ ํ์คํธ๋ฅผ ์งํํ๊ณ , ์์ฒญ์ ๋ง๋ค๊ณ  ์๋ต์ ๋ฐ๋ ํ์คํธ๋ฅผ ์งํ

   - ์๋ฒ๋ก ๋ณด๋ผ ์์ฒญ (GET, POST, PATCH, DELETE)์ ์ณ๋ฐ๋ฅด๊ฒ ๋ง๋๋์ง
   - ์คํจํ๋ ๋คํธ์ํฌ, ์ฑ๊ณตํ๋ ๋คํธ์ํฌ์ ๋ฐ๋ผ ํธ๋ค๋ง์ ํ๊ณ  ์๋์ง
   - ์ฑ๊ณตํ๋ ๋คํธ์ํฌ๋ก๋ถํฐ ๋ฐ์ ๋ฐ์ดํฐ๋ฅผ ํ์ฑ์ ์ํ๋์ง 
   - JSONEncoder, JSONDecoder ์ธ๋ถ์์ ์์กด์ฑ ์ฃผ์์ ๋ฐ์ ํ์คํธ ์งํ

3. URLPorotocol๋ก ๋คํธ์ํฌ์ ๋ฌด๊ดํ ํ์คํธ๋ฅผ ์งํํ๊ณ , 1, 2์์ ํ๋ ๊ฒ์ ํธ๋ค๋ง๊ณผ View์ ์ฌ๋ฆด ๋น์ฆ๋์ค ๋ก์ง ํ์คํธ

   - ๊ฐ๊ฒฉ, ์๋์ ์ํฉ์ ๋ฐ๋ผ ์ ๊ฐ๊ณตํ๋์ง (ํ ์ธ ๊ฐ๊ฒฉ์ ์ ๋ฌด, ์๋ 0๊ฐ)
   - ๋คํธ์ํฌ์ ๋ํ ํธ๋ค๋ง์ ํ๊ณ  ์๋์ง 
   - ๋คํธ์ํฌ๋ก ๋ถํฐ ๋ฐ์ ๋ฐ์ดํฐ๋ฅผ ๋ชจ๋ธ์ ์ ์ ์ฅํ๋์ง 

   

๋คํธ์ํฌ์ ๋ฌด๊ดํ ํ์คํธ๋ฅผ ์ค์ ์ ์ผ๋ก ์งํํ๊ณ , ๊ฐ๊ฐ์ ๊ฐ์ฒด์์ ์ต๋ํ ์์กด์ฑ์ ๋ถ๋ฆฌํ๋ค.

ํ๋กํ ์ฝ์ ํตํด ์์กด์ฑ์ ์ญ์ ์ํค๊ณ , ์ธ๋ถ์์ ์์กด์ฑ์ ์ฃผ์ํ๋ ๋ฐฉ์์ผ๋ก ์์กด์ฑ์ ๋ถ๋ฆฌํ๋ค.

- URLSession
- JSONDecoder
- JSONEncoder
- Network(Session์ ๊ฐ์ง๊ณ  ์๋ ๋คํธ์ํฌ ๋ฉ์๋)

[URLSessionDataTask init](https://developer.apple.com/documentation/foundation/urlsessiondatatask/3240618-init) ์ด ๋ถ๋ถ์ด `Deprecated` ๋์ด Session์ ์์กด์ฑ ๋ถ๋ฆฌ๋ก MockSession์ผ๋ก ํ์คํธ ํ์ง ๋ชปํ๋ค.

๊ทธ๋์ ์ฌ์ฉํด๋ณธ ๋ฐฉ๋ฒ์ด URLProtocol์ ์ฌ์ฉํ ๊ฐ์ง ๋คํธ์ํน ๋ฐฉ์์ด๋ค.

`์ค๋ฅ`์ `์๋ต`์ ์กฐ์ ํด์ ๊ฐ์ง ๋คํธ์ํฌ๋ก์จ ๋คํธ์ํฌ์ ๋ฌด๊ดํ ํ์คํธ๋ฅผ ์งํํ  ์ ์๋ค.

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

## ํธ๋ฌ๋ธ ์ํ

### Index

[- ์ํ ๋ชฉ๋ก ํ์ด์ง์์ ์ฌ์ฌ์ฉ Cell์ ๋ฌธ์ ](#์ํ-๋ชฉ๋ก-ํ์ด์ง์์-์ฌ์ฌ์ฉ-cell์-๋ฌธ์ )

[- ์ํ ๋ฑ๋ก ํ ์ํ ๋ชฉ๋ก ํ์ด์ง๋ฅผ ํตํด ์ํ ์์ธ ํ์ด์ง๋ก ๋ฑ๋ก๋ ์ํ ๋ณด์ฌ์ฃผ๊ธฐ ๋ฌธ์ ](#์ํ-๋ฑ๋ก-ํ-์ํ-๋ชฉ๋ก-ํ์ด์ง๋ฅผ-ํตํด-์ํ-์์ธ-ํ์ด์ง๋ก-๋ฑ๋ก๋-์ํ-๋ณด์ฌ์ฃผ๊ธฐ-๋ฌธ์ )

[- ์ํ ๋ฑ๋ก, ์์  ํ์ด์ง์ ์ํ ์์ ์ผ๋ก ์ง์ํ์ ๋ ์ด๋ฏธ์ง๊ฐ ๋ณด์ด์ง ์๋ ๋ฌธ์ ](#์ํ-๋ฑ๋ก-์์ -ํ์ด์ง์-์ํ-์์ ์ผ๋ก-์ง์ํ์-๋-์ด๋ฏธ์ง๊ฐ-๋ณด์ด์ง-์๋-๋ฌธ์ )

<br>

### ์ํ ๋ชฉ๋ก ํ์ด์ง์์ ์ฌ์ฌ์ฉ Cell์ ๋ฌธ์ 

CollectionView Cell ์ฌ์ฌ์ฉ ๋ฌธ์  ํด๊ฒฐ ๋ฐฉ์์ผ๋ก ์ด๊ธฐํ ๋ฐฉ์์ธ `prepareForReuse` ์ฌ์ฉํ๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-01%20at%2016.12.00.png" alt="Simulator Screen Shot - iPhone 12 Pro Max - 2021-09-01 at 16.12.00" width="30%;" /><img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-09-01%20at%2016.12.30.png" alt="Simulator Screen Shot - iPhone 12 Pro Max - 2021-09-01 at 16.12.30" width="30%;" />

๋์ผํ ์๋ฎฌ๋ ์ดํฐ์์ ์๋ ๊ฐ๊ฒฉ์ ์ค์ด ์๊ธฐ๋ฉด discountPrice๊ฐ ์กด์ฌํ๋ฏ๋ก ๊ฐ์ฅ ์์ Cell์ฒ๋ผ ์๋ก์ด ๊ฐ๊ฒฉ์ ์๋ ค์ฃผ๋๋ก ํด์ผํ์ง๋ง, ์๋ซ์ชฝ Cell์ `discountPrice`๊ฐ ์กด์ฌํ์ง ์๋๋ฐ ์ค์ด ๊ทธ์ด์ง๋ ๊ฒ์ ๋ณผ ์ ์๋ค.

์ค๋ฅธ์ชฝ ๊ทธ๋ฆผ์ ์๋๋ก ์คํฌ๋กค ํ ๋ค์ ์์น์ ๋์์์ ๋์ด๋ค. Cell์ด reuse๋๋ฉด ์ํ๊ฐ ๋ณ๊ฒฝ๋๋ ๊ฒ์ ๋ณผ ์ ์๋ค (์ฃผํฉ - ์ ์์ผ๋ก ๋์์ด)

์ด๋ฌํ ํ์์ ํ ๋๋ก Cell์ด Reuse๋๋ฉด์ ์ด๊ธฐํ์ ๋ฌธ์ ๊ฐ ์๊ฒผ๋ค๊ณ  ์๊ฐ์ ํ๊ฒ๋์๋ค.

Cell์ด CollectionView์์ ์ฌ์ฌ์ฉ๋  ๋ ์ด๊ธฐํ ํ  ์ ์๋ `prepareForReuse`๋ฅผ overrideํ์ฌ ์ฌ์ฉํ๋ค. 

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


### ์ํ ๋ฑ๋ก ํ ์ํ ๋ชฉ๋ก ํ์ด์ง๋ฅผ ํตํด ์ํ ์์ธ ํ์ด์ง๋ก ๋ฑ๋ก๋ ์ํ ๋ณด์ฌ์ฃผ๊ธฐ ๋ฌธ์ 

#### ํธ๋ฌ๋ธ

์ํ ๋ฑ๋ก ํ ๋ฑ๋ก๋ ์ํ์ ์ฌ์ฉ์๊ฐ ํ์ธํ  ์ ์๋ ๊ธฐ๋ฅ์ ๊ตฌํํ๋ ค๊ณ  ํ๋ค. ์ํ ๋ฑ๋ก ํ `์ํ ๋ชฉ๋ก`์ ๊ฑฐ์ณ `์ํ ์์ธ` ํ์ด์ง์์ ๋ฑ๋ก๋ ์ํ์ ๋ณด์ฌ์ฃผ๋ ๊ธฐ๋ฅ์ ๊ตฌํํ๋๋ฐ `์ํ ์์ธ`์ ์๋ฌด๊ฒ๋ ๋ณด์ฌ์ง์ง ์๋ ํ์์ด ๋ฐ๊ฒฌ๋์๋ค.

<img src="https://user-images.githubusercontent.com/44525561/135712413-477fa0a2-4818-487a-a70f-935d719e07a2.gif" width="30%"> 

<br>

#### ๋ฌธ์  ์ธ์

##### ์ถ์ธก

1. ์๋ฒ์ ๋ฐ์ดํฐ๋ฅผ ๋ณด๋ด๊ณ (POST) ์๋ต์ผ๋ก ๋ฐ์ดํฐ๋ฅผ ๋ฐ์ง๋ง, ์ด๋ฏธ์ง๋ AWS์ ์ ์ฅ๋๋๋ฐ ์๊ฐ์ด ๊ฑธ๋ ค์ ์ด๋ฏธ์ง๋ฅผ ์ฌ๋ ๋ค์ด๋ฐ์ง ๋ชปํ ์ค๋ฅ 
2. ๋ค๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ์ pop, pushํ๋ ์์ ๊ณผ ๋ฐ์ดํฐ๋ฅผ ์์ธ ํ์ด์ง์ ViewModel์ Model๋ฅผ ์๋ฐ์ดํธ ํ๋ ์์ ์ ๋ค๋ฐ๋ 

ํ๋ฉด์ด ์ ํ๋๋ ๋ถ๋ถ, ๋ฐ์ดํฐ๊ฐ ๋ธ๋ฆฌ๊ฒ์ดํธ ํจํด์ผ๋ก ์ ๋ฌ๋๋ ๋ถ๋ถ, ๋ฐ์ดํฐ๊ฐ ์๋ฐ์ดํธ ๋๋ ๋ถ๋ถ ๋ฑ ๋์์ด ์ผ์ด๋๋ ๋ถ๋ถ์ **๋ธ๋ ์ดํฌ ํฌ์ธํธ๋ฅผ ๊ฑธ์ด LLDB๋ฅผ ํตํด ๋๋ฒ๊น**์ ์งํํด๋ณด์๋ค.

๊ทธ ๊ฒฐ๊ณผ ์ถ์ธก 2๋ฒ๊ณผ ๊ฐ์ด ๋ค์ด๊ฒ์ด์ ์ปจํธ๋กค๋ฌ๋ฅผ pop, push (์ํ ๋ฑ๋ก -> ์ํ ๋ชฉ๋ก -> ์ํ ์์ธ) UI์ ์ ํํ๋ ์์ ๋ณด๋ค ๋ฑ๋ก๋ ์ํ์ ์ ๋ณด๋ฅผ ์ํ ์์ธ์ ์ ๋ฌํ๋ ์์ ์ด ๋นจ๋ผ์ ๋ฐฑ์ง๊ฐ ๋๋ ํ์์ด ๋์๋ค. 

<br>

#### ํด๊ฒฐ ๋ฐฉ์

pop, push์ด ๋ ํ์ ์ํ ์์ธ ํ์ด์ง์ ๋ฐ์ดํฐ๋ฅผ ์ ๋ฌํ์ฌ ์๋ฐ์ดํธ ์์ ์ ๋ง์ถฐ์ฃผ์. 

```swift
func displayRegisteratedItem(item: Item) {
    self.marketDetailViewController = MarketDetailViewController()
    self.navigationController?.pushViewController(self.marketDetailViewController, animated: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        self.marketDetailViewController?.refreshDetailItem(item: item)
    }
}
```

 `DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)` ๋ฅผ ํตํด 0.5์ด ๋๋ ์ด๋ฅผ ์ํจ ํ ๋ฐ์ดํฐ๋ฅผ ์ ๋ฌํ๋ค.

<img src="https://user-images.githubusercontent.com/44525561/135713506-a0eabf02-ee9f-49eb-8380-81457790bb52.gif" width="30%"> 

์ด ๋ฐฉ๋ฒ๋ ๋ฌธ์ ์ ์ด ์กด์ฌํ๋๋ฐ 0.5์ด ๋๋ ์ด๋ก ๋ฐ์ดํฐ๊ฐ ์ ๋ํ๋  ๋๋ ์๋ํ๋  ๋๋ ์กด์ฌํ๋ค. ๊ทธ๋ฆฌ๊ณ  ๋ค๋ฅธ ์คํ ํ๊ฒฝ์์๋ ๋๋ ์ด ์๊ฐ์ด ๋ค๋ฅธ๊ฒ์ ํ์ธํ๋ค. ๊ทธ๋ฌ๋ฏ๋ก ์ด ํด๊ฒฐ ๋ฐฉ๋ฒ์ ์์๋ฐฉํธ์ผ ๋ฟ ์ค๋ฅ๊ฐ ๋  ์ ์์์ ๋ดํฌํ๊ณ  ์๋ค.

๋๋ฒ๊น์ ์ข ๋ ์ด์ดํ๊ฒ ๋ธ๋ ์ดํฌ ํฌ์ธํธ๋ฅผ ๊ฑธ์ด์ ์งํํด๋ณด์๋ค.

pop, push์ ๋ฐ๋ผ ์์  ์ฐจ์ด๊ฐ ์กด์ฌํ๋ ์ข ๋ ๊ทผ๋ณธ์ ์ธ ์์ธ์ ViewController๋ฅผ ์ด๊ธฐํํ๋ ๋ถ๋ถ์์ **viewDidLoad(๋ฉ๋ชจ๋ฆฌ์ ์ฌ๋ผ์ค๋ ์์ ) ๋ณด๋ค ViewModel์ Model์ ๋ณํ์ํค๋ ์์์ด ๋ ๋น ๋ฅด๊ฒ** ๋๋ค๋ ๊ฒ์ด๋ค. ๊ทธ๋์ Model ๋ณํ์ ๋ฐ๋ฅธ ํ๋กํผํฐ ์ต์ ๋ฒ์ ํด๋ก์ ๋ nil ์ํ๋ก ์๋ฌด๊ฒ๋ ์๋ฐ์ดํธ ํด์ฃผ์ง ์๋ ๊ฒ์ด๋ค. ๋ฐ์ธ๋ฉ์ผ๋ก์จ ํด๋ก์ ๋ viewDidLoad์์ ๋ฐ์ธ๋ฉ๋๊ธฐ ๋๋ฌธ์ด๋ค.

```swift
// viewDidLoad์ด ์คํ๋๊ธฐ ์ ์ด๋ผ ๋ฐ์ธ๋ฉ๋์ง ์์ detailItemHandler = nil
// ๊ทธ๋์ ์ํ์ ์ ๋ณด๊ฐ ์๋ฐ์ดํธ ๋์ง ์๋ ์ํฉ
private(set) var itemImages: [Data]? {
    didSet {
        self.detailItemHandler?()
    }
}
```



<br>

#### ๊ฐ์ 

๊ธฐ์กด์ ๋ฑ๋ก๋ ํ ์ฌ์ฉ์์๊ฒ ๋ฑ๋กํ ์ํ์ ๋ณด์ฌ์ฃผ๋ ๋ฐฉ์์ **์ํ ๋ฑ๋ก -> ์ํ ๋ชฉ๋ก -> ์ํ ์์ธ** ์ด๋ ๊ฒ ์๋ค๊ฐ๋ค ํ๋ ๋ฐฉ์์ด์๋ค.

ํ์ฌ ์ฑ์คํ ์ด์ ์ฑ์ ์ฐธ๊ณ ํ์ฌ ์๊ฐํด๋ดค์๋ ์๋ค๊ฐ๋ค ํ๋ ๋ฐฉ์์ผ๋ก ์ธํด ์ฌ์ฉ์ ๊ฒฝํ์ด ๋จ์ด์ง ์ ์์์ ๋๊ผ๋ค. ๊ทธ๋์ `์ํ ๋ชฉ๋ก`์์ `์ํ ์์ธ`๋ก ๋ณด์ฌ์ฃผ๋ ๋ฐฉ์์์ ๋ฐ๋ก `์ํ ์์ธ`๋ก ๋ฐ๋ก ๋์ด๊ฐ๋๋ก ์์ ํ๊ณ , ๋ค๋ก ๋ฒํผ์ `.popToRootViewController` ํ์ฉํ์ฌ ๋ฐ๋ก ์ํ ๋ชฉ๋ก์ผ๋ก ์ด๋ํ๋๋ก ํ๋ค.

<img src="https://user-images.githubusercontent.com/44525561/137657437-4dc7a942-06f1-4fbe-a9be-6503b9a78207.gif" width="30%">  

 `DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)`๋ฅผ ํตํ ํด๊ฒฐ๋ฐฉ์์ ์ ์ฌ์ ์ธ ์ค๋ฅ ๋ํ ํด๊ฒฐํ๊ธฐ ์ํด์ ๋๋ ์ด๋ฅผ ํตํ viewDidLoad ํธ์ถ์ ๊ธฐ๋ค๋ฆฌ๋ ๊ฒ์ด ์๋, viewDidLoad๊ฐ ํธ์ถ ๋ ๋ ์๋ฐ์ดํธ ์์ผ์ฃผ๋๋ก ํ์ฌ ์คํ ํ๊ฒฝ์ ๋ฐ๋ผ ๋ฐ์๋  ์ ์๋ ์ค๋ฅ๋ฅผ ์ ๊ฑฐํ๋ค.

์ํ ์์ธ์ ํ๋กํผํฐ์ ๋ฑ๋ก๋ ๋ฐ์ดํฐ๋ฅผ ์ ์ฅํ๊ณ  viewDidLoad๊ฐ ํธ์ถ๋  ๋ ํ๋กํผํฐ๋ฅผ ํ์ธํ์ฌ ViewModel์ Model์ ๋ณ๊ฒฝ์์ผ์ค์ผ๋ก์จ ์ ์์ ์ธ ๋ฐ์ธ๋ฉ์ ํตํด ์๋ฐ์ดํธ ์์ผ์ฃผ๋๋ก ํ๋ค.

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


### ์ํ ๋ฑ๋ก, ์์  ํ์ด์ง์ ์ํ ์์ ์ผ๋ก ์ง์ํ์ ๋ ์ด๋ฏธ์ง๊ฐ ๋ณด์ด์ง ์๋ ๋ฌธ์ 

#### ํธ๋ฌ๋ธ

์ฌ์ฉ์๊ฐ ๋ฑ๋กํ ์ํ์ ์์ ํ๊ธฐ ์ํด `์ํ ์์ธ ํ์ด์ง`์ `Action Sheet`๋ฅผ ํตํด `์ํ ์์  ํ์ด์ง`๋ก ์ด๋ํ๊ฒ ๋๋ค.
`์ํ ์์  ํ์ด์ง`์๋ ์ด๋ฏธ์ง, ์ ๋ชฉ, ํํ, ๊ฐ๊ฒฉ, ํ ์ธ ๊ฐ๊ฒฉ(์ต์๋), ์๋, ์์ธ ์ ๋ณด๊ฐ ๊ธฐ์กด์ ์ ๋ณด๋ก ์ฑ์์ ธ ์์ด์ผ ํ์ง๋ง, 
์ฒ์ ์ฑ์ ๊ตฌ๋ํ์ ๋ ์ต์ด์ ๋ฑ๋กํ๋ฉด์ ์ง์ํ๋ฉด ์ด๋ฏธ์ง๊ฐ ๋ณด์ฌ์ง๋ ๊ฒ์ ๋ณผ ์ ์์ง๋ง, ๊ทธ ์ดํ์ ๋์ผํ ์์์ ํ๊ฒ๋๋ฉด ์ด๋ฏธ์ง๊ฐ ์๋ ํ์์ด ์๊ฒผ๋ค.

<img src="https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-19%20at%2013.08.41.gif" alt="Simulator Screen Recording - iPhone 12 Pro Max - 2021-10-19 at 13.08.41" width="30%" /> <img src="https://images.velog.io/images/fezravien/post/01e27727-7162-4aa0-8aca-130fb2801d83/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20Max%20-%202021-10-19%20at%2011.55.47-46(%EB%93%9C%EB%9E%98%EA%B7%B8%ED%95%A8).tiff" width="30%;" />

<br>

#### ๋ฌธ์  ์ธ์

##### ์ถ์ธก

1. ์๋ฒ์ ๋ฑ๋ก๋ ์ด๋ฏธ์ง๋ฅผ ๊ฐ์ ธ์ค๋ ๊ฒ(๋คํธ์ํฌ)์ ๋๋ ์ด๋ก ์ธํด ์ด๋ฏธ์ง๊ฐ ์๋ฐ์ดํธ ๋์ง ๋ชปํ๋ค.
2. ์๋ฒ์ ์ด๋ฏธ์ง๊ฐ AWS ์๋ฒ์ ๋ฑ๋ก๋๋ ์์ ๊ณผ ์ด๋ฏธ์ง๋ฅผ ํ๋ฉด์ ๋์์ฃผ๋ ์์ ์ด ๋ง์ง ์์๋ค.
3. ViewController๊ฐ ์์ฑ๋์ด ๋ฉ๋ชจ๋ฆฌ์ ์ฌ๋ผ์ค๊ธฐ ์ ์ ๋ฐ์ดํฐ๋ฅผ ์๋ฐ์ดํธ ์์ผ์คฌ๋ค. (MVVM ์ดํคํ์ฒ - Model์ ๋ณํ๋ก ViewModel๊ณผ View๊ฐ์ ๋ฐ์ธ๋ฉ์ ํตํด ์๋ฐ์ดํธ๋ฅผ ํ๋ค.)

<br>

#### ํด๊ฒฐ

์ํ ์์  ํ์ด์ง์์ ์ด๋ฏธ์ง๋ฅผ ๋ค์ด๋ก๋ ํ  ๋ `DispatchQueue.main.asyncAfter`๋ฅผ ํตํด ๋๋ ์ด๋ฅผ ์์ผ์ ํด๊ฒฐํ  ์ ์์๋ค.

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

ํ์ง๋ง ์ด๋ฏธ์ง์ ๊ฐฏ์์ ๋ฐ๋ผ ๋์ํ์ง ์๋ ์ํฉ์ด ์กด์ฌํ๋ค. ๋๋ ์ด๋ฅผ 1์ด๋ก ์ฃผ๊ณ  ์ด๋ฏธ์ง๊ฐ 5๊ฐ๊ฐ ์กด์ฌํ๋ค๋ฉด, ๋๊ฐ์ด ์ด๋ฏธ์ง๊ฐ ๋ฐ์๋์ง ์๋ ๋ชจ์ต์ด ๋ณด์๋ค. ๋ค๋ง 2์ด์ ๋๋ ์ด๋ฅผ ๋๋ค๋ฉด 5๊ฐ๋ ๋์์ด ์ ์์ ์ผ๋ก ์ํ๋จ์ ์ ์ ์์๋ค,

๋๋ ์ด๋ฅผ ๋๋ํ๊ฒ ์ค์ผ๋ก์จ ๊ธฐ๋ฅ์ด ๋์ํ๋๋ก ํ์ง๋ง, ์ ๋๋ ์ด๋ฅผ ์ค์ผ ๊ธฐ๋ฅ์ด ์ ์์ ์ผ๋ก ์๋ํ๋ ๊ฒ์ธ์ง ์กฐ๊ธ ๋ ๋๋ฒ๊น์ ๊ตฌ์ฒด์ ์ผ๋ก ํด๋ณด๋ฉด์ ์๊ฐํด๋ณด์๋ค.

![์คํฌ๋ฆฐ์ท 2021-10-19 ์คํ 10.11.38](https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-19%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2010.11.38.png)

์์ ๊ทธ๋ฆผ์ฒ๋ผ ์๋ฒ์ ๋น๋ฐ๋ฒํธ๋ฅผ ํ์ธํ๊ธฐ ์ํด `PATCH` ์์ฒญ์ ๋ณด๋ด๊ฒ ๋๋ฉด ๋์ผํ ์ด๋ฏธ์ง๋ฅผ ๊ฐ์ง๊ณ  ์์ง๋ง AWS ์๋ฒ์๋ ๋ค๋ฅธ URL๋ก ์ ์ฅ๋๊ฒ ๋๋๋ฐ, ์ด๋ ๋๋ ์ด๋ฅผ ์ฃผ์ง ์๊ณ  ์ด๋ฏธ์ง๋ฅผ ๋ค์ด๋ก๋ํ๊ฒ๋๋ฉด ๊ธฐ์กด์ ์ด๋ฏธ์ง URL๋ก ์์ฒญํ๊ฒ ๋์ ์ฒ์์๋ ์ด๋ฏธ์ง๊ฐ ๋ณด์ฌ์ง๊ฒ ์ง๋ง, ๋ ๋ฒ์งธ ๋์ผํ ๋์์ ํ๊ฒ๋๋ฉด ์ด๋ฏธ์ง URL์ด ๋ฐ๋์๊ธฐ ๋๋ฌธ์ ์๋ฒ๋ก๋ถํฐ ์ด๋ฏธ์ง๋ฅผ ๋ถ๋ฌ์ฌ ์ ์๊ฒ๋๋ค. 

๊ทธ๋์ ๋๋ ์ด๋ฅผ ์ฃผ๊ฒ๋๋ฉด ์๋ฒ์ ๋น๋ฐ๋ฒํธ ์์ฒญ๊ณผ ํจ๊ป (์ด๋ฏธ์ง๋ ๋์ผํ์ง๋ง) ์์ ๋๋ ์ฌํญ์ ๋๊ธฐํ ์ํฌ ์๊ฐ์ ์ฃผ๊ฒ๋์ด ์ด๋ฏธ์ง๊ฐ ๋์ผํ ๋์์๋ ๋ณด์ฌ์ง ์ ์๊ฒ๋๋ค.

<br>

#### ๊ฐ์ 

๋น๋น๋ฒํธ ๊ฒ์ฆ์ผ๋ก ์ธํ `PATCH` ์์ฒญ์ ์ด์ฉ ์ ์๋ ๋ถ๋ถ์ธ ๊ฒ ๊ฐ๋ค. ์ด ๋ถ๋ถ์ ์๋ฒ์ ํ์์ ํตํด ๋น๋ฐ๋ฒํธ๋ง ๊ฒ์ฆํ  ์ ์๋๋ก API๋ฅผ ๊ตฌํํด๋ฌ๋ผ๊ณ  ์์ฒญํด์ผ ์ํํ๊ฒ ์ฒ๋ฆฌํ  ์ ์์ ๊ฒ ๊ฐ๋ค. 

์ด ๋ถ๋ถ์์ ๊ฐ์ ํด๋ณด๊ณ  ์ถ์ ๋ถ๋ถ์ ๋๋ ์ด๋ฅผ ํจ์จ์ ์ผ๋ก ์ฌ์ฉํ๋ ๊ฒ์ด๋ค.

๊ธฐ์กด์ ํด๊ฒฐ๋ฐฉ์์ธ `๋์ํ`, `๋น๋๊ธฐ ์์`์ด๋ค. ์ด๋ฏธ์ง์ ์์๋ฅผ ๊ณ ๋ คํ์ง ์๋๋ค.

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

![์คํฌ๋ฆฐ์ท 2021-10-20 ์ค์  12.49.24](https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-20%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%2012.49.24.png)

<br>

๊ธฐ์กด์ ๋ฐฉ์์์ ์ด๋ฏธ์ง์ ์์๋ฅผ ๊ณ ๋ คํ๊ณ , ๋ถํ์ํ  ์๋ ์๋ ๋๋ ์ด๋ฅผ ํ์ง ์๊ธฐ ์ํด ๊ฐ์ ํ๋ค.
`CustomQueue`๋ฅผ ์ฌ์ฉํ์ฌ **์๋ฆฌ์ผ ํ๋ฅผ ํตํ ๋๊ธฐ์  ์์**์ผ๋ก ์ด๋ฏธ์ง์ ์์๋ฅผ ๋ณด์ฅํ๊ณ , ๋๋ ์ด๋ฅผ ์ด๋ฏธ์ง ์ ์ฒด์ ํ๋ฒ๋ง ์ค์ **๊ธฐ์กด์ ๋ถํ์ ํ  ์ ์์๋ ๋๋ ์ด๋ฅผ ์ค์๋ค.**

์์์ ๋ณด์ฅํ๊ฒ ํ  ์ ์๋ ๋ฐฉ๋ฒ์ ์ฌ๋ฌ๊ฐ์ง๊ฐ ์กด์ฌํ๋ค.

1. `Custom Queue` 

   ์ปค์คํ ํ๋ **๋ํดํธ๋ ์๋ฆฌ์ผ ํ**์ด๋ฉฐ ๋์ํ๋ก ๋ง๋ค ์๋ ์๋ค.

   ํ์ฌ ์ด์์์ ์ด๋ฏธ์ง์ ์์๋ฅผ ๋ณด์ฅํ๊ธฐ ์ํด ์ฌ์ฉํ๋ค.

2. `Dispatch Semaphore` 

   ๋์ผํ ์์์ ์ ๊ทผํ๋ ๊ฒ์ ๋ง๊ธฐ์ํ ์ธ๋งํฌ์ด
   ํ์ฌ ์ด์์์๋ ์ธ๋งํฌ์ด 1๊ฐ๋ก ์ง์ ํ๊ณ  wait, signal๋ฅผ ํตํด ์์๋ฅผ ๋ณด์ฅํ  ์ ์๋ค.

   ํ์ง๋ง ๋์ผํ ์์ ์ ๊ทผ์ด ์๋๋ฏ๋ก Custom Queue์ ์๋ฆฌ์ผ์ด ๋ ์ ํฉํ๋ค๊ณ  ํ๋จํ๋ค.

3. `Dispatch Group`

   ์ฐ๊ด๋ ์์์ ๊ทธ๋ฃน์ผ๋ก ๋ฌถ์ด์ ์ ์ฒด๊ฐ ๋๋จ์ ์๋ฆฌ๊ฑฐ๋ ์ต๋ ์ผ๋ง๋ ๊ธฐ๋ค๋ฆฌ๊ฒ ๋ฐ๋๋ผ์ธ์ ์ ํ  ์ ์๋ค.
   ํ์ฌ ์ด์์์ ์ด๋ฏธ์ง ์์๋ณด์ฅ์์ ์ ํฉํ์ง ์๋ค๊ณ  ์๊ฐํ๋ค. 

   

```swift
let dispatchSerialQueue = DispatchQueue(label: "์ด๋ฏธ์ง ๋ค์ด๋ก๋ ์๋ฆฌ์ผ ํ")
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

![์คํฌ๋ฆฐ์ท 2021-10-20 ์ค์  1.01.28](https://raw.githubusercontent.com/Fezravien/UploadForMarkdown/forUpload/img/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-10-20%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%201.01.28.png)

<br>

์ด์  ์ฌ๋ฌ๋ฒ ๋์ผํ ๋์์ ํด๋ ์ด๋ฏธ์ง๊ฐ ์ฌ๋ผ์ค๋ ๊ฒ์ ํ์ธํ  ์ ์๋ค.

<img src="https://user-images.githubusercontent.com/44525561/137949992-0b5c03f5-94f6-48f8-8c8e-6b23fd277ca4.gif" width="30%"> 
