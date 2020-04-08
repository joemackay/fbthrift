/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#include "thrift/compiler/test/fixtures/inheritance/gen-cpp2/MyLeaf.h"
#include "thrift/compiler/test/fixtures/inheritance/gen-cpp2/MyLeaf.tcc"
#include "thrift/compiler/test/fixtures/inheritance/gen-cpp2/module_metadata.h"
#include <thrift/lib/cpp2/gen/service_cpp.h>

namespace cpp2 {
std::unique_ptr<apache::thrift::AsyncProcessor> MyLeafSvIf::getProcessor() {
  return std::make_unique<MyLeafAsyncProcessor>(this);
}


void MyLeafSvIf::do_leaf() {
  apache::thrift::detail::si::throw_app_exn_unimplemented("do_leaf");
}

folly::SemiFuture<folly::Unit> MyLeafSvIf::semifuture_do_leaf() {
  return apache::thrift::detail::si::semifuture([&] { return do_leaf(); });
}

folly::Future<folly::Unit> MyLeafSvIf::future_do_leaf() {
  return apache::thrift::detail::si::future(semifuture_do_leaf(), getThreadManager());
}


void MyLeafSvIf::async_tm_do_leaf(std::unique_ptr<apache::thrift::HandlerCallback<void>> callback) {
  apache::thrift::detail::si::async_tm(this, std::move(callback), [&] { return future_do_leaf(); });
}

void MyLeafSvNull::do_leaf() {
  return;
}

const char* MyLeafAsyncProcessor::getServiceName() {
  return "MyLeaf";
}

void MyLeafAsyncProcessor::getServiceMetadata(apache::thrift::metadata::ThriftServiceMetadataResponse& response) {
  ::apache::thrift::detail::md::ServiceMetadata<MyLeafSvIf>::gen(response.metadata, response.context);
}

void MyLeafAsyncProcessor::processSerializedRequest(apache::thrift::ResponseChannelRequest::UniquePtr req, apache::thrift::SerializedRequest&& serializedRequest, apache::thrift::protocol::PROTOCOL_TYPES protType, apache::thrift::Cpp2RequestContext* context, folly::EventBase* eb, apache::thrift::concurrency::ThreadManager* tm) {
  apache::thrift::detail::ap::process(this, std::move(req), std::move(serializedRequest), protType, context, eb, tm);
}

std::shared_ptr<folly::RequestContext> MyLeafAsyncProcessor::getBaseContextForRequest() {
  return iface_->getBaseContextForRequest();
}

const MyLeafAsyncProcessor::ProcessMap& MyLeafAsyncProcessor::getBinaryProtocolProcessMap() {
  return binaryProcessMap_;
}

const MyLeafAsyncProcessor::ProcessMap MyLeafAsyncProcessor::binaryProcessMap_ {
  {"do_leaf", &MyLeafAsyncProcessor::_processInThread_do_leaf<apache::thrift::BinaryProtocolReader, apache::thrift::BinaryProtocolWriter>},
};

const MyLeafAsyncProcessor::ProcessMap& MyLeafAsyncProcessor::getCompactProtocolProcessMap() {
  return compactProcessMap_;
}

const MyLeafAsyncProcessor::ProcessMap MyLeafAsyncProcessor::compactProcessMap_ {
  {"do_leaf", &MyLeafAsyncProcessor::_processInThread_do_leaf<apache::thrift::CompactProtocolReader, apache::thrift::CompactProtocolWriter>},
};

} // cpp2
