# rikako-ios

## 環境構築

#### Xcodeのインストール ####

App Store から

#### rbenvのインストール ####

```
brew update
brew install rbenv ruby-build
rbenv install -l
rbenv install 2.7.1  # 最新版をインストール
rbenv versions  # インストール済みのバージョンを表示

cd
atom .bash_profile  # .bash_profile に記述
```

```
eval "$(rbenv init -)"
```

```
rbenv global 2.7.1  # 使用バージョンを設定
ruby -v  # 切り替わっていることを確認
```


#### Bundlerのインストール ####

```
gem install bundler -v 2.1.4
gem list bundler
bundle -v
```

#### Podのインストール ####

```
bundle config set path vendor/bundle
bundle _2.1.4_ install --path vendor/bundle
```


```
mint bootstrap
mint run xcodegen xcodegen generate
```


### LicensePlistの更新

```
mint run LicensePlist license-plist --output-path rikako/Settings.bundle
```



## 問題データ周りについて

問題データは数種類ある。

### 通常タイプ

QuestionType = normal

- questionId: Int
- type: QuestionType
- text: String
- images: [String]
- answer: Int
- answers: [String]
- comment: String
- commentImages: [String]


