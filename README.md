# yamagata-covid19-virusNetworkJsonGenerator
山形県新型コロナウイルス感染症対策サイトの感染ネットワーク用データのJson生成ツールです。

Excelのマクロを使用して、山形県や山形市が公開するPDFデータから感染者間の関連情報を抽出し「感染ネットワーク」ページ用のJsonデータを生成します。

## 使用方法
1. 以下ページから感染者のPDFデータを取得する。
    - [山形県コロナウイルス情報サイト](https://www.pref.yamagata.jp/090016/bosai/kochibou/kikikanri/covid19/shingata_corona.html)（ **県内の新型コロナウイルス感染症の発生状況（一覧表）** から最新情報を取得）
    - [山形市コロナウイルス情報サイト](https://www.city.yamagata-yamagata.lg.jp/kakuka/kenkoiryo/kenkozoshin/sogo/kansensyou/pd0409180023.html)（ **山形市における感染者の確認事例** から最新情報を取得）
2. PDFデータをAdobe Acrobat Readerで開き、表の部分をコピーする。（ヘッダー部分は除く）
3. wordを開き、コピーしたデータを貼り付け再度コピーする。（pdfの表をExcelに貼り付ける為にwordを一旦挟む）
4. covid.xlsmのMainタブを開き、未記入の行のS列に貼り付ける。（貼り付ける時、貼り付け時の書式に合わせたほうが見た目的に好き）
5. 貼り付けたデータの日付を記入する。
6. 「山形市」のデータの場合はR列に「○」を入力する。（表の構成が県と市で少し違うため）
7. 「Main」「prepareData」「baseDataJsonTxt」「networkDataJsonTxt」タブにて「関数コピー済み」の行を超えてデータが設定されていないか確かめる。（超えていた場合は「関数コピー済み」の行からコピペして十分に行を増やす）
8. データに崩れている要素がないか確かめる。（コピペ元の表の改行具合やデータの順番によって、抽出が失敗している可能性がある。その場合は「Main」タブのデータを手動で整える）
9. 「dataJson」タブから「Jsonテキストの作成」を押下する。
10. 生成された「virusNetwork.json」ファイルを[covid19のリポジトリ](https://github.com/yamaserif/covid19/tree/development/data)の「virusNetwork.json」と差し替えて更新する。
11. 本リポジトリを更新する。
