vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

set(VERSION 1.10.0)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/microsoft/onnxruntime/releases/download/v1.10.0/onnxruntime-linux-x64-1.10.0.tgz"
    FILENAME "onnxruntime-linux-x64-1.10.0.tgz"
    SHA512 ac976bf82757919f4225cb9896e46ec017d7d0c5852a539d77c6cb38d636999742e23b5037acecf7cbb58ec5a7207548deb5567ee72fd67b0e74645507ad29bf
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    NO_REMOVE_ONE_LEVEL
    REF ${VERSION}
)

file(MAKE_DIRECTORY
        ${CURRENT_PACKAGES_DIR}/include
        ${CURRENT_PACKAGES_DIR}/lib
        ${CURRENT_PACKAGES_DIR}/bin
    )

file(COPY
        ${SOURCE_PATH}/onnxruntime-linux-x64-1.10.0/include
        DESTINATION ${CURRENT_PACKAGES_DIR}
    )

file(COPY
        ${SOURCE_PATH}/onnxruntime-linux-x64-1.10.0/lib
        DESTINATION ${CURRENT_PACKAGES_DIR}
    )

# # Handle copyright
file(INSTALL ${SOURCE_PATH}/onnxruntime-linux-x64-1.10.0/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
