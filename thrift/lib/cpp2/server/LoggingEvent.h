/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <atomic>
#include <memory>
#include <string_view>
#include <utility>

#include <folly/Function.h>
#include <folly/dynamic.h>
#include <folly/io/async/AsyncTransport.h>
#include <thrift/lib/thrift/gen-cpp2/RpcMetadata_types.h>

namespace apache {
namespace thrift {

#define THRIFT_LOGGING_EVENT(KEY, FETCH_FUNC)                      \
  ([]() -> auto& {                                                 \
    static auto& handler =                                         \
        apache::thrift::getLoggingEventRegistry().FETCH_FUNC(KEY); \
    return handler;                                                \
  }())

#define THRIFT_SERVER_EVENT(NAME) \
  THRIFT_LOGGING_EVENT(#NAME, getServerEventHandler)

#define THRIFT_CONNECTION_EVENT(NAME) \
  THRIFT_LOGGING_EVENT(#NAME, getConnectionEventHandler)

#define THRIFT_APPLICATION_EVENT(NAME) \
  THRIFT_LOGGING_EVENT(#NAME, getApplicationEventHandler)

class ThriftServer;
class Cpp2Worker;
class Cpp2ConnContext;

class LoggingEventHandler {
 public:
  using DynamicFieldsCallback = folly::FunctionRef<folly::dynamic()>;
  virtual ~LoggingEventHandler() {}
};

class ServerEventHandler : public LoggingEventHandler {
 public:
  virtual void log(const ThriftServer&, DynamicFieldsCallback = {}) {}
  virtual ~ServerEventHandler() {}
};

class ConnectionLoggingContext {
 public:
  enum class TransportType {
    HEADER,
    ROCKET,
  };

  explicit ConnectionLoggingContext(
      TransportType transportType,
      const Cpp2Worker& worker,
      const Cpp2ConnContext& connContext)
      : transportType_(transportType),
        worker_(worker),
        connContext_(connContext) {}

  const Cpp2Worker& getWorker() const {
    return worker_;
  }
  const Cpp2ConnContext& getConnContext() const {
    return connContext_;
  }
  void setClientAgent(std::string clientAgent) {
    clientAgent_ = clientAgent;
  }
  void setClientHostId(std::string clientHostId) {
    clientHostId_ = clientHostId;
  }
  void setInterfaceKind(apache::thrift::InterfaceKind kind) {
    interfaceKind_ = kind;
  }
  const std::optional<std::string>& getClientAgent() const {
    return clientAgent_;
  }
  const std::optional<std::string>& getClientHostId() const {
    return clientHostId_;
  }
  TransportType getTransportType() const {
    return transportType_;
  }
  InterfaceKind getInterfaceKind() const {
    return interfaceKind_;
  }

  void readSetupMetadata(const RequestSetupMetadata& meta) {
    if (meta.clientAgent_ref()) {
      setClientAgent(*meta.clientAgent_ref());
    }
    if (meta.clientHostId_ref()) {
      setClientHostId(*meta.clientHostId_ref());
    }
    setInterfaceKind(
        meta.interfaceKind_ref().value_or(apache::thrift::InterfaceKind::USER));
  }

 private:
  TransportType transportType_;
  const Cpp2Worker& worker_;
  const Cpp2ConnContext& connContext_;

  std::optional<std::string> clientAgent_;
  std::optional<std::string> clientHostId_;
  apache::thrift::InterfaceKind interfaceKind_;
};

class ConnectionEventHandler : public LoggingEventHandler {
 public:
  virtual void log(
      const ConnectionLoggingContext&,
      DynamicFieldsCallback = {}) {}

  virtual ~ConnectionEventHandler() {}
};

class ApplicationEventHandler : public LoggingEventHandler {
 public:
  virtual void log(DynamicFieldsCallback = {}) {}
  virtual ~ApplicationEventHandler() {}
};

class LoggingEventRegistry {
 public:
  virtual ServerEventHandler& getServerEventHandler(
      std::string_view eventKey) const = 0;
  virtual ConnectionEventHandler& getConnectionEventHandler(
      std::string_view eventKey) const = 0;
  virtual ApplicationEventHandler& getApplicationEventHandler(
      std::string_view eventKey) const = 0;
  virtual ~LoggingEventRegistry() {}
};

const LoggingEventRegistry& getLoggingEventRegistry();

void useMockLoggingEventRegistry();

void logSetupConnectionEventsOnce(
    folly::once_flag& flag,
    std::string_view methodName,
    const ConnectionLoggingContext& context);

} // namespace thrift
} // namespace apache
