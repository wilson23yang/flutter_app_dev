PROTOC=protoc
RM=/bin/rm -f

SOURCES?=.


REALPROTOC=$(PROTOC) $(PINC)


GOFILE=$(PROTOFILE:.proto=.pb.go)
GODFILE=$(GOFILE:.pb.go=.pb.go.d)

GWFILE=$(PROTOGWFILE:.proto=.pb.gw.go)
GWDFILE=$(PROTOFILE:.proto=.pb.gw.go.d)

GENFILE=$(GOFILE) $(GWFILE)

.PHONY: all clean


all:$(GENFILE)


%.pb.go: %.proto
	$(REALPROTOC) --proto_path=$(shell pwd) --go_out=paths=source_relative,plugins=grpc:$(shell pwd)  --dependency_out=$@.d $<

%.pb.gw.go: %.proto
	$(REALPROTOC) --proto_path=$(shell pwd) --grpc-gateway_out=paths=source_relative,logtostderr=true:$(shell pwd) --dependency_out=$@.d $<

clean:
	$(RM) $(GOFILE) $(GWFILE) $(GODFILE) $(GWDFILE)

-include $(GODFILE)
-include $(GWDFILE)
