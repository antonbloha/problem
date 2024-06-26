output "domain-name" {
  value = aws_instance.example.public_dns
}

output "application-url" {
  value = "${aws_instance.example.public_dns}/index.php"
}