include(vcpkg_common_functions)
vcpkg_download_distfile(ARCHIVE
    URL "http://download.osgeo.org/libtiff/tiff-4.0.6.tar.gz"
    FILENAME "tiff-4.0.6.tar.gz"
    MD5 d1d2e940dea0b5ad435f21f03d96dd72
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/tiff-4.0.6
    OPTIONS -Dcxx=OFF
)

vcpkg_build_cmake()
vcpkg_install_cmake()

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
    ${CURRENT_PACKAGES_DIR}/debug/share
    ${CURRENT_PACKAGES_DIR}/share
)
file(COPY
    ${CURRENT_BUILDTREES_DIR}/src/tiff-4.0.6/COPYRIGHT
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/tiff
)
file(RENAME
    ${CURRENT_PACKAGES_DIR}/share/tiff/COPYRIGHT
    ${CURRENT_PACKAGES_DIR}/share/tiff/c2
)
file(RENAME
    ${CURRENT_PACKAGES_DIR}/share/tiff/c2
    ${CURRENT_PACKAGES_DIR}/share/tiff/copyright
)
file(GLOB EXES ${CURRENT_PACKAGES_DIR}/bin/*.exe ${CURRENT_PACKAGES_DIR}/debug/bin/*.exe)
file(REMOVE ${EXES})
vcpkg_copy_pdbs()
