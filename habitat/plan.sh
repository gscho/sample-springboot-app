pkg_name=sample-springboot-app
pkg_origin=gscho
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("MIT")
pkg_deps=(core/jre8 core/curl)
pkg_build_deps=(core/maven)

do_build(){
  mvn clean package
}

do_install(){
  cp "target/sample-springboot-app-$pkg_version.jar" "$pkg_prefix/"
  chmod +x "$pkg_prefix/sample-springboot-app-$pkg_version.jar"
}

