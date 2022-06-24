module "demomodule" {
  source = "git::https://github.com/example/tmp-repo.git"
}

module "demomodule2" {
  source = "git::https://github.com/example/tmp-repo.git?ref=development"
}

module "demomodule3" {
  source = "github.com/example/tmp-repo"
}
