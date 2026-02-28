variable "ingress_rules" {
    default = [
        {
            port = 22
            cidr_blocks = ["0.0.0.0/0"]
            description = "allowing ports from 22"
        },
        {
            port = 443
            cidr_blocks = ["0.0.0.0/0"]
            description = "allowing ports from 443"
        }
    ]
}