# Swift Error Handling
## try 種類
- try?: 失敗したときにnilが変える
- try!: 失敗したときにクラッシュする
- try: 失敗したときはエラーがthrowされる。do ~ catchで囲う必要がある
- defer: エラーが起きたときに実行するもの
```
do {
  defer { エラーが起きたときの後処理 }
  try method1()
} catch {
}
```

## throws
- 参考: `https://qiita.com/koishi/items/67cf4d0f51c4d79f1d22`

- throws: エラーを投げる可能性のある関数につける
`func hogehoge() throws -> Void {}`

- throw: 実際にエラーを投げる
` throw NSError(domain: "ほげほげ", code: 404, userInfo: nil)`

メソッドを複数渡る場合は、do - tryで囲み、catchしないメソッドでは、throwsをつける
catchするメソッドの場合は、throwsをつけない。
（catchせず、throwsをつけた場合は、呼び出し元にそのままエラーが渡る

- rethrows: メソッドが引数として受け取ったクロージャがエラーを保つ場合につける
```
func method1(method: () throws -> Void) rethrows { try method() }
func method2() { 
	do { 
		try method1(method3) 
	} catch {
		// エラー処理
	}
} 
func method3() throws { throw APIError.network }
```