source "../node/plan.sh"

pkg_name=node10
pkg_origin=core
pkg_version=10.15.2
pkg_description="Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine."
pkg_license=('MIT')
pkg_upstream_url=https://nodejs.org/
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://nodejs.org/dist/v${pkg_version}/node-v${pkg_version}.tar.gz"
pkg_shasum=3b81ea6b0ae1c887ed4215d6a0b9349284c811bd98c8ddd7a0370f6cc9eb8182
pkg_dirname="node-v${pkg_version}"
