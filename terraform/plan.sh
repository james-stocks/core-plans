pkg_name=terraform
pkg_origin=core
pkg_version=0.11.13
pkg_license=('MPL-2.0')
pkg_description="Terraform is a tool for building, changing, and combining infrastructure safely and efficiently"
pkg_upstream_url="http://www.terraform.io/"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source=https://releases.hashicorp.com/${pkg_name}/${pkg_version}/${pkg_name}_${pkg_version}_linux_amd64.zip
pkg_filename=${pkg_name}_${pkg_version}_linux_amd64.zip
pkg_shasum=5925cd4d81e7d8f42a0054df2aafd66e2ab7408dbed2bd748f0022cfe592f8d2
pkg_build_deps=(core/unzip)
pkg_deps=()
pkg_bin_dirs=(bin)

# The pkg_filename does not extract into a folder. We need to force it.
do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  unzip "${pkg_filename}" -d "${pkg_name}-${pkg_version}"
}

do_build() {
  return 0
}

do_install() {
  install -D terraform "${pkg_prefix}/bin/terraform"
}
