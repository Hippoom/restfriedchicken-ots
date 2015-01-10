#!/bin/bash -e

outputfile="ots-service/build/libs/$GO_PACKAGE_LOCAL_NEXUS_OTS_SERVICE_BINARY_ARTIFACT_ID-$GO_PACKAGE_LOCAL_NEXUS_OTS_SERVICE_BINARY_VERSION.$GO_PACKAGE_LOCAL_NEXUS_OTS_SERVICE_BINARY_PACKAGING"
url=$GO_PACKAGE_REPONAME_PKGNAME_LOCATION

echo $outputfile
echo $url

mkdir -p ots-service/build/libs
curl -o  $outputfile $url

