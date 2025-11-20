
import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/bookly_app.dart';
import 'package:flutter_bookly_app/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/service_locator.dart';
import 'features/home/domain/entities/book_entity.dart';


Future<void> main() async { 
  await setupApp();
  runApp(const BooklyApp());
}

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kHomeBooksBox);
  await Hive.openBox<BookEntity>(kBestBooksBox);
  await Hive.openBox<BookEntity>(kOlsoLikeBooksBox);
  setupServiceLocator();
}

