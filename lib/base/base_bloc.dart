import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'base_event.dart';

abstract class BaseBloc<E extends BaseEvent,S extends Equatable> {

  final StreamController<E> _eventStreamController = StreamController<E>();

  final StreamController<S> _stateStreamController = StreamController<S>.broadcast();

  final  StreamController<bool> _loadingStreamController = StreamController<bool>();

  Sink<E> get event => _eventStreamController.sink;

  Sink<S> get state => _stateStreamController.sink;

  Stream<S> get stateStream => _stateStreamController.stream;

  Stream<bool> get loadingStream => _loadingStreamController.stream;

  Sink<bool> get loadingSink => _loadingStreamController.sink;

  BaseBloc() {
    _eventStreamController.stream.listen((event) {
      if (event is! E) {
        throw Exception("Invalid event");
      }
      dispatchEvent(event);
    });
  }

  void dispatchEvent(E event);

  @mustCallSuper
  void dispose() {
    _eventStreamController.close();
    _stateStreamController.close();
  }
}
