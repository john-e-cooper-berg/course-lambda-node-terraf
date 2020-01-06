#!/usr/bin/env bash

set_params(){
    ROOT_DIR=$(cd .. && pwd)
    DIST_DIR="$ROOT_DIR/dist"
    BUILD_DIR="$ROOT_DIR/build"
    LAMBDA_NAME="bmi"
    CODE_VERSION=$(date +'%Y%m%d%H%M')
    ZIP_FILE="${LAMBDA_NAME}_${CODE_VERSION}.zip"

    echo "ROOT_DIR=${ROOT_DIR}"
    echo "DIST_DIR=${DIST_DIR}"
    echo "ZIP_FILE=${ZIP_FILE}"
    echo " "
}

zip_package(){
    cd "${ROOT_DIR}"
    npm install --progress=false --production

    #rm -rf ${DIST_DIR}
    mkdir -p $DIST_DIR
    zip -q -9 -r "${DIST_DIR}/${ZIP_FILE}" .

    echo "Lambda zip file has been created: ${ZIP_FILE}"
}

upload_zip_to_s3(){
    echo "Uploading lambda zip to s3 "
    cd ${DIST_DIR}
    aws s3 cp ${ZIP_FILE} s3://lambdas-bmicalc/${ZIP_FILE}
    echo "Upload successful."
}

set_params
zip_package
upload_zip_to_s3