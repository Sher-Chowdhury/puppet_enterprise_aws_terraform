# Security Group (sg) resources

resource "aws_security_group" "puppet_enterprise_sg" {
  name        = "puppet_enterprise_sg"
  description = "create ingress rules for ssh, puppet agent, mcollective, and puppet web console"

  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # puppet agent runs
  ingress {
    from_port   = 8140
    to_port     = 8140
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # mcollective
  ingress {
    from_port   = 61613
    to_port     = 61613
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # puppet enterprise web console - https
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
