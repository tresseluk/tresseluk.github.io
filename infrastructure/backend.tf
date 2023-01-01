terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tressel"

    workspaces {
      name = "tresseluk-github-io"
    }
  }
}