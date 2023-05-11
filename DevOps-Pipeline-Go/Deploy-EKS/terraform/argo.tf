# resource "random_password" "argocd_password" {
#   length           = 16
#   special          = true
#   override_special = "_%@"
# }

# resource "kubernetes_secret" "argocd_password" {
#   metadata {
#     name = "argocd-password"
#   }

#   data = {
#     ARGOCD_PASSWORD = base64encode(random_password.argocd_password.result)
#   }

#   depends_on = [random_password.argocd_password]
# }

# resource "helm_release" "argocd" {

#   name       = "argo-cd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   version    = "4.9.8"
#   namespace  = "argocd"

#   set {
#     name  = "server.service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "server.configEnabled"
#     value = "true"
#   }

#   set {
#     name  = "server.name"
#     value = "argocd-server"
#   }

#   set {
#     name  = "controller.args.appResyncPeriod"
#     value = "30"
#   }

#   set {
#     name  = "controller.args.repoServerTimeoutSeconds"
#     value = "15"
#   }

#   depends_on = [helm_release.nginx_ingress, kubernetes_secret.argocd_password]

# }
