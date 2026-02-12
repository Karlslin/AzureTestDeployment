output "public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "website_url" {
  description = "URL to access the nginx website"
  value       = "http://${azurerm_public_ip.pip.ip_address}"
}

output "ssh_command" {
  description = "SSH command to connect to the VM (Windows path)"
  value       = "ssh -i C:\\Users\\nilsb\\.ssh\\id_rsa ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}
