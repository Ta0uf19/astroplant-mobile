import 'dart:convert';
import 'package:app/data/endpoints.dart';
import 'package:app/models/kit/raw_measurement.dart';
import 'package:web_socket_channel/io.dart';

class KitWebSocket {

    static int _webSocketRequestId = 0;
    final IOWebSocketChannel channel = IOWebSocketChannel.connect(Endpoints.wsUrl);
    int subscriptionId;

    String _prepareRpcRequest(String method, dynamic params) {
        return json.encode({
            'jsonrpc': '2.0',
            'id': _webSocketRequestId++,
            'method': method,
            'params': params,
        });
    }

    /// Subscribe to raw measurements
    void subscribeMeasurements(String kitSerial) {
        var data = _prepareRpcRequest('subscribe_rawMeasurements', {'kitSerial': kitSerial}).toString();
        channel.sink.add(data);
    }

    /// Get stream
    Stream<RawMeasurement> getStreamMeasurements() {
        return channel.stream
            .map((event) => json.decode(event))
            .where((event) => event.containsKey('params') == true)
            .map((event) => event['params'])
            .map((event) => RawMeasurement.fromJson(event['result']))
            .asBroadcastStream()
        ;
    }

    /// Close socket
    void close() {
        // TODO : send unsubscribe_rawMeasurements
        var data = _prepareRpcRequest('unsubscribe_rawMeasurements', {'subscription': subscriptionId}).toString();
        channel.sink.close();
    }
}