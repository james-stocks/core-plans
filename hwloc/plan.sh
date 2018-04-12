pkg_name=hwloc
pkg_origin=core
pkg_major_minor=2.0
pkg_version="${pkg_major_minor}.1"
pkg_description="Portable Hardware Locality"
pkg_upstream_url=https://www.open-mpi.org/software/hwloc
pkg_license=('BSD-2-Clause')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://www.open-mpi.org/software/hwloc/v${pkg_major_minor}/downloads/hwloc-${pkg_version}.tar.gz"
pkg_shasum=f1156df22fc2365a31a3dc5f752c53aad49e34a5e22d75ed231cd97eaa437f9d
pkg_deps=(core/glibc core/gcc-libs)
pkg_build_deps=(core/gcc core/make core/diffutils)
pkg_bin_dirs=(bin sbin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)

do_check() {
  make check
}
