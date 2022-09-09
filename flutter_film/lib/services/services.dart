import 'dart:convert';

import 'package:flutter_film/models/models.dart';
import 'package:flutter_film/shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_film/extensions/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_session/flutter_session.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';
part 'ticket_services.dart';
part 'flutix_transaction_services.dart';
part 'shared_services.dart';
