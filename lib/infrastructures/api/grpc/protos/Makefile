PROTO_PATH = $(shell pwd)


ERROR_PROTOFILE=$(wildcard $(PROTO_PATH)/vtproto_error/*.proto)

SERVICE_PROTOFILE=
SERVICE_PROTOFILE+=$(wildcard $(PROTO_PATH)/vtproto_account/*.proto)
SERVICE_PROTOFILE+=$(wildcard $(PROTO_PATH)/vtproto_asset/*.proto)
SERVICE_PROTOFILE+=$(wildcard $(PROTO_PATH)/vtproto_auto/*.proto)
SERVICE_PROTOFILE+=$(wildcard $(PROTO_PATH)/vtproto_market/*.proto)
SERVICE_PROTOFILE+=$(wildcard $(PROTO_PATH)/vtproto_article/*.proto)

PROTOFILE=$(ERROR_PROTOFILE) $(SERVICE_PROTOFILE)
PROTOGWFILE=$(SERVICE_PROTOFILE)

include build.mk
