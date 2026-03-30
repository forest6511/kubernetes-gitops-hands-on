# Kubernetes実践ハンズオン - サンプルリポジトリ

本リポジトリは書籍『**Kubernetes実践ハンズオン: GitHub Actions・ArgoCD・Amazon EKSで本番運用**』の教材です。

## 前提条件

- 書籍『Kubernetes入門ハンズオン』（Vol.1）の知識、または Kubernetes の基礎（Pod, Deployment, Service, ConfigMap, Secret）を理解していること
- Docker Desktop がインストール済みであること
- Docker Hub アカウントを持っていること
- GitHub アカウントを持っていること
- **第5章・第6章のみ**: AWS アカウント + AWS CLI v2 が必要（**有料**）

## ディレクトリ構成

```
kubernetes-gitops-hands-on/
├── app/                    # Todo アプリ（Vol.1 から継続）
│   ├── api/                # Go API サーバー
│   ├── frontend/           # nginx + 静的 HTML
│   └── docker-compose.yml  # ローカル開発用
├── manifests/              # 第1章: Kubernetes マニフェスト
│   ├── namespace.yaml      # todo-app Namespace
│   ├── deployment.yaml     # API + Frontend + DB
│   ├── service.yaml        # ClusterIP Service
│   ├── configmap.yaml      # DB 設定
│   ├── secret.yaml         # DB 認証情報
│   ├── pvc.yaml            # データ永続化
│   └── kustomization.yaml  # Kustomize ベース
├── .github/workflows/      # 第2章: GitHub Actions CI
│   └── ci.yml              # lint → test → build → push
├── argocd/                 # 第3章: ArgoCD GitOps
│   └── todo-app.yaml       # Application CRD
├── monitoring/             # 第4章: Prometheus + Grafana
│   ├── prometheus-values.yaml
│   └── grafana-dashboard.json
└── eks/                    # 第5-6章: Amazon EKS
    ├── cluster-config.yaml # eksctl ClusterConfig
    └── manifests/          # EKS 向けマニフェスト
        ├── storageclass.yaml
        └── gateway.yaml    # Gateway API on AWS LB Controller
```

## 章とディレクトリの対応

| 章 | ディレクトリ | 内容 |
|----|-------------|------|
| 第1章 | `manifests/` | Vol.2 の出発点（Namespace 分離 + Docker Hub push） |
| 第2章 | `.github/workflows/` | GitHub Actions で CI パイプライン構築 |
| 第3章 | `argocd/` | ArgoCD で GitOps を実現 |
| 第4章 | `monitoring/` | Prometheus + Grafana で監視 |
| 第5章 | `eks/` | Amazon EKS でクラスター構築 |
| 第6章 | `eks/manifests/` | minikube から EKS へ移行 |
| 第7章 | — | 本番運用の基礎（HPA, PSS, RBAC） |

## AWS 課金に関する注意

第5章・第6章では Amazon EKS を使用します。**EKS は AWS 無料枠の対象外**です。

- EKS クラスター: $0.10/時
- EC2 ノード（t3.medium x2）: 約 $2.50/日
- **合計目安: 約 $5-15/日**

ハンズオン終了後は必ずクラスターを削除してください:

```bash
eksctl delete cluster -f eks/cluster-config.yaml
```

## ライセンス

本リポジトリのソースコードは学習目的で自由に利用できます。
