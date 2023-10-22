terraform {
    backend "s3" {
        bucket = "codeanish-terraform-state"
        key    = "tfstate"
        region = "us-east-1"
    }
}