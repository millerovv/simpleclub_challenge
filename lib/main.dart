import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleclub_challenge/data/repository/content_repository.dart';
import 'package:simpleclub_challenge/presentation/app/app.dart';
import 'package:simpleclub_challenge/presentation/bloc/content_cubit.dart';

void main() => runApp(RepositoryProvider<ContentRepository>(
    create: (_) => ContentRepository(),
    child: BlocProvider(
      create: (context) => ContentCubit(context.read<ContentRepository>()),
      child: const App(),
    )));
