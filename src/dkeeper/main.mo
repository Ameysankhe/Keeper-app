import List "mo:base/List";
import Text "mo:base/Text";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor Dkeeper {
  //Defining the type of data we are storing
  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {

    let newNote: Note = {
      title = titleText;
      content = contentText
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  public func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id: Nat) {
    //take drop append
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id + 1);
    notes := List.append(listFront, listBack);
  }

}