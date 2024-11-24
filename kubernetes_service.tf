# resource "kubernetes_service" "nginx" {
#   metadata {
#     name      = "nginx"
#     namespace = "default"
#   }

#   spec {
#     selector = {
#       app = "nginx"
#     }

#     type = "LoadBalancer"

#     port {
#       port        = 80
#       target_port = 80
#     }
#   }
# }