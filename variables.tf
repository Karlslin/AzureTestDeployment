variable "resource_group_name" {
  description = "Name der Resource Group"
  type        = string
  default     = "demo-lab"
}

variable "location" {
  description = "Azure Region (z.B. northeurope, westeurope)"
  type        = string
  default     = "westeurope"
}

variable "vm_name" {
  description = "Name der VM"
  type        = string
  default     = "demo-vm"
}

variable "vm_size" {
  description = "Azure VM SKU"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Pfad zum SSH public key "
  type        = string
  default     = "C:/Users/nilsb/.ssh/id_rsa.pub"
}
