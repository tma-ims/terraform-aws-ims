output "vpc_sg_id" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_security_group.allow_ssh.id
}