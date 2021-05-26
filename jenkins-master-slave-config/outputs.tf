output "Instance_Name" {
            value = "${aws_instance.server[*].tags.Name}"
        }
        output "Key_name" {
            value = "${aws_instance.server[*].key_name}"
        }
        output "public_ip" {
            value = "${aws_instance.server[*].public_ip}"
        }

