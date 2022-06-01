vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

set(VERSION 1.10.0)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/microsoft/onnxruntime/releases/download/v1.10.0/onnxruntime-linux-x64-gpu-1.10.0.tgz"
    FILENAME "onnxruntime-linux-x64-gpu-1.10.0.tgz"
    SHA512 8eeca466096d9dfbf2493d7c3203abc7940a08785a318d439fc3554723f577daa172c25284f49813cc5e8a6fa02ddc7c3b938c06e2c54bcfdb68f2f745cad65e
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
        ${SOURCE_PATH}/onnxruntime-linux-x64-gpu-1.10.0/include
        DESTINATION ${CURRENT_PACKAGES_DIR}
    )

file(COPY
        ${SOURCE_PATH}/onnxruntime-linux-x64-gpu-1.10.0/lib
        DESTINATION ${CURRENT_PACKAGES_DIR}
    )

# # Handle copyright
file(INSTALL ${SOURCE_PATH}/onnxruntime-linux-x64-gpu-1.10.0/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
