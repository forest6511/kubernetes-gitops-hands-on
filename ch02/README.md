# 第2章: GitHub Actionsでイメージをビルドする

「Kubernetes実践ハンズオン」第2章の設定ファイルです。

## 前提条件

- 第1章まで完了していること
- GitHub アカウントを持っていること
- Docker Hub アカウントを持っていること
- GitHub リポジトリに `DOCKERHUB_TOKEN` シークレットが登録されていること

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-ci.yml | GitHub Actions | CI ワークフロー（lint → test → build-and-push） |

## 適用手順

1. `.github/workflows/ci.yml` をリポジトリに配置
2. `app/` ディレクトリ配下のファイルを変更して `git push`
3. GitHub の Actions タブでワークフローの実行を確認

## クリーンアップ

```bash
bash cleanup.sh
```
