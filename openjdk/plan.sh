pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_name=openjdk
pkg_version=10.0.2
pkg_dirname=jdk10u
pkg_source=http://hg.openjdk.java.net/jdk-updates/jdk10u
pkg_license=('TODO')
pkg_description=('TODO')
pkg_upstream_url=http://openjdk.java.net/projects/jdk8u/
pkg_deps=(
  core/glibc
  core/gcc-libs
)
pkg_build_deps=(
  core/mercurial
  core/gcc
  core/make
  core/bash
  core/diffutils
  core/pkg-config
  core/cpio
  core/which
  core/zip
  core/jdk9
  core/xlib
  core/xproto # for X.h and shape.h
  core/libxext # ...which requires shapeconst.h, provided by:
  core/xextproto # ...which requires Xrender.h, provided by:
  core/libxrender # ... which requires render.h, provided by:
  core/renderproto
  core/libice
  core/libxtst # for XTest.h, which requires XInput.h, provided by:
  core/libxi # which require XI.h, provided by:
  core/inputproto
  core/libxt # for Intrinsic.h
  scotthain/cups
  core/zlib # required for freetype
  core/libpng # required for freetype
  core/freetype
  core/alsa-lib
)
pkg_bin_dirs=(bin jre/bin)
pkg_lib_dirs=(lib lib/amd64)
pkg_include_dirs=(include)

do_download() {
  # Download OpenJDK source from Mercurial repo per instructions here:
  # http://openjdk.java.net/guide/repositories.html#clone
  REPO_PATH="$HAB_CACHE_SRC_PATH/$pkg_dirname"
  # rm -rf "$REPO_PATH"
  # mkdir -p "$REPO_PATH"
  # hg clone $pkg_source "$REPO_PATH"
}

do_unpack() {
  return 0
}

do_clean() {
  return 0
}

do_verify() {
  return 0
}

do_build() {
  LIBS="$LDFLAGS"
  
  $(pkg_path_for bash)/bin/bash \
    ./configure \
    --prefix=${pkg_prefix} \
    --with-boot-jdk=$(pkg_path_for jdk9) \
    --with-extra-cflags="$CFLAGS" \
    --with-extra-cxxflags="$CXXFLAGS" \
    --with-extra-ldflags="$LDFLAGS"

  $(pkg_path_for make)/bin/make images
}

do_check() {
  ./build/*/images/jdk/bin/java -version
  $(pkg_path_for make)/bin/make run-test-tier1
}