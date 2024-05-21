
resource "aws_network_acl_rule" "public_allow_all_inbound_rule" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 100
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "public_allow_all_outbound_rule" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 100
  protocol       = "tcp"
  egress = true
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "public_80" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 200
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 8080
  to_port        = 8080
}

resource "aws_network_acl_rule" "public_80_outbound" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 200
  protocol       = "tcp"
  egress = true
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 8080
  to_port        = 8080
}

resource "aws_network_acl_rule" "public_443" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 300
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "public_443_outbound" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 300
  protocol       = "tcp"
  egress = true
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "public_22" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 400
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "public_22_outbound" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 400
  protocol       = "tcp"
  egress = true
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"  
  from_port      = 22
  to_port        = 22
}
