output "public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "website_url" {
  description = "URL to access the nginx website"
  value       = "http://${azurerm_public_ip.pip.ip_address}"
}

output "ssh_user" {
  description = "SSH username"
  value       = var.admin_username
}

output "ssh_command_unix" {
  description = "SSH command for Linux/macOS shells"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}

output "ssh_command_windows" {
  description = "SSH command for Windows PowerShell (adjust -i path if needed)"
  value       = "ssh -i C:\\\\Users\\\\nilsb\\\\.ssh\\\\id_rsa ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}
