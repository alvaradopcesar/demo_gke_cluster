output "endpoint" {
  value = "${google_container_cluster.default.endpoint}"
}

output "instance_group_urls" {
  value = "${google_container_cluster.default.instance_group_urls}"
}

output "label_fingerprint" {
  value = "${google_container_cluster.default.label_fingerprint}"
}

output "master_version" {
  value = "${google_container_cluster.default.master_version}"
}

output "client_certificate" {
  value = "${google_container_cluster.default.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.default.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.default.master_auth.0.cluster_ca_certificate}"
}

output "services_ipv4_cidr" {
  value = "${google_container_cluster.default.services_ipv4_cidr}"
}

resource "local_file" "kubernetes_config" {
  content = "${google_container_cluster.default.master_auth.0.cluster_ca_certificate}"
  filename = "kubeconfig.yaml"
}
