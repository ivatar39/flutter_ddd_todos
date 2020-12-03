import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_ddd_todos/domain/notes/i_note_repository.dart';
import 'package:flutter_ddd_todos/domain/notes/note.dart';
import 'package:flutter_ddd_todos/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';

part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(const NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(NoteActorEvent event) async* {
    yield const NoteActorState.actionProgress();
    final possibleFailure = await _noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (f) => NoteActorState.deleteFailure(f),
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}
