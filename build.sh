#!/bin/sh

outpath='./lib/infrastructures/api/grpc/generated'
if [ $# != 0 ]; then
    outpath=$1
fi

echo "starting build protobuf. out dir $outpath"

protoc --proto_path=lib/infrastructures/api/grpc/protos --dart_out=grpc:$outpath lib/infrastructures/api/grpc/protos/vtproto_account/account.proto
if [ $? != 0 ]; then
    exit 1
fi


protoc --proto_path=lib/infrastructures/api/grpc/protos --dart_out=grpc:$outpath lib/infrastructures/api/grpc/protos/vtproto_error/error.proto
if [ $? != 0 ]; then
    exit 1
fi

echo 'build protobuf success!'
