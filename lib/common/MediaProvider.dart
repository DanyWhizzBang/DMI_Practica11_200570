import 'dart:async';
import 'package:dmi_practica11_200070/model/Media.dart';
import 'package:dmi_practica11_200070/common/HttpHandler.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia();
}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchMovies();
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
    Future<List<Media>> fetchMedia(){
      return _client.fetchShow();
    }
}