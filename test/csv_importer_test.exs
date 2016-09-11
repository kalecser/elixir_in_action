defmodule CSVImporterTest do
  use ExUnit.Case
  test "can import file" do
      todo_entries =
        CSVImporter.import_file("test/todo.csv")
        |> Enum.map(&(&1))

      assert [
        %TodoAppointment{date: {2013, 12, 19}, title: "Dentist"},
        %TodoAppointment{date: {2013, 12, 20}, title: "Shopping"},
        %TodoAppointment{date: {2013, 12, 19}, title: "Movies"}]
        == todo_entries
  end
end
