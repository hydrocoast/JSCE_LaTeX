# 土木学会論文集 LaTeX テンプレート
土木学会のページ[各種書式](http://committees.jsce.or.jp/jjsce/pform)より，LaTeXテンプレートを展開し，Linux(Ubuntu)でも動作するようにしました．  
pLaTeX 2e 用のディレクトリのみ抽出し編集しています．  
気軽にプルリクエストしてください．

## 事前準備
- Ubuntu の人  
texlive をインストールしておいてください．

- Mac の人  
MacTeX をインストールしておいてください．

- Windowsの人  
よくわかりませんが，頑張ってLaTeX環境を構築してください．

- Ubuntu 以外の Linux ディストリビューションの人  
すいません．よくわかりません．


## 使い方
動作確認環境は，Ubuntu 16.04 LTS, 18.04 LTS, 20.04 LTS (texlive)，macOS Catalina, Big Sur (MacTeX)です．  
まずこのリポジトリを clone し，当該ディレクトリへ移動します．
```shell
git clone https://github.com/hydrocoast/JSCE_LaTeX
cd JSCE_LaTeX
```
ターミナル上で `make` または `make ronbun` と実行することにより，`ronbun-j.pdf` PDFファイルが作成されます．
```shell
make
```


## 論文原稿の作成
論文執筆にあたっては，実際の論文原稿のリモート名を `origin` にした方が良いと思います．  
以下のように `make new` を実行することで，このリポジトリのリモート名を `origin` から `template` へと変更できます．  
```shell
make new
```
その後，`origin` に各自の論文原稿のリポジトリを割り当てることができます．
```shell
git remote add origin git@github.com:username/各自作成したリポジトリ名.git
```
以降，`ronbun-j.tex` を編集して `make` を実行することで本原稿の論文PDFが同様に生成されるとともに，
テンプレートとは別のバージョン管理が可能です．  

## Overleaf での編集
鋭意調整中です．


## 注意点
「2018年7月18日改訂」版を編集し作成されています．今後書式が更新される可能性があります．  
環境によって，元のPDFファイルと異なった書式になる可能性があります．  
元のPDFファイルを確認したい場合は， 最初のコミット時点のファイルを参照してください．  
最初のコミットは，土木学会がアップロードしているzipファイルを展開したものと同じです．  

(2021年4月) 「2020年4月1日以降の投稿」のフォーマットに極力対応しました．
また送付票などの今後必要ないと思われるファイルを削除しました．  

## ライセンス等
各`*.sty` `*.cls`ファイルの著作権は，ファイル内に記述されている通りです．  
オリジナルのパッケージについては土木学会が権利を所有しています．  
利用は自由です．ただし，本リポジトリを使用したことによる査読評価等の結果に対して，本リポジトリ作成者は一切の責任を負いません．

## 作成者
宮下 卓也 (Takuya Miyashita)  
miyashita (at) hydrocoast.jp
