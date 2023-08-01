output "instances_id" {
  description = "The ID of the VPC"
  value       = aws_instance.this.*.id
}

output "instances_eip" {
  description = "The EIP of the EC2"
  value       = aws_eip.web.*.public_ip
}

output "instances_eip_dns" {
  description = "The EIP of the EC2"
  value       = aws_eip.web.*.public_dns
}