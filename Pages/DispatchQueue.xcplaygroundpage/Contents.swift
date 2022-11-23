// DispatchQueueの使い方

/*
 ・DispatchQueue.globalは別スレッドで処理させることを意味する。
 ・ファイルをダウンロードさせるような重い処理は別スレッドで行うようにする。
 ・メインスレッドで処理させる場合は.mainと記載する
 ・asyncは非同期で処理することを意味する。同期して処理する場合はsyncを指定する
 */