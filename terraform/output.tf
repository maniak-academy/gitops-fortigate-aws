output "FGTPublicIP" {
  value = module.infra.FGTPublicIP
}

output "FGT2PublicIP" {
  value = module.infra.FGT2PublicIP
}

output "Username" {
  value = "admin"
}

output "FGT1-Password" {
  value = module.infra.FGT1-Password
}

output "FGT2-Password" {
  value = module.infra.FGT2-Password
}

output "LoadBalancerPrivateIP" {
  value = module.infra.LoadBalancerPrivateIP
}

output "LoadBalancerPrivateIP2" {
  value = module.infra.LoadBalancerPrivateIP2
}

output "CustomerVPC" {
  value = module.infra.CustomerVPC
}

output "FGTVPC" {
  value = module.infra.FGTVPC
}

output "basion_public_ip" {
   value = module.app.basion_public_ip
}