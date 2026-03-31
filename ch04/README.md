# 第4章: Prometheus + Grafanaで監視する

「Kubernetes実践ハンズオン」第4章の設定ファイルです。

## 前提条件

- 第3章まで完了していること
- Helm CLI がインストール済みであること
- ArgoCD で Todo アプリがデプロイされていること

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-prometheus-values.yaml | Helm values | kube-prometheus-stack の設定値 |
| 02-servicemonitor.yaml | ServiceMonitor | Todo API のメトリクス収集設定 |
| 03-grafana-dashboard.json | Grafana Dashboard | Todo アプリ専用ダッシュボード |
| 04-alert-rules.yaml | PrometheusRule | PodCrashLooping・HighMemoryUsage アラート |

## 適用手順

1. `kubectl create namespace monitoring`
2. `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && helm repo update`
3. `kubectl create configmap todo-app-dashboard --from-file=todo-app-dashboard.json=03-grafana-dashboard.json -n monitoring`
4. `helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring -f 01-prometheus-values.yaml`
5. `kubectl apply -f 02-servicemonitor.yaml`
6. `kubectl apply -f 04-alert-rules.yaml`

## クリーンアップ

```bash
bash cleanup.sh
```
