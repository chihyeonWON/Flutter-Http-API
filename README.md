# httpnews
세상을 보는 창은 작은 스마트폰에서 시작한다.

```
개발 툴 : Flutter
개발 언어 : Dart
개발 일시 : 2023-03-01 - ~ 
개발자 : Won Chi Hyeon
```

## Flutter Http란
```
Flutter의 http 라이브러리를 사용해서 인터넷의 다양한 서버에서 제공하는 API를 활용해서
서버에서 데이터를 받아오는 앱을 제작할 수 있습니다.

이번 프로젝트에서는 https://newsapi.org/ 에서 제공하는 뉴스API를 이용하여 API를 호출해보고
데이터를 가공해서 보여주는 앱을 제작해보았습니다.
```

## NEWS API 얻기
```
newsapi.org 홈페이지에서 회원가입을 하면 API 키를 바로 발급해줍니다.
```
![image](https://user-images.githubusercontent.com/58906858/212847304-8368567d-8bc5-4a62-815a-c579715cad28.png)

## dart, flutter에 http 의존성 추가
```
terminal에 dart pub add http, flutter pub add http 명령어를 주입하여 라이브러리를 추가하고
프로젝트에 의존성을 추가합니다.
```

## news_model 생성
```
lib 아래에 models 폴더를 생성한 후 model 관리(데이터 구조 정의)를 위한 news.dart 파일을 생성합니다.
newsapi의 title와 description 필드의 데이터를 요청합니다. json 형태를 object 형태로 파싱하기 위해서
fromMap 메서드을 사용하였습니다.
```

## news_widget 생성
```
lib 아래에 widgets 폴더를 생성한 후 화면에 보여지는 위젯들을 위한 news_widget.dart 파일을 생성합니다.
models에 정의된 클래스의 타입으로 객체를 생성한 후에 객체의 데이터를 텍스 위젯을 사용하여 UI를 생성하였습니다.
```

## news_provider 생성
```
lib 아래에 providers 폴더를 생성한 후 웹에서 데이터를 가져오는 부분인 news_provider.dart 파일을 생성합니다.
getNews() 메서드를 생성하여 뉴스를 조회하는 기능을 넣어주었습니다. 다른 REST Api를 구현하고자 한다,
get, post, delete, put 등에 대응하는 메서드를 생성해서 구현해주면 됩니다. 
이번 프로젝트에서는 뉴스를 조회하는 기능만을 가지고 있기에 getNews()만 구현하였습니다.
```

## main.dart 수정
```
news_widget에 provider를 추가한 후 위젯을 화면에 뿌려주는 news_widget 클래스를 main의 첫 페이지에서
호출하도록 클래스를 수정한 후에 에뮬레이터를 실행하였고 newsapi에서 현재 가장 최신화된 한국 뉴스의 
headline 즉 제목(title)와 부제(description)을 서버에 요청하고 데이터를 받아와서 앱에서 보여주는 뉴스앱
프로젝트를 완성하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/212888879-67dc83b3-34d0-4a4b-9c25-d8c93ce92814.png)
