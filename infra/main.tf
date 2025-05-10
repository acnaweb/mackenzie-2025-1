resource "aws_security_group" "security_group_database" {
  name = "mackenzie_database"
  description = "Security Group EC2 Instance"

  ingress {
    description = "Inbound Rule"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    description = "Outbound Rule"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    }
}


resource "aws_db_instance" "database1" {
  allocated_storage    = 20
  db_name              = "salesforce"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Senha_0911"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible = true
  vpc_security_group_ids = [aws_security_group.security_group_database.id]
  
  tags = {
    Name = "mackenzie_database" 
  }

}