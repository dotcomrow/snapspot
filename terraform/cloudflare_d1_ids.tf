// pulse_ui_dev_cache
resource "null_resource" "d1_snapspot_dev_cache_id" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "${path.module}/scripts/get_d1_id.sh"
    environment = {
      d1_name               = "snapspot_dev_cache"
      cloudflare_account_id = var.cloudflare_account_id
      cloudflare_token      = var.cloudflare_token
    }
  }
}

data "local_file" "load_d1_snapspot_dev_cache_id" {
  filename   = "${path.module}/snapspot_dev_cache"
  depends_on = [null_resource.d1_snapspot_dev_cache_id]
}

// pulse_ui_prod_cache
resource "null_resource" "d1_snapspot_prod_cache_id" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "${path.module}/scripts/get_d1_id.sh"
    environment = {
      d1_name               = "snapspot_prod_cache"
      cloudflare_account_id = var.cloudflare_account_id
      cloudflare_token      = var.cloudflare_token
    }
  }
}

data "local_file" "load_d1_snapspot_prod_cache_id" {
  filename   = "${path.module}/snapspot_prod_cache"
  depends_on = [null_resource.d1_snapspot_prod_cache_id]
}