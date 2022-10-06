resource "azurerm_virtual_machine" "my-linux-vm_dd2" {
  name                  = "my-linux-vm"
  location              = "California"
  resource_group_name   = "some-rg"
  network_interface_ids = ["some-id"]
  vm_size               = "Standard_DS1_v2"

  storage_data_disk {
    create_option = "Empty"
    lun           = 0
    name          = "my-data-disk"
    managed_disk_type = "Standard_LRS"
    #managed_disk_id = azurerm_managed_disk.my-managed-disk.id
  }
  
  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    os_type           = "Windows"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    managed_disk_id = azurerm_managed_disk.my-managed-disk.id
  }

  os_profile_windows_config {
  }
}

resource "azurerm_managed_disk" "my-managed-disk_dd2" {
  create_option        = "Empty"
  location             = "California"
  name                 = "my-managed-disk-1"
  resource_group_name  = "some-rg"
  storage_account_type = "Standard_LRS"
  disk_encryption_set_id = ""
}

resource "azurerm_key_vault" "example_dd2" {
  name                        = "des-example-keyvault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "premium"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
}

resource "azurerm_key_vault_key" "example_dd2" {
  name         = "des-example-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_disk_encryption_set" "example_dd2" {
  name                = "des"
  resource_group_name = "some-rg"
  location            = "California"
  key_vault_key_id    = azurerm_key_vault_key.example.id
  encryption_type     = "EncryptionAtRestWithCustomerKey"
  identity {
    type = "SystemAssigned"
  }
}

